local tech = require("prototypes.technologies")
require("prototypes.recipes")
require("scripts.recipe_util")
require("prototypes.entities")
require("prototypes.items")
require("prototypes.category")

--Uncomment this if you need to check for dummy techs. 
--The indicator is that there are items which have different ingredients than there should be
--[[ local unlock_counts = {}
for _, tech in pairs(data.raw.technology) do
  local normal = (tech.normal or {}).effects or {}
  local expensive = (tech.expensive or {}).effects or {}
  local effects = tech.effects or {}
  for _, effect_table in pairs{normal, expensive, effects} do
    for _, effect in pairs(effect_table) do
      if effect.type == 'unlock-recipe' then unlock_counts[effect.recipe] = (unlock_counts[effect.recipe] or 0) + 1 end
    end
  end
end
log(serpent.block(unlock_counts)) ]]

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
tech.place_manufacturing()

tech.process_queue()
tech.process_arco_recipes()

local function append_arco_fuel(list)
    if not list then error("list does not exist") end
    for _, vehicle in pairs(list) do
        if vehicle.burner then
            if vehicle.burner.fuel_category then
                vehicle.burner.fuel_categories = vehicle.burner.fuel_categories or {}
                table.insert(vehicle.burner.fuel_categories, vehicle.burner.fuel_category)
            end
            table.insert(vehicle.burner.fuel_categories, "mcarco")
            vehicle.burner.burnt_inventory_size = vehicle.burner.burnt_inventory_size or vehicle.burner.fuel_inventory_size
        elseif vehicle.energy_source.type == "burner" then
            if vehicle.burner.fuel_category then
                vehicle.burner.fuel_categories = vehicle.burner.fuel_categories or {}
                table.insert(vehicle.burner.fuel_categories, vehicle.burner.fuel_category)
            end
            table.insert(vehicle.burner.fuel_categories, "mcarco")
            vehicle.burner.burnt_inventory_size = vehicle.burner.burnt_inventory_size or vehicle.burner.fuel_inventory_size
        end

    end
end

append_arco_fuel(data.raw["car"])
append_arco_fuel(data.raw["locomotive"])
append_arco_fuel(data.raw["spider-vehicle"])