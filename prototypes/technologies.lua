 local recipe_util = require("prototypes.recipe-util")

local milestones = {
    ["vanilla"] = {
        ["space-science-pack"] =        {rating = 4, tech = data.raw["technology"]["space-science-pack"]},
        ["production-science-pack"] =   {rating = 3, tech = data.raw["technology"]["production-science-pack"]},
        ["utility-science-pack"] =      {rating = 3, tech = data.raw["technology"]["utility-science-pack"]},
        ["chemical-science-pack"] =     {rating = 2, tech = data.raw["technology"]["chemical-science-pack"]},
        ["logistic-science-pack"] =     {rating = 1, tech = data.raw["technology"]["logistic-science-pack"]},
        ["automation-science-pack"] =   {rating = 0, tech = nil}
    }
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

---@param ingredients table<TechnologyPrototypeFilter.research_unit_ingredient>
local function highest_pack(ingredients)
    local highest = "automation-science-pack"
    for _, ingredient in pairs(ingredients) do
        local item_name = ingredient.name or ingredient[1] -- Handle both table formats
        if target[highest] and target[item_name] then
            if target[highest].rating < target[item_name].rating then
                highest = item_name
            end
        else
            log("Warning: Missing target entry for " .. (item_name or "unknown item"))
        end
    end
    return target[highest] and target[highest].rating or 0 -- Return 0 if highest is invalid
end

local function process_tech_tree()
    local prod_list = data.raw["module"]["productivity-module"].limitation
    if not prod_list then error("Default productivity 1 module has no limitation. Please contact mod author") end
    for name, tech in pairs(data.raw["technology"]) do
        local tier = highest_pack(tech.unit.ingredients)
        if not tech.effects then goto no_effects end
        for index, effect in pairs(tech.effects) do
            if effect.type ~= "unlock-recipe" then goto not_recipe end

            -- Get the recipe to check its subgroup
            local recipe = data.raw["recipe"][effect.recipe]
            local is_intermediate = false

            for _, prod in pairs(prod_list) do
                if prod == recipe.name then is_intermediate = true end
            end

            -- Only recreate recipes that are intermediate products
            if is_intermediate then
                local scale = tier + 1
                if tier > 3 then recipe_util.recreate(table.deepcopy(effect.recipe), mcarco, scale - tier) end
                if tier > 2 then recipe_util.recreate(table.deepcopy(effect.recipe), planets, scale - tier) end
                if tier > 1 then recipe_util.recreate(table.deepcopy(effect.recipe), boulders, scale - tier) end
                if tier > 0 then recipe_util.recreate(table.deepcopy(effect.recipe), orbs, scale - tier) end
                recipe_util.recreate(table.deepcopy(effect.recipe), beads, scale - tier)
                tech.effects[index] = nil
            end

            ::not_recipe::
        end
        ::no_effects::
    end
end

process_tech_tree()
