-- data.lua
local tech = require("prototypes.technologies")
require("prototypes.recipe-util")
require("prototypes.entities")
require("prototypes.items")
require("prototypes.category")

tech.process_tech_tree()

--search for recipes that are enabled by default, rather than unlocked by techs
local queue = {}
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.enabled or
            (recipe.normal and recipe.normal.enabled) or
            (recipe.expensive and recipe.expensive.enabled) then
        table.insert(queue, recipe.name)
    end
end

for _, recipe in pairs(queue) do
    tech.process_recipe(recipe)
end