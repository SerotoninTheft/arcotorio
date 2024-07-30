local arcotorio_util = {}

function arcotorio_util.pick_two_items(item_table)
    local shuffled = {}
    for i = 1, #item_table do
        shuffled[i] = item_table[i]
    end
    for i = #shuffled, 2, -1 do
        local j = math.random(i)
        shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
    end
    return shuffled[1], shuffled[2]
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

function arcotorio_util.modify_results(recipe, item1, item2, scale)
    if recipe.results then
        table.insert(recipe.results, {type = "item", name = item1, amount = 2 * scale})
        table.insert(recipe.results, {type = "item", name = item2, amount = 2 * scale})
    elseif recipe.normal and recipe.normal.results then
        table.insert(recipe.normal.results, {type = "item", name = item1, amount = 2 * scale})
        table.insert(recipe.normal.results, {type = "item", name = item2, amount = 2 * scale})
    elseif recipe.expensive and recipe.expensive.results then
        table.insert(recipe.expensive.results, {type = "item", name = item1, amount = 2 * scale})
        table.insert(recipe.expensive.results, {type = "item", name = item2, amount = 2 * scale})
    elseif recipe.result then
        local original_result = recipe.result
        recipe.result = nil
        recipe.results = {
            {type = "item", name = original_result, amount = 1},
            {type = "item", name = item1, amount = 2 * scale},
            {type = "item", name = item2, amount = 2 * scale}
        }
    end
end

return arcotorio_util
