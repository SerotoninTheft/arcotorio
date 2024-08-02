-- data.lua
local tech = require("prototypes.technologies")
require("prototypes.recipes")
require("scripts.recipe_util")
require("prototypes.entities")
require("prototypes.items")
require("prototypes.category")

tech.process_tech_tree()

--search for recipes that are enabled by default, rather than unlocked by techs
local queue = {}
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.enabled ~= false or
        (recipe.normal and recipe.normal.enabled ~= false) or
        (recipe.expensive and recipe.expensive.enabled ~= false) then

        table.insert(queue, recipe.name)
    end
end

for _, recipe in pairs(queue) do
    tech.process_recipe(recipe)
end

tech.process_arco_recipes()