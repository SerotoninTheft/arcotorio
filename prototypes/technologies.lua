local recipe_util = require("prototypes.recipe-util")

local milestones = {
    ["vanilla"] = {
        ["satellite"] =                 {rating = 5, tech = data.raw["technology"]["space-science-pack"]},
        ["production-science-pack"] =   {rating = 4, tech = data.raw["technology"]["production-science-pack"]},
        ["utility-science-pack"] =      {rating = 4, tech = data.raw["technology"]["utility-science-pack"]},
        ["chemical-science-pack"] =     {rating = 3, tech = data.raw["technology"]["chemical-science-pack"]},
        ["logistic-science-pack"] =     {rating = 2, tech = data.raw["technology"]["logistic-science-pack"]},
        ["automation-science-pack"] =   {rating = 1, tech = nil}
    }
}

---@as table<table<string>>
local unlocks = {
    [1] = {"Arco-bead"},
    [2] = {"Arco-orb"},
    [3] = {"Arco-boulder"},
    [4] = {"Arco-planet"},
    [5] = {"McArco-sphere"},
}

-- Change target to whatever compat setting required
local target = milestones.vanilla

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

local boulders = {
    "Pride-Arco-boulder",
    "Greed-Arco-boulder",
    "Lust-Arco-boulder",
    "Envy-Arco-boulder",
    "Gluttony-Arco-boulder",
    "Wrath-Arco-boulder",
    "Sloth-Arco-boulder"
}

local orbs = {
    "Water-Arco-orb",
    "Air-Arco-orb",
    "Fire-Arco-orb",
    "Earth-Arco-orb"
}

local beads = {
    "Rock-Arco-bead",
    "Paper-Arco-bead",
    "Scissors-Arco-bead"
}

local orb_tiers = {
    beads,
    orbs,
    boulders,
    planets,
    mcarco
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
local add_to_queue = function(tech, recipe)
    if tech then
        queue[tech.name] = queue[tech.name] or {}
        table.insert(queue[tech.name], recipe)
    end
end

local process_queue = function()
    for tech_name, recipes in pairs(queue) do
        local tech = data.raw["technology"][tech_name]
        if not recipes then error('no recipe added') end
        for _, recipe in pairs(recipes) do
            table.insert(tech.effects, {
                type = "unlock-recipe",
                recipe = recipe.name
            })
        end
        queue[tech_name] = nil
    end
end

local prod_list = data.raw["module"]["productivity-module"].limitation
if not prod_list then error("Default productivity 1 module has no limitation. Please contact mod author") end

tech_util.process_recipe = function(recipe_name, tech, tier)
    tier = tier or 1
    -- Get the recipe to check its subgroup
    local recipe = data.raw["recipe"][recipe_name]
    local is_intermediate = false

    if recipe and recipe.category and recipe.category == "smelting" then return end

    for _, prod in pairs(prod_list) do
        if prod == recipe.name then is_intermediate = true end
    end

    if target[recipe.name] then
        tier = tier + 1
    end

    add_to_queue(tech, recipe_util.recreate(table.deepcopy(recipe), orb_tiers[tier]))
    -- Only create additional recipes for items that are intermediate products (using productivity as the metric)
    --[[ if is_intermediate then
        local scale = 1
        tier = tier + 1
        while tier < 6 do
            for _, data in pairs(target) do
                if data.rating == tier then
                    add_to_queue(data.tech, recipe_util.recreate(table.deepcopy(recipe), orb_tiers[tier], scale))
                end
            end
            tier = tier + 1
            scale = scale + 1
        end
    end ]]
    
    data.raw["recipe"][recipe_name].enabled = false
    if data.raw["recipe"][recipe_name].normal then data.raw["recipe"][recipe_name].normal.enabled = false end
    if data.raw["recipe"][recipe_name].expensive then data.raw["recipe"][recipe_name].expensive.enabled = false end
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
    process_queue()
end

tech_util.process_arco_recipes = function()
    for item_name, milestone in pairs(target) do
        for _, recipe_name in pairs(unlocks[milestone.rating]) do
            local recipe = data.raw["recipe"][recipe_name]
            recipe.ingredients = recipe.ingredients or {
                {type = "item", name = item_name, amount = 1}
            }
            if milestone.tech then
                table.insert(milestone.tech.effects, {
                    type = "unlock-recipe",
                    recipe = recipe.name
                })
            else
                recipe.enabled = true
            end
        end
    end
end

return tech_util

