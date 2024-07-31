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
        table.insert(recipe.ingredients, {type = "item", name = item1, amount = 2})
        table.insert(recipe.ingredients, {type = "item", name = item2, amount = 2})
    elseif recipe.normal and recipe.normal.ingredients then
        table.insert(recipe.normal.ingredients, {type = "item", name = item1, amount = 2})
        table.insert(recipe.normal.ingredients, {type = "item", name = item2, amount = 2})
    elseif recipe.expensive and recipe.expensive.ingredients then
        table.insert(recipe.expensive.ingredients, {type = "item", name = item1, amount = 2})
        table.insert(recipe.expensive.ingredients, {type = "item", name = item2, amount = 2})
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

---@param recipe data.RecipePrototype
function arcotorio_util.modify_results(recipe, item1, item2, scale)
    if recipe.results then
        if #recipe.results == 1 then
            recipe.main_product = recipe.results[1].name or recipe.results[1][1]
            if recipe.results[1].type == "fluid" then 
                fix_icon(recipe, data.raw["fluid"][recipe.results[1].name or recipe.results[1][1]])
            else
                fix_icon(recipe, return_item(recipe.results[1].name or recipe.results[1][1]))
            end
        end
        table.insert(recipe.results, {type = "item", name = item1, amount = 2 * scale})
        table.insert(recipe.results, {type = "item", name = item2, amount = 2 * scale})
    elseif recipe.normal and recipe.normal.results then
        table.insert(recipe.normal.results, {type = "item", name = item1, amount = 2 * scale})
        table.insert(recipe.normal.results, {type = "item", name = item2, amount = 2 * scale})
    elseif recipe.expensive and recipe.expensive.results then
        table.insert(recipe.expensive.results, {type = "item", name = item1, amount = 2 * scale})
        table.insert(recipe.expensive.results, {type = "item", name = item2, amount = 2 * scale})
    elseif recipe.result then
        local original_item = return_item(recipe.result)
        recipe.main_product = original_item.name
        recipe.results = {
            {type = "item", name = original_item.name, amount = 1},
            {type = "item", name = item1, amount = 2 * scale},
            {type = "item", name = item2, amount = 2 * scale}
        }
        fix_icon(recipe, original_item)
        recipe.result = nil
    end
end

return arcotorio_util
