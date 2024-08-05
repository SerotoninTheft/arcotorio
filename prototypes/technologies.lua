local recipe_util = require("scripts.recipe_util")

---@class (exact) Milestone_Data
---@field rating int
---@field tech data.TechnologyPrototype
---@field raw string

---@as {[string]: {[string]: Milestone_Data}}
local milestones = {
    ["vanilla"] = {
        ["satellite"] =                 {rating = 5, tech = data.raw["technology"]["space-science-pack"],       raw = "space-science-pack"},
        ["production-science-pack"] =   {rating = 4, tech = data.raw["technology"]["production-science-pack"],  raw = "production-science-pack"},
        ["utility-science-pack"] =      {rating = 4, tech = data.raw["technology"]["utility-science-pack"],     raw = "utility-science-pack"},
        ["chemical-science-pack"] =     {rating = 3, tech = data.raw["technology"]["chemical-science-pack"],    raw = "chemical-science-pack"},
        ["logistic-science-pack"] =     {rating = 2, tech = data.raw["technology"]["logistic-science-pack"],    raw = "logistic-science-pack"},
        ["automation-science-pack"] =   {rating = 1, tech = nil, raw = "coal"}
    }
}

function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

---Table of recipe names that correlate to a rating, these are added to the tech based on rating, or enabled for rating 1
---@as table<int, string>
local unlocks = {
    [1] = {"Arco-bead", "hand-Arco-bead", "Arco-bead-initialize", "hand-Arco-bead-initialize", "Arcofolder"},
    [2] = {"Arco-orb", "Arco-orb-initialize"},
    [3] = {"Arco-boulder", "Arco-boulder-initialize", "Advanced-Arcofolder"},
    [4] = {"Arco-planet", "Arco-planet-initialize"},
    [5] = {"McArco-sphere", "McArco-sphere-initialize", "McArcofolder"},
}

-- Change target to whatever compat setting required
local target = milestones.vanilla

