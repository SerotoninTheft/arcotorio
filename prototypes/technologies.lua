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

---change target to whatever compat setting required
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
    for _, item in pairs(ingredients) do
        if target[highest].rating < target[item].rating then
            highest = item
        end
    end
    return target[highest].rating
end

local function process_tech_tree()
    for name, tech in pairs(data.raw["technology"]) do
        local tier = highest_pack(tech.unit.ingredients)
        --using goto means less indentation which makes it slightly more readable
        if not tech.effects then goto no_effects end
        for index, effect in pairs(tech.effects) do
            if effect.type ~= "unlock-recipe" then goto not_recipe end
            local scale = tier + 1
            if tier > 3 then recipe_util.recreate(table.deepcopy(effect.recipe),mcarco,scale - tier) end
            if tier > 2 then recipe_util.recreate(table.deepcopy(effect.recipe),planets,scale - tier) end
            if tier > 1 then recipe_util.recreate(table.deepcopy(effect.recipe),boulders,scale - tier) end
            if tier > 0 then recipe_util.recreate(table.deepcopy(effect.recipe),orbs,scale - tier) end
            recipe_util.recreate(table.deepcopy(effect.recipe),beads,scale - tier)
            tech.effects[index] = nil
            ::not_recipe::
        end
        ::no_effects::
    end
end

process_tech_tree()