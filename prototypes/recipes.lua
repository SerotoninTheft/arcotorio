local bead = {
    type = "recipe",
    name = "Arco-bead",
    subgroup = "Arco-bead-arcofolding",
    category = "arcofolding",
    result = "Arco-bead",
    result_count = 10,
    energy_required = 10,
    enabled = false,
    order = "a[Arco-bead]"
}
local orb = {
    type = "recipe",
    name = "Arco-orb",
    subgroup = "Arco-orb-arcofolding",
    category = "arcofolding",
    result = "Arco-orb",
    result_count = 10,
    energy_required = 10,
    enabled = false,
    order = "a[Arco-orb]"
}
local boulder = {
    type = "recipe",
    name = "Arco-boulder",
    subgroup = "Arco-boulder-arcofolding",
    category = "arcofolding",
    result = "Arco-boulder",
    result_count = 10,
    energy_required = 10,
    enabled = false,
    order = "a[Arco-boulder]"
}
local planet = {
    type = "recipe",
    name = "Arco-planet",
    subgroup = "Arco-planet-arcofolding",
    category = "arcofolding",
    result = "Arco-planet",
    result_count = 10,
    energy_required = 10,
    enabled = false,
    order = "a[Arco-planet]"
}
local mcarco = {
    type = "recipe",
    name = "McArco-sphere",
    subgroup = "McArco-sphere-arcofolding",
    category = "arcofolding",
    result = "McArco-sphere",
    result_count = 10,
    energy_required = 10,
    enabled = false,
    order = "a[McArco-sphere]"
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
    ingredients = {
        {name = "advanced-circuit", amount = 10},
        {name = "Arcofolder", amount = 2},
        {name = "engine-unit", amount = 4},
        {name = "steel-plate", amount = 6}
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
    ingredients = {
        {name = "processing-unit", amount = 5},
        {name = "low-density-structure", amount = 10},
        {name = "Advanced-Arcofolder", amount = 2},
        {name = "effectivity-module", amount = 2},
        {name = "speed-module", amount = 2}
    },
    energy_required = 4,
    enabled = false
}
--contains all folding inputs and outputs
local folds = {
    {
        ingredients = {
            {name = "Venus-Arco-planet", amount = 5},
            {name = "Mercury-Arco-planet", amount = 5},
            {name = "Earth-Arco-planet", amount = 5}
        },
        result = "Mars-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Mars-Arco-planet", amount = 5},
            {name = "Mercury-Arco-planet", amount = 5},
            {name = "Earth-Arco-planet", amount = 5}
        },
        result = "Jupiter-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Mars-Arco-planet", amount = 5},
            {name = "Jupiter-Arco-planet", amount = 5},
            {name = "Earth-Arco-planet", amount = 5}
        },
        result = "Saturn-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Mars-Arco-planet", amount = 5},
            {name = "Jupiter-Arco-planet", amount = 5},
            {name = "Saturn-Arco-planet", amount = 5}
        },
        result = "Neptune-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Neptune-Arco-planet", amount = 5},
            {name = "Jupiter-Arco-planet", amount = 5},
            {name = "Saturn-Arco-planet", amount = 5}
        },
        result = "Uranus-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Neptune-Arco-planet", amount = 5},
            {name = "Uranus-Arco-planet", amount = 5},
            {name = "Saturn-Arco-planet", amount = 5}
        },
        result = "Venus-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Neptune-Arco-planet", amount = 5},
            {name = "Uranus-Arco-planet", amount = 5},
            {name = "Venus-Arco-planet", amount = 5}
        },
        result = "Mercury-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Mercury-Arco-planet", amount = 5},
            {name = "Uranus-Arco-planet", amount = 5},
            {name = "Venus-Arco-planet", amount = 5}
        },
        result = "Earth-Arco-planet",
        result_count = 15,
        seconds = 5,
        subgroup = "Arco-planet-arcofolding"
    },
    {
        ingredients = {
            {name = "Greed-Arco-boulder", amount = 5},
            {name = "Pride-Arco-boulder", amount = 5}
        },
        result = "Lust-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Lust-Arco-boulder", amount = 5},
            {name = "Pride-Arco-boulder", amount = 5}
        },
        result = "Envy-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Envy-Arco-boulder", amount = 5},
            {name = "Lust-Arco-boulder", amount = 5}
        },
        result = "Gluttony-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Gluttony-Arco-boulder", amount = 5},
            {name = "Envy-Arco-boulder", amount = 5}
        },
        result = "Wrath-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Wrath-Arco-boulder", amount = 5},
            {name = "Gluttony-Arco-boulder", amount = 5}
        },
        result = "Sloth-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Sloth-Arco-boulder", amount = 5},
            {name = "Wrath-Arco-boulder", amount = 5}
        },
        result = "Greed-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Greed-Arco-boulder", amount = 5},
            {name = "Sloth-Arco-boulder", amount = 5}
        },
        result = "Pride-Arco-boulder",
        result_count = 10,
        seconds = 2,
        subgroup = "Arco-boulder-arcofolding"
    },
    {
        ingredients = {
            {name = "Water-Arco-orb", amount = 5},
            {name = "Fire-Arco-orb", amount = 5}
        },
        result = "Earth-Arco-orb",
        result_count = 10,
        seconds = 1,
        subgroup = "Arco-orb-arcofolding"
    },
    {
        ingredients = {
            {name = "Earth-Arco-orb", amount = 5},
            {name = "Fire-Arco-orb", amount = 5}
        },
        result = "Air-Arco-orb",
        result_count = 10,
        seconds = 1,
        subgroup = "Arco-orb-arcofolding"
    },
    {
        ingredients = {
            {name = "Earth-Arco-orb", amount = 5},
            {name = "Air-Arco-orb", amount = 5}
        },
        result = "Water-Arco-orb",
        result_count = 10,
        seconds = 1,
        subgroup = "Arco-orb-arcofolding"
    },
    {
        ingredients = {
            {name = "Water-Arco-orb", amount = 5},
            {name = "Air-Arco-orb", amount = 5}
        },
        result = "Fire-Arco-orb",
        result_count = 10,
        seconds = 1,
        subgroup = "Arco-orb-arcofolding"
    },
    {
        ingredients = {
            {name = "Rock-Arco-bead", amount = 15}
        },
        result = "Paper-Arco-bead",
        result_count = 15,
        seconds = 1,
        subgroup = "Arco-bead-arcofolding"
    },
    {
        ingredients = {
            {name = "Scissors-Arco-bead", amount = 15}
        },
        result = "Rock-Arco-bead",
        result_count = 15,
        seconds = 1,
        subgroup = "Arco-bead-arcofolding"
    },
    {
        ingredients = {
            {name = "Paper-Arco-bead", amount = 15}
        },
        result = "Scissors-Arco-bead",
        result_count = 15,
        seconds = 1,
        subgroup = "Arco-bead-arcofolding"
    },
    {
        ingredients = {
            {name = "Rock-Arco-bead", amount = 1}
        },
        result = "Paper-Arco-bead",
        result_count = 1,
        seconds = 1,
        category = "crafting",
        name = "hand-Paper-Arco-bead",
        subgroup = "Arco-bead-arcofolding"
    },
    {
        ingredients = {
            {name = "Scissors-Arco-bead", amount = 1}
        },
        result = "Rock-Arco-bead",
        result_count = 1,
        seconds = 1,
        category = "crafting",
        name = "hand-Rock-Arco-bead",
        subgroup = "Arco-bead-arcofolding"
    },
    {
        ingredients = {
            {name = "Paper-Arco-bead", amount = 1}
        },
        result = "Scissors-Arco-bead",
        result_count = 1,
        seconds = 1,
        category = "crafting",
        name = "hand-Scissors-Arco-bead",
        subgroup = "Arco-bead-arcofolding"
    },
    {
        ingredients = {
            {name = "Walmart-McArco-sphere", amount = 5},
            {name = "McDonalds-McArco-sphere", amount = 5},
            {name = "Tesco-McArco-sphere", amount = 5},
            {name = "Wendys-McArco-sphere", amount = 5}
        },
        results = {
            {name = "Subway-McArco-sphere", amount = 15},
            {name = "White-Castle-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "Subway-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Subway-McArco-sphere", amount = 5},
            {name = "McDonalds-McArco-sphere", amount = 5},
            {name = "Tesco-McArco-sphere", amount = 5},
            {name = "Wendys-McArco-sphere", amount = 5}
        },
        results = {
            {name = "White-Castle-McArco-sphere", amount = 15},
            {name = "Taco-Bell-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "White-Castle-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Subway-McArco-sphere", amount = 5},
            {name = "White-Castle-McArco-sphere", amount = 5},
            {name = "Tesco-McArco-sphere", amount = 5},
            {name = "Wendys-McArco-sphere", amount = 5}
        },
        results = {
            {name = "Taco-Bell-McArco-sphere", amount = 15},
            {name = "KFC-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "Taco-Bell-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Subway-McArco-sphere", amount = 5},
            {name = "White-Castle-McArco-sphere", amount = 5},
            {name = "Taco-Bell-McArco-sphere", amount = 5},
            {name = "Wendys-McArco-sphere", amount = 5}
        },
        results = {
            {name = "KFC-McArco-sphere", amount = 15},
            {name = "Jimmy-Johns-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "KFC-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Subway-McArco-sphere", amount = 5},
            {name = "White-Castle-McArco-sphere", amount = 5},
            {name = "Taco-Bell-McArco-sphere", amount = 5},
            {name = "KFC-McArco-sphere", amount = 5}
        },
        results = {
            {name = "Jimmy-Johns-McArco-sphere", amount = 15},
            {name = "Walmart-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "Jimmy-Johns-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Jimmy-Johns-McArco-sphere", amount = 5},
            {name = "White-Castle-McArco-sphere", amount = 5},
            {name = "Taco-Bell-McArco-sphere", amount = 5},
            {name = "KFC-McArco-sphere", amount = 5}
        },
        results = {
            {name = "Walmart-McArco-sphere", amount = 15},
            {name = "McDonalds-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "Walmart-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Jimmy-Johns-McArco-sphere", amount = 5},
            {name = "Walmart-McArco-sphere", amount = 5},
            {name = "Taco-Bell-McArco-sphere", amount = 5},
            {name = "KFC-McArco-sphere", amount = 5}
        },
        results = {
            {name = "McDonalds-McArco-sphere", amount = 15},
            {name = "Tesco-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "McDonalds-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Jimmy-Johns-McArco-sphere", amount = 5},
            {name = "Walmart-McArco-sphere", amount = 5},
            {name = "McDonalds-McArco-sphere", amount = 5},
            {name = "KFC-McArco-sphere", amount = 5}
        },
        results = {
            {name = "Tesco-McArco-sphere", amount = 15},
            {name = "Wendys-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "Tesco-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "Jimmy-Johns-McArco-sphere", amount = 5},
            {name = "Walmart-McArco-sphere", amount = 5},
            {name = "McDonalds-McArco-sphere", amount = 5},
            {name = "Tesco-McArco-sphere", amount = 5}
        },
        results = {
            {name = "Wendys-McArco-sphere", amount = 15},
            {name = "Subway-McArco-sphere", amount = 5}
        },
        seconds = 10,
        main_product = "Wendys-McArco-sphere",
        subgroup = "McArco-sphere-arcofolding"
    },
    {
        ingredients = {
            {name = "McArco-sphere", amount = 9}
        },
        results = {
            {name = "Wendys-McArco-sphere", amount = 1},
            {name = "Subway-McArco-sphere", amount = 1},
            {name = "Jimmy-Johns-McArco-sphere", amount = 1},
            {name = "Walmart-McArco-sphere", amount = 1},
            {name = "McDonalds-McArco-sphere", amount = 1},
            {name = "Tesco-McArco-sphere", amount = 1},
            {name = "KFC-McArco-sphere", amount = 1},
            {name = "Taco-Bell-McArco-sphere", amount = 1},
            {name = "White-Castle-McArco-sphere", amount = 1}
        },
        icon = "__arcotorio__/graphics/Mc-Initialize.png",
        icon_size = 64,
        tint = {0.5,0.5,0},
        subgroup = "McArco-sphere-arcofolding",
        order = "a[McArco-sphere]"
    },
    {
        ingredients = {
            {name = "Arco-planet", amount = 8}
        },
        results = {
            {name = "Mercury-Arco-planet", amount = 1},
            {name = "Venus-Arco-planet", amount = 1},
            {name = "Earth-Arco-planet", amount = 1},
            {name = "Mars-Arco-planet", amount = 1},
            {name = "Jupiter-Arco-planet", amount = 1},
            {name = "Saturn-Arco-planet", amount = 1},
            {name = "Uranus-Arco-planet", amount = 1},
            {name = "Neptune-Arco-planet", amount = 1}
        },
        icon = "__arcotorio__/graphics/Planet-Initialize.png",
        icon_size = 64,
        tint = {0.5,0.5,0},
        subgroup = "Arco-planet-arcofolding",
        order = "a[Arco-planet]"
    },
    {
        ingredients = {
            {name = "Arco-boulder", amount = 7}
        },
        results = {
            {name = "Pride-Arco-boulder", amount = 1},
            {name = "Greed-Arco-boulder", amount = 1},
            {name = "Lust-Arco-boulder", amount = 1},
            {name = "Envy-Arco-boulder", amount = 1},
            {name = "Gluttony-Arco-boulder", amount = 1},
            {name = "Wrath-Arco-boulder", amount = 1},
            {name = "Sloth-Arco-boulder", amount = 1}
        },
        icon = "__arcotorio__/graphics/Boulder-Initialize.png",
        icon_size = 64,
        tint = {0.5,0.5,0},
        subgroup = "Arco-boulder-arcofolding",
        order = "a[Arco-boulder]"
    },
    {
        ingredients = {
            {name = "Arco-orb", amount = 4}
        },
        results = {
            {name = "Water-Arco-orb", amount = 1},
            {name = "Fire-Arco-orb", amount = 1},
            {name = "Earth-Arco-orb", amount = 1},
            {name = "Air-Arco-orb", amount = 1}
        },
        icon = "__arcotorio__/graphics/Orb-Initialize.png",
        icon_size = 64,
        tint = {0.5,0.5,0},
        subgroup = "Arco-orb-arcofolding",
        order = "a[Arco-orb]"
    },
    {
        ingredients = {
            {name = "Arco-bead", amount = 3}
        },
        results = {
            {name = "Paper-Arco-bead", amount = 1},
            {name = "Rock-Arco-bead", amount = 1},
            {name = "Scissors-Arco-bead", amount = 1}
        },
        icon = "__arcotorio__/graphics/Bead-Initialize.png",
        icon_size = 64,
        tint = {0.5,0.5,0},
        subgroup = "Arco-bead-arcofolding",
        category = "crafting",
        order = "a[Arco-bead]"
    }
}
--generates recipes based off this info
for _, recipe_data in pairs(folds) do
    name = recipe_data.name or recipe_data.result or recipe_data.main_product or (recipe_data.ingredients[1].name .. "-initialize")
    local recipe = {
        type = "recipe",
        name = name,
        main_product = recipe_data.main_product,
        icon = recipe_data.icon,
        icon_size = recipe_data.icon_size,
        tint = recipe_data.tint,
        category = recipe_data.category or "arcofolding",
        subgroup = recipe_data.subgroup,
        result = recipe_data.result,
        result_count = recipe_data.result_count,
        results = recipe_data.results,
        ingredients = recipe_data.ingredients,
        energy_required = recipe_data.seconds or 2,
        enabled = false,
        order = recipe_data.order or ("b["..name.."]")
    }
    data:extend{recipe}
end

data:extend{bead, orb, boulder, planet, mcarco, arcofolder, adv_arcofolder, mcarcofolder}
