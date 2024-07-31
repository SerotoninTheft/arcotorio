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

function arcotorio_util.add_ingredients(recipe, item1, item2)
    if recipe.ingredients then
        table.insert(recipe.ingredients, {type = "item", name = item1, amount = 1})
        table.insert(recipe.ingredients, {type = "item", name = item2, amount = 1})
    elseif recipe.normal and recipe.normal.ingredients then
        table.insert(recipe.normal.ingredients, {type = "item", name = item1, amount = 1})
        table.insert(recipe.normal.ingredients, {type = "item", name = item2, amount = 1})
    elseif recipe.expensive and recipe.expensive.ingredients then
        table.insert(recipe.expensive.ingredients, {type = "item", name = item1, amount = 1})
        table.insert(recipe.expensive.ingredients, {type = "item", name = item2, amount = 1})
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
        "spider-vehicle"
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
        error("Error: neither icon nor icon exists")
    end
end

local function preserve_icon(recipe, results)
    recipe.main_product = recipe.results[1].name or recipe.results[1][1]
    if recipe.results[1].type == "fluid" then
        fix_icon(recipe, data.raw["fluid"][recipe.results[1].name or recipe.results[1][1]])
    else
        fix_icon(recipe, return_item(recipe.results[1].name or recipe.results[1][1]))
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
function arcotorio_util.modify_results(recipe, item1, item2, scale)
    if recipe.results then
        if #recipe.results == 1 then
            preserve_icon(recipe, recipe.results)
        end
        modify_original(recipe.results, scale)
        table.insert(recipe.results, {type = "item", name = item1, amount = 1})
        table.insert(recipe.results, {type = "item", name = item2, amount = 1})
    elseif recipe.normal then
        if recipe.normal.results then
            if #recipe.normal.results == 1 then
                preserve_icon(recipe, recipe.results)
            end
            modify_original(recipe.normal.results, scale)
            table.insert(recipe.normal.results, {type = "item", name = item1, amount = 1})
            table.insert(recipe.normal.results, {type = "item", name = item2, amount = 1})
        else
            local original_item = return_item(recipe.normal.result)
            recipe.normal.main_product = original_item.name
            recipe.normal.results = {
                {type = "item", name = original_item.name, amount = (recipe.normal.result_count or 1) * scale},
                {type = "item", name = item1, amount = 1},
                {type = "item", name = item2, amount = 1}
            }
            fix_icon(recipe, original_item)
            recipe.normal.result = nil
            recipe.normal.result_count = nil
        end
    elseif recipe.expensive then
        if recipe.expensive.results then
            if #recipe.expensive.results == 1 then
                preserve_icon(recipe, recipe.results)
            end
            modify_original(recipe.expensive.results, scale)
            table.insert(recipe.expensive.results, {type = "item", name = item1, amount = 1})
            table.insert(recipe.expensive.results, {type = "item", name = item2, amount = 1})
        else
            local original_item = return_item(recipe.expensive.result)
            recipe.expensive.main_product = original_item.name
            recipe.expensive.results = {
                {type = "item", name = original_item.name, amount = (recipe.expensive.result_count or 1) * scale},
                {type = "item", name = item1, amount = 1},
                {type = "item", name = item2, amount = 1}
            }
            fix_icon(recipe, original_item)
            recipe.expensive.result = nil
            recipe.expensive.result_count = nil
        end
    elseif recipe.result then
        local original_item = return_item(recipe.result)
        recipe.main_product = original_item.name
        recipe.results = {
            {type = "item", name = original_item.name, amount = (recipe.result_count or 1) * scale},
            {type = "item", name = item1, amount = 1},
            {type = "item", name = item2, amount = 1}
        }
        fix_icon(recipe, original_item)
        recipe.result = nil
        recipe.result_count = nil
    end
end

return arcotorio_util
