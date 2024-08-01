local bead = {
    type = "recipe",
    name = "Arco-bead",
    category = "arcofolding",
    result = "Arco-bead",
    result_count = 5,
    energy_required = 10,
    enabled = false
}
local orb = {
    type = "recipe",
    name = "Arco-orb",
    category = "arcofolding",
    result = "Arco-orb",
    result_count = 5,
    energy_required = 10,
    enabled = false
}
local boulder = {
    type = "recipe",
    name = "Arco-boulder",
    category = "arcofolding",
    result = "Arco-boulder",
    result_count = 5,
    energy_required = 10,
    enabled = false
}
local planet = {
    type = "recipe",
    name = "Arco-planet",
    category = "arcofolding",
    result = "Arco-planet",
    result_count = 5,
    energy_required = 10,
    enabled = false
}
local mcarco = {
    type = "recipe",
    name = "McArco-sphere",
    category = "arcofolding",
    result = "McArco-sphere",
    result_count = 5,
    energy_required = 10,
    enabled = false
}
local arcofolder = {
    type = "recipe",
    name = "Arcofolder",
    category = "crafting",
    result = "Arcofolder",
    result_count = 1,
    ingredients = {
        {name = "electronic-circuit", amount = 5},
        {name = "iron-plate", amount = 8},
        {name = "iron-gear-wheel", amount = 6}
    },
    energy_required = 4,
    enabled = false
}
local adv_arcofolder = {
    type = "recipe",
    name = "Advanced-Arcofolder",
    category = "crafting",
    result = "Advanced-Arcofolder",
    result_count = 1,
    ingredients = { --placeholder
        {name = "electronic-circuit", amount = 5},
        {name = "iron-plate", amount = 8},
        {name = "iron-gear-wheel", amount = 6}
    },
    energy_required = 4,
    enabled = false
}
local mcarcofolder = {
    type = "recipe",
    name = "McArcofolder",
    category = "crafting",
    result = "McArcofolder",
    result_count = 1,
    ingredients = {--placeholder
        {name = "electronic-circuit", amount = 5},
        {name = "iron-plate", amount = 8},
        {name = "iron-gear-wheel", amount = 6}
    },
    energy_required = 4,
    enabled = false
}
local folds = {
    {
        ingredients = {
            {name = "Venus-Arco-planet", amount = 5},
            {name = "Mercury-Arco-planet", amount = 5},
            {name = "Earth-Arco-planet", amount = 5}
        },
        result = "Mars-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Mars-Arco-planet", amount = 5},
            {name = "Mercury-Arco-planet", amount = 5},
            {name = "Earth-Arco-planet", amount = 5}
        },
        result = "Jupiter-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Mars-Arco-planet", amount = 5},
            {name = "Jupiter-Arco-planet", amount = 5},
            {name = "Earth-Arco-planet", amount = 5}
        },
        result = "Saturn-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Mars-Arco-planet", amount = 5},
            {name = "Jupiter-Arco-planet", amount = 5},
            {name = "Saturn-Arco-planet", amount = 5}
        },
        result = "Neptune-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Neptune-Arco-planet", amount = 5},
            {name = "Jupiter-Arco-planet", amount = 5},
            {name = "Saturn-Arco-planet", amount = 5}
        },
        result = "Uranus-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Neptune-Arco-planet", amount = 5},
            {name = "Uranus-Arco-planet", amount = 5},
            {name = "Saturn-Arco-planet", amount = 5}
        },
        result = "Venus-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Neptune-Arco-planet", amount = 5},
            {name = "Uranus-Arco-planet", amount = 5},
            {name = "Venus-Arco-planet", amount = 5}
        },
        result = "Mercury-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Mercury-Arco-planet", amount = 5},
            {name = "Uranus-Arco-planet", amount = 5},
            {name = "Venus-Arco-planet", amount = 5}
        },
        result = "Earth-Arco-planet",
        result_count = 15
    },
    {
        ingredients = {
            {name = "Greed-Arco-boulder", amount = 5},
            {name = "Pride-Arco-boulder", amount = 5}
        },
        result = "Lust-Arco-boulder",
        result_count = 10
    },
    {
        ingredients = {
            {name = "Lust-Arco-boulder", amount = 5},
            {name = "Pride-Arco-boulder", amount = 5}
        },
        result = "Envy-Arco-boulder",
        result_count = 10
    },
    {
        ingredients = {
            {name = "Envy-Arco-boulder", amount = 5},
            {name = "Lust-Arco-boulder", amount = 5}
        },
        result = "Gluttony-Arco-boulder",
        result_count = 10
    },
    {
        ingredients = {
            {name = "Gluttony-Arco-boulder", amount = 5},
            {name = "Envy-Arco-boulder", amount = 5}
        },
        result = "Wrath-Arco-boulder",
        result_count = 10
    },
    {
        ingredients = {
            {name = "Wrath-Arco-boulder", amount = 5},
            {name = "Gluttony-Arco-boulder", amount = 5}
        },
        result = "Sloth-Arco-boulder",
        result_count = 10
    },
    {
        ingredients = {
            {name = "Sloth-Arco-boulder", amount = 5},
            {name = "Wrath-Arco-boulder", amount = 5}
        },
        result = "Greed-Arco-boulder",
        result_count = 10
    },
    {
        ingredients = {
            {name = "Greed-Arco-boulder", amount = 5},
            {name = "Sloth-Arco-boulder", amount = 5}
        },
        result = "Pride-Arco-boulder",
        result_count = 10
    }
}

for _, recipe_data in pairs(folds) do
    local recipe = {
        type = "recipe",
        name = recipe_data.result,
        category = "arcofolding",
        result = recipe_data.result,
        result_count = recipe_data.result_count,
        ingredients = recipe_data.ingredients,
        energy_required = 4,
        enabled = false
    }
    data:extend{recipe}
end

data:extend{bead, orb, boulder, planet, mcarco, arcofolder, adv_arcofolder, mcarcofolder}