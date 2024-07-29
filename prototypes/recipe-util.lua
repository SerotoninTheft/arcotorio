util = {
    ---Takes a table and returns two entries from that table
    pick_two_items = function(table)
        local shuffled = {}
        for i = 1, #table do
            shuffled[i] = table[i]
        end
        for i = #shuffled, 2, -1 do
            local j = math.random(i)
            shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
        end
        return shuffled[1], shuffled[2]
    end,

    add_ingredients = function(recipe, item1, item2)
        if recipe.ingredients then
            table.insert(recipe.ingredients, {type = "item", name = item1, amount = 2, catalyst_amount = 2})
            table.insert(recipe.ingredients, {type = "item", name = item2, amount = 2, catalyst_amount = 2})
        elseif recipe.normal and recipe.normal.ingredients then
            table.insert(recipe.normal.ingredients, {type = "item", name = item1, amount = 2, catalyst_amount = 2})
            table.insert(recipe.normal.ingredients, {type = "item", name = item2, amount = 2, catalyst_amount = 2})
        elseif recipe.expensive and recipe.expensive.ingredients then
            table.insert(recipe.expensive.ingredients, {type = "item", name = item1, amount = 2, catalyst_amount = 2})
            table.insert(recipe.expensive.ingredients, {type = "item", name = item2, amount = 2, catalyst_amount = 2})
        end
    end,

    modify_results = function(recipe, item3, item4, scale)
        if recipe.results then
            if #recipe.results == 1 then
                recipe.main_product = recipe.results[1].name
            end
            for _, result in pairs(recipe.results) do
                result.amount = result.amount * scale
            end
            table.insert(recipe.results, {type = "item", name = item3, amount = 2, catalyst_amount = 2})
            table.insert(recipe.results, {type = "item", name = item4, amount = 2, catalyst_amount = 2})
        elseif recipe.normal and recipe.normal.results then
            for _, result in pairs(recipe.normal.results) do
                result.amount = result.amount * scale
            end
            table.insert(recipe.normal.results, {type = "item", name = item3, amount = 2, catalyst_amount = 2})
            table.insert(recipe.normal.results, {type = "item", name = item4, amount = 2, catalyst_amount = 2})
        elseif recipe.expensive and recipe.expensive.results then
            for _, result in pairs(recipe.expensive.results) do
                result.amount = result.amount * scale
            end
            table.insert(recipe.expensive.results, {type = "item", name = item3, amount = 2, catalyst_amount = 2})
            table.insert(recipe.expensive.results, {type = "item", name = item4, amount = 2, catalyst_amount = 2})
        elseif recipe.result then
            local original_result = recipe.result
            recipe.main_product = recipe.result
            recipe.result = nil
            recipe.results = {
                {type = "item", name = original_result, amount = scale},
                {type = "item", name = item3, amount = 2, catalyst_amount = 2},
                {type = "item", name = item4, amount = 2, catalyst_amount = 2}
            }
        end
    end
}

return {
    recreate = function(recipe, table, scale)
        if not recipe.name:find("barrel") then
            local item1, item2 = util.pick_two_items(table)
            local item3, item4 = util.pick_two_items(table)
            util.add_ingredients(recipe, item1, item2)
            util.modify_results(recipe, item3, item4, scale)
            data:extend{recipe}
            return recipe
        end
        return nil
    end,
    util
}

--[[ for _, recipe in pairs(data.raw.recipe) do
    if not recipe.name:find("barrel") then
        local item1, item2 = pick_two_items()
        local item3, item4 = pick_two_items()        
        add_ingredients(recipe, item1, item2)
        add_results(recipe, item3, item4)
    end
end ]]