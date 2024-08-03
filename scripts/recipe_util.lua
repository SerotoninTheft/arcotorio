local arcotorio_util = require("scripts/arcotorio_util")
local rusty_util = require("__rusty-locale__.locale")

local namings = {"frugal", "efficient", "improved", "zero-waste"}

return {
    ---@param recipe data.RecipePrototype
    recreate = function(recipe, item_table, scale, improve)
        improve = improve or 0
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

        
        if recipe.normal then recipe.normal.enabled = false end
        if recipe.expensive then recipe.expensive.enabled = false end
        if not (recipe.normal and recipe.expensive) then recipe.enabled = false end

        local seed = recipe.name or recipe.main_product

        if improve > 0 then
            local prefix = "arcotorio-manufacturing." .. namings[(6 - scale) - 1]
            local locale = rusty_util.of_recipe(recipe).name
            recipe.localised_name = {prefix, locale}
            recipe.name = "arco-" .. namings[(6 - scale) - 1] .. "-" .. recipe.name
        else
            recipe.name = "arco-" .. recipe.name
        end

        -- Pick two items safely
        local ing = arcotorio_util.pick_two_items(item_table)
        local res = arcotorio_util.pick_two_items(item_table)

        -- Add ingredients safely
        if arcotorio_util.modify_ingredients then
            arcotorio_util.modify_ingredients(recipe, ing.item1, ing.item2, scale, improve)
        else
            error("Error: arcotorio_util.add_ingredients function not found")
        end

        -- Modify results safely
        if arcotorio_util.modify_results then
            arcotorio_util.modify_results(recipe, res.item1, res.item2, scale, improve)
        else
            error("Error: arcotorio_util.modify_results function not found")
        end

        -- Modify recipe time
        if recipe.normal then
            recipe.normal.energy_required = (recipe.normal.energy_required or 0.5) * scale
        end
        if recipe.expensive then
            recipe.expensive.energy_required = (recipe.expensive.energy_required or 0.5) * scale
        end
        if not recipe.normal then
            recipe.energy_required = (recipe.energy_required or 0.5) * scale
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