local beads = {
    "Rock-Arco-bead",
    "Paper-Arco-bead",
    "Scissors-Arco-bead"
}
TableConcat(unlocks[1], beads)
local hand_beads =  {
    "hand-Rock-Arco-bead",
    "hand-Paper-Arco-bead",
    "hand-Scissors-Arco-bead"
}
TableConcat(unlocks[1], hand_beads)
local orbs = {
    "Water-Arco-orb",
    "Air-Arco-orb",
    "Fire-Arco-orb",
    "Earth-Arco-orb"
}
TableConcat(unlocks[2], orbs)
local boulders = {
    "Pride-Arco-boulder",
    "Greed-Arco-boulder",
    "Lust-Arco-boulder",
    "Envy-Arco-boulder",
    "Gluttony-Arco-boulder",
    "Wrath-Arco-boulder",
    "Sloth-Arco-boulder"
}
TableConcat(unlocks[3], boulders)
local planets = {
    "Mercury-Arco-planet",
    "Venus-Arco-planet",
    "Earth-Arco-planet",
    "Mars-Arco-planet",
    "Jupiter-Arco-planet",
    "Saturn-Arco-planet",
    "Uranus-Arco-planet",
    "Neptune-Arco-planet"
}
TableConcat(unlocks[4], planets)
local mcarco = {
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
TableConcat(unlocks[5], mcarco)


local orb_tiers = {
    beads,
    orbs,
    boulders,
    planets,
    mcarco
}

---@class (exact) Manufacture_Data
---@field rating int
---@field tech data.TechnologyData

---@return Manufacture_Data
local function manufacture_tech(tech_name, rating)
    return {
        rating = rating,
        tech = {
            icon = "__arcotorio__/graphics/"..unlocks[rating][1].."-tech.png",
            icon_size = 256,
            type = "technology",
            name = tech_name,
            prerequisites = {},
            effects = {},
            ---@diagnostic disable-next-line: assign-type-mismatch
            unit = nil
        }
    }--[[@as Manufacture_Data]]
end

---@as { [string]: Manufacture_Data }
local manufacturing_techs = {
    ["frugal-manufacturing"]        = manufacture_tech("frugal-manufacturing", 2),
    ["efficient-manufacturing"]     = manufacture_tech("efficient-manufacturing", 3),
    ["improved-manufacturing"]      = manufacture_tech("improved-manufacturing", 4),
    ["zero-waste-manufacturing"]    = manufacture_tech("zero-waste-manufacturing", 5)
}

local tech_util = {}

---@param ingredients table<TechnologyPrototypeFilter.research_unit_ingredient>
local function highest_pack(ingredients)
    local highest = "automation-science-pack"
    for _, ingredient in pairs(ingredients) do
        local item_name = ingredient.name or ingredient[1] -- Handle both table formats
        if target[highest] and target[item_name]then
            if target[highest].rating < target[item_name].rating then
                highest = item_name
            end
        else
            log("Warning: Missing target entry for " .. (item_name or "unknown item"))
        end
    end
    return target[highest].rating
end

local queue = {}
local processed_recipes = {}
local add_to_queue = function(tech, recipe)
    if tech and recipe then
        queue[tech.name] = queue[tech.name] or {}
        queue[tech.name][recipe.name] = recipe
        processed_recipes[recipe.name] = true
    elseif recipe then
        if recipe.normal    then recipe.normal.enabled = true end
        if recipe.expensive then recipe.expensive.enabled = true end
        if not (recipe.normal and recipe.expensive) then recipe.enabled = true end
    end
end

tech_util.process_queue = function()
    for tech_name, recipes in pairs(queue) do
        local tech = data.raw["technology"][tech_name]
        if not recipes then error('no recipe added') end
        for recipe_name, recipe in pairs(recipes) do
            if not data.raw["recipe"][recipe_name] then data:extend{recipe} end
            table.insert(tech.effects, {
                type = "unlock-recipe",
                recipe = recipe_name
            })
        end
        queue[tech_name] = nil
    end
end


local invalid_categories = {
    ["smelting"] = true,
    ["rocket-building"] = true,
    ["neutron-absorber"] = true,
    ["vat"] = true,
    ["py-runoff"] = true,
    ["py-venting"] = true,
    ["py-unbarrelling"] = true,
    ["py-barrelling"] = true,
}

local prod_list = data.raw["module"]["productivity-module"].limitation
if not prod_list then error("Default productivity 1 module has no limitation. Please contact mod author") end

---@param recipe_name string
---@param tech ?data.TechnologyPrototype
---@param tier ?int
tech_util.process_recipe = function(recipe_name, tech, tier)
    tier = tier or 1
    if not recipe_name then error("recipe_name missing: " .. serpent.block(tech)) end

    -- Get the recipe to check its subgroup
    local recipe = data.raw["recipe"][recipe_name]
    local is_intermediate = false

    if recipe.icons and recipe.icon_size then
        log("AUGGHGGHHGHGH:" .. recipe.category)
    end

    if recipe and recipe.category and invalid_categories[recipe.category] then return end

    --if we have already processed this recipe
    if processed_recipes[recipe.name] then
        return
    end

    for _, prod in pairs(prod_list) do
        if prod == recipe.name then is_intermediate = true end
    end

    if target[recipe.name] and target[recipe.name].tech then
        tier = tier + 1
    end

    -- Only create additional recipes for items that are intermediate products (using productivity as the metric)
    -- TODO add "Hard Mode" setting to disable this feature
    local difference = 1
    local improvement = tier
    if is_intermediate then
        while improvement < 5 do
            improvement = improvement + 1
            difference = difference + 1
            for _, manufacture_data in pairs(manufacturing_techs) do
                if manufacture_data.rating == improvement then
                    new_recipe = table.deepcopy(recipe)
                    add_to_queue(manufacture_data.tech, recipe_util.recreate(new_recipe, orb_tiers[improvement], 6 - difference, 1))
                    table.insert(prod_list, new_recipe.name)
                    table.insert(data.raw["module"]["productivity-module-2"].limitation, new_recipe.name)
                    table.insert(data.raw["module"]["productivity-module-3"].limitation, new_recipe.name)
                end
            end
        end
    end

    add_to_queue(tech, recipe_util.recreate(recipe, orb_tiers[tier]))
--[[ 
    data.raw["recipe"][recipe_name].enabled = false
    if data.raw["recipe"][recipe_name].normal then data.raw["recipe"][recipe_name].normal.enabled = false end
    if data.raw["recipe"][recipe_name].expensive then data.raw["recipe"][recipe_name].expensive.enabled = false end ]]
    return true
end

tech_util.process_tech_tree = function()
    for name, tech in pairs(data.raw["technology"]) do
        local highest = highest_pack(tech.unit.ingredients)
        if not tech.effects then goto no_effects end
        for index, effect in pairs(tech.effects) do
            if effect.type ~= "unlock-recipe" then goto not_recipe end

            if tech_util.process_recipe(effect.recipe, tech, highest) then
                tech.effects[index] = nil
            end
            ::not_recipe::
        end
        ::no_effects::
    end
end

local function adjust_tech(rating, recipe)
    for item_name, milestone in pairs(target) do
        if rating - 1 == milestone.rating then
            recipe.ingredients = recipe.ingredients or {}
            for _, ingredient in pairs(recipe.ingredients) do
                if ingredient.name == item_name then return end
            end
            table.insert(recipe.ingredients,{type = "item", name = item_name, amount = 1})
        end
    end
end

tech_util.place_manufacturing = function()
    for _, manufacture_data in pairs(manufacturing_techs) do
        for _, milestone in pairs(target) do
            if manufacture_data.rating == milestone.rating then
                manufacture_data.tech.prerequisites[#manufacture_data.tech.prerequisites + 1] = milestone.tech.name
                manufacture_data.tech.unit = manufacture_data.tech.unit or table.deepcopy(milestone.tech.unit)
                table.insert(manufacture_data.tech.unit.ingredients, {milestone.raw, 1})
            end
        end
        data:extend{manufacture_data.tech}
    end
end

tech_util.process_arco_recipes = function()
    for item_name, milestone in pairs(target) do
        for index, recipe_name in pairs(unlocks[milestone.rating]) do
            local item =  {type = "item", name = milestone.raw, amount = 1}
            local recipe = data.raw["recipe"][recipe_name]
            if milestone.tech then
                if index == 1 then
                    adjust_tech(milestone.rating, recipe)
                else
                    recipe.ingredients = recipe.ingredients or { item }
                end
                table.insert(milestone.tech.effects, {
                    type = "unlock-recipe",
                    recipe = recipe.name
                })
            else
                recipe.ingredients = recipe.ingredients or { item }
                recipe.enabled = recipe.enabled or true
            end
        end
    end
end

return tech_util

