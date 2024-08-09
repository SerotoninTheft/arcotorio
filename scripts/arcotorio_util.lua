local arcotorio_util = {}

function arcotorio_util.pick_two_items(item_table, seed)
    local pick_one = ((seed + 1) * (#item_table + 1) % #item_table) + 1
    local pick_two = (((seed) * (#item_table + 1)) % #item_table) + 1
    if pick_one == pick_two then error() end
    return {item1 = item_table[pick_one], item2 = item_table[pick_two]}
end

---@param recipe data.RecipePrototype
function arcotorio_util.modify_ingredients(recipe, item1, item2, scale, improve)
    if improve < 1 then scale = 1 end

    --[[ if recipe.name == "kr-vc-Rock-Arco-bead" then
        log ("E")
    end ]]

    ---@param ingredients table<int, data.IngredientPrototype>
    local scale_ingredients = function(ingredients)
        for _, ingredient in pairs(ingredients) do
            ingredient.name = ingredient.name or ingredient[1]
            ingredient.amount = (ingredient.amount or ingredient[2]) * scale
            ingredient[1], ingredient[2] = nil, nil
        end
    end

    if recipe.ingredients then
        --delinks ingredient tables shared between RecipeDatas
        recipe.ingredients = table.deepcopy(recipe.ingredients)
        if recipe.ingredients[1] then
            scale_ingredients(recipe.ingredients)
            table.insert(recipe.ingredients, {type = "item", name = item1, amount = scale})
            table.insert(recipe.ingredients, {type = "item", name = item2, amount = scale})
        else
            log("Arcotorio WARNING: A recipe ("
            ..recipe.name..
            ") has no ingredients. This may be fine, but if you are experiencing issues please contact mod author")
            return false
        end
    elseif recipe.normal and recipe.expensive then
        --delinks ingredient tables shared between RecipeDatas
        recipe.normal = table.deepcopy(recipe.normal)
        recipe.expensive = table.deepcopy(recipe.normal)

        scale_ingredients(recipe.normal.ingredients)
        scale_ingredients(recipe.expensive.ingredients)
        table.insert(recipe.normal.ingredients, {type = "item", name = item1, amount = scale})
        table.insert(recipe.normal.ingredients, {type = "item", name = item2, amount = scale})
        table.insert(recipe.expensive.ingredients, {type = "item", name = item1, amount = scale})
        table.insert(recipe.expensive.ingredients, {type = "item", name = item2, amount = scale})
    else
        log("Arcotorio WARNING: A recipe ("
        ..recipe.name..
        ") has no ingredients. This may be fine, but if you are experiencing issues please contact mod author")
        return false
    end
    return true
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
        "repair-tool",
        "item-with-tags",
        "fluid"
    }
    for _, category in pairs(categories) do
        if data.raw[category][name] then return data.raw[category][name] end
    end
    return nil
end

---@param recipe data.RecipePrototype
---@param item data.ItemPrototype
local function fix_icon(recipe, item)
    recipe.icon_size = item.icon_size
    if item.icon then
        recipe.icon = item.icon
    elseif item.icons then
        recipe.icons = item.icons
    else
        error("Arcotorio: Item has no icon: " .. item.name)
    end
end

local function modify_original(results, scale, improve)
    for _, result in pairs(results) do
        if result.amount then
            result.amount = result.amount * (scale + improve)
        elseif result.amount_min and result.amount_max then
            result.amount_min = result.amount_min * (scale + improve)
            result.amount_max = result.amount_max * (scale + improve)
        else
            result[2] = result[2] * scale
        end
    end
end

---@param recipe data.RecipePrototype
function arcotorio_util.modify_results(recipe, item1, item2, scale, improve)
    ---@param recipe_container data.RecipePrototype
    local single_result = function(recipe_container)
        recipe_container.main_product =
            recipe_container.main_product or
            recipe_container.result

        if recipe_container.results then
            recipe_container.main_product = recipe_container.results[1].name or
                recipe_container.results[1][1]

            modify_original(recipe_container.results, scale, improve)
            recipe_container.results[1] = {
                type = recipe_container.results[1].type or "item",
                name = recipe_container.results[1].name or
                    recipe_container.results[1][1],
                amount = (recipe_container.results[1].amount or
                    recipe_container.results[1][2]),
                amount_min = recipe_container.results[1].amount_min,
                amount_max = recipe_container.results[1].amount_max,
                fluidbox_index = recipe_container.results[1].fluidbox_index
            }
        else
            recipe_container.results = recipe_container.results or {}
            table.insert(recipe_container.results, {type = "item", name = recipe_container.result, amount = (recipe_container.result_count or 1) * (scale + improve)})
        end
        table.insert(recipe_container.results, {type = "item", name = item1, amount = scale, catalyst_amount = scale})
        table.insert(recipe_container.results, {type = "item", name = item2, amount = scale, catalyst_amount = scale})

        local item = return_item(recipe_container.main_product)
        if item and not recipe.icons and not recipe.icon then fix_icon(recipe, item) end
        recipe_container.result = nil
        recipe_container.result_count = nil
    end

    local multi_result = function(recipe_container)
        recipe_container.main_product = recipe_container.main_product or
            recipe_container.results[1].name or
            recipe_container.results[1][1]

        modify_original(recipe_container.results, scale, improve)
        table.insert(recipe_container.results, {type = "item", name = item1, amount = scale})
        table.insert(recipe_container.results, {type = "item", name = item2, amount = scale})
    end
    
    local process_recipe = function(recipe_container)
        if recipe_container == nil then return end

        if not recipe_container.result and recipe_container.results and not recipe_container.results[1] then
            log("Arcotorio WARNING: A recipe ("
            ..recipe.name..
            ") has no result. This may be fine, but if you are experiencing issues please contact mod author")
            return false
        end

        if recipe_container.result or (recipe_container.results and #recipe_container.results == 1) then
            single_result(recipe_container)
        elseif recipe_container.results then
            multi_result(recipe_container)
        end
        return true
    end

    if improve < 1 then scale = 1 end

    if process_recipe(recipe.normal) or process_recipe(recipe.expensive) or process_recipe(recipe) then
        return true
    end
    return false
end

return arcotorio_util
