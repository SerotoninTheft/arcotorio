local arcotorio_util = {}

function arcotorio_util.pick_two_items(item_table)
    local shuffled = table.deepcopy(item_table)
    for i = #shuffled, 2, -1 do
        local j = math.random(i)
        local temp = shuffled[i]
        shuffled[i] = shuffled[j]
        shuffled[j] = temp
    end
    return {item1 = shuffled[1], item2 = shuffled[2]}
end

---@param recipe data.RecipePrototype
function arcotorio_util.modify_ingredients(recipe, item1, item2, scale, improve)
    if improve < 1 then scale = 1 end
    ---@param ingredients table<int, data.IngredientPrototype>
    local scale_ingredients = function(ingredients)
        for _, ingredient in pairs(ingredients) do
            ingredient.name = ingredient.name or ingredient[1]
            ingredient.amount = (ingredient.amount or ingredient[2]) * scale
            ingredient[1], ingredient[2] = nil, nil
        end
    end

    if recipe.ingredients then
        scale_ingredients(recipe.ingredients)
        table.insert(recipe.ingredients, {type = "item", name = item1, amount = scale})
        table.insert(recipe.ingredients, {type = "item", name = item2, amount = scale})
    elseif recipe.normal and recipe.normal.ingredients then
        scale_ingredients(recipe.normal.ingredients)
        table.insert(recipe.normal.ingredients, {type = "item", name = item1, amount = scale})
        table.insert(recipe.normal.ingredients, {type = "item", name = item2, amount = scale})
    elseif recipe.expensive and recipe.expensive.ingredients then
        scale_ingredients(recipe.expensive.ingredients)
        table.insert(recipe.expensive.ingredients, {type = "item", name = item1, amount = scale})
        table.insert(recipe.expensive.ingredients, {type = "item", name = item2, amount = scale})
    end
end

local function return_item(name)
    local categories = {
        "item",
        "tool",
        "gun",
        "ammo",
        "armor",
        "rail-planner",
        "locomotive",
        "cargo-wagon",
        "car",
        "fluid-wagon",
        "active-defense-equipment",
        "battery-equipment",
        "belt-immunity-equipment",
        "energy-shield-equipment",
        "generator-equipment",
        "movement-bonus-equipment",
        "night-vision-equipment",
        "roboport-equipment",
        "solar-panel-equipment",
        "capsule",
        "module",
        "artillery-wagon",
        "spidertron-remote",
        "spider-vehicle",
        "repair-tool"
    }
    for _, category in pairs(categories) do
        if data.raw[category][name] then return data.raw[category][name] end
    end
    error( "Error: '" .. name .. "' does not belong to one of the pre-defined categories")
end

local function fix_icon(recipe, item)
    if item.icon then
        recipe.icon = item.icon
        recipe.icon_size = item.icon_size
    elseif recipe.icons then
        recipe.icons = item.icons
    else
        error("Error: neither icons nor icon exists")
    end
end

local function preserve_icon(recipe, results)
    recipe.main_product = results[1].name or results[1][1]
    if recipe.results[1].type == "fluid" then
        fix_icon(recipe, data.raw["fluid"][results[1].name or results[1][1]])
    else
        fix_icon(recipe, return_item(results[1].name or results[1][1]))
    end
end

local function modify_original(results, scale)
    for _, result in pairs(results) do
        if result.amount then
            result.amount = result.amount * scale
        elseif result.amount_min and result.amount_max then
            result.amount_min = result.amount_min * scale
            result.amount_max = result.amount_max * scale
        else
            result[2] = result[2] * scale
        end
    end
end
---AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH we should try and reduce the size of this
---@param recipe data.RecipePrototype
function arcotorio_util.modify_results(recipe, item1, item2, scale, improve)
    local single_result = function(recipe_container)
        local original_item = return_item(recipe_container.result)
        recipe_container.main_product = original_item.name
        recipe_container.results = {
            {type = "item", name = original_item.name, amount = (recipe_container.result_count or 1) * (scale + improve)},
            {type = "item", name = item1, amount = scale},
            {type = "item", name = item2, amount = scale}
        }
        fix_icon(recipe, original_item)
        recipe_container.result = nil
        recipe_container.result_count = nil
    end

    local mutli_result = function(recipe_container)
        if #recipe_container.results == 1 then
            preserve_icon(recipe, recipe_container.results)
        end
        modify_original(recipe_container.results, (scale + improve))
        table.insert(recipe_container.results, {type = "item", name = item1, amount = scale})
        table.insert(recipe_container.results, {type = "item", name = item2, amount = scale})
    end
    
    local process_recipe = function(recipe_container)
        if recipe_container.results then
            mutli_result(recipe_container)
        elseif recipe_container.result then
            single_result(recipe_container)
        end
    end

    if recipe.normal then process_recipe(recipe.normal) end
    if recipe.expensive then process_recipe(recipe.expensive) end
    if recipe.results or recipe.result then process_recipe(recipe) end
end

return arcotorio_util
