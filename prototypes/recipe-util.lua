local arcotorio_util = require("scripts/arcotorio_util")

return {
    recreate = function(recipe, item_table, scale)
        scale = scale or 1
        -- Check if recipe and recipe.name are valid
        if not recipe or not recipe.name then
            error("Error: Invalid recipe or missing recipe name")
        end

        -- Skip recipes with arco in the name (our mod recipes)
        if recipe.name:find("arco") then
            return nil
        end

        -- Skip barrel recipes
        if recipe.name:find("barrel") then
            return nil
        end

        -- Pick two items safely
        local ing = arcotorio_util.pick_two_items(item_table)
        local res = arcotorio_util.pick_two_items(item_table)

        -- Add ingredients safely
        if arcotorio_util.add_ingredients then
            arcotorio_util.add_ingredients(recipe, ing.item1, ing.item2)
        else
            error("Error: arcotorio_util.add_ingredients function not found")
        end

        -- Modify results safely
        if arcotorio_util.modify_results then
            arcotorio_util.modify_results(recipe, res.item1, res.item2, scale)
        else
            error("Error: arcotorio_util.modify_results function not found")
        end

        if scale > 1 then
            recipe.name = "arco-x" .. scale .. "-" .. recipe.name
        else
            recipe.name = "arco-" .. recipe.name
        end

        -- Extend the data with the modified recipe
        if recipe then
            data:extend{recipe}
        else
            error("Error: Recipe is nil after modifications")
        end

        return recipe
    end,
    util = arcotorio_util
}
