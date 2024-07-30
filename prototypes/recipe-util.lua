local arcotorio_util = require("scripts/arcotorio_util")

return {
    recreate = function(recipe, item_table, scale)
        -- Check if recipe and recipe.name are valid
        if not recipe or not recipe.name then
            error("Error: Invalid recipe or missing recipe name")
        end

        -- Skip barrel recipes
        if recipe.name:find("barrel") then
            return nil
        end

        -- Pick two items safely
        local item1, item2 = arcotorio_util.pick_two_items(item_table)
        local item3, item4 = arcotorio_util.pick_two_items(item_table)

        -- Add ingredients safely
        if arcotorio_util.add_ingredients then
            arcotorio_util.add_ingredients(recipe, item1, item2)
        else
            error("Error: arcotorio_util.add_ingredients function not found")
        end

        -- Modify results safely
        if arcotorio_util.modify_results then
            arcotorio_util.modify_results(recipe, item3, item4, scale)
        else
            error("Error: arcotorio_util.modify_results function not found")
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
