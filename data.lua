require("prototypes.entities")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.category")



local items = {
    "Walmart-McArco-sphere",
    "McDonalds-McArco-sphere",
    "Tesco-McArco-sphere",
    "Wendys-McArco-sphere",
    "Subway-McArco-sphere",
    "White-Castle-McArco-sphere",
    "Taco-Bell-McArco-sphere",
    "KFC-McArco-sphere",
    "Jimmy-Johns-McArco-sphere"
}

local function pick_two_items()
    local shuffled = {}
    for i = 1, #items do
        shuffled[i] = items[i]
    end
    for i = #shuffled, 2, -1 do
        local j = math.random(i)
        shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
    end
    return shuffled[1], shuffled[2]
end

local function add_ingredients(recipe, item1, item2)
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

local function add_results(recipe, item3, item4)
    if recipe.results then
        table.insert(recipe.results, {type = "item", name = item3, amount = 2})
        table.insert(recipe.results, {type = "item", name = item4, amount = 2})
    elseif recipe.normal and recipe.normal.results then
        table.insert(recipe.normal.results, {type = "item", name = item3, amount = 2})
        table.insert(recipe.normal.results, {type = "item", name = item4, amount = 2})
    elseif recipe.expensive and recipe.expensive.results then
        table.insert(recipe.expensive.results, {type = "item", name = item3, amount = 2})
        table.insert(recipe.expensive.results, {type = "item", name = item4, amount = 2})
    elseif recipe.result then
        local original_result = recipe.result
        recipe.result = nil
        recipe.results = {
            {type = "item", name = original_result, amount = 1},
            {type = "item", name = item3, amount = 2},
            {type = "item", name = item4, amount = 2}
        }
    end
end

for _, recipe in pairs(data.raw.recipe) do
    if not recipe.name:find("barrel") then
        local item1, item2 = pick_two_items()
        local item3, item4 = pick_two_items()        
        add_ingredients(recipe, item1, item2)
        add_results(recipe, item3, item4)
    end
end
