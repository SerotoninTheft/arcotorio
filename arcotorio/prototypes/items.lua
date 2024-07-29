local arco_gen = require("graphics.arco-gen")

data:extend(arco_gen.arco_beads)


--[[ data:extend({
    {
        type = "item",
        name = "Arco-bead",
        icon = "__Arcotorio__/graphics/Arco-bead.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Rock-Arco-bead",
        icon = "__Arcotorio__/graphics/Rock-Arco-bead.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Paper-Arco-bead",
        icon = "__Arcotorio__/graphics/Paper-Arco-bead.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Scissors-Arco-bead",
        icon = "__Arcotorio__/graphics/Scissors-Arco-bead.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Arco-orb",
        icon = "__Arcotorio__/graphics/Arco-orb.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Water-Arco-orb",
        icon = "__Arcotorio__/graphics/Water-Arco-orb.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Air-Arco-orb",
        icon = "__Arcotorio__/graphics/Air-Arco-orb.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Fire-Arco-orb",
        icon = "__Arcotorio__/graphics/Fire-Arco-orb.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Earth-Arco-orb",
        icon = "__Arcotorio__/graphics/Earth-Arco-orb.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Arco-boulder",
        icon = "__Arcotorio__/graphics/Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Pride-Arco-boulder",
        icon = "__Arcotorio__/graphics/Pride-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Greed-Arco-boulder",
        icon = "__Arcotorio__/graphics/Greed-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Lust-Arco-boulder",
        icon = "__Arcotorio__/graphics/Lust-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Envy-Arco-boulder",
        icon = "__Arcotorio__/graphics/Envy-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Gluttony-Arco-boulder",
        icon = "__Arcotorio__/graphics/Gluttony-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Wrath-Arco-boulder",
        icon = "__Arcotorio__/graphics/Wrath-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Sloth-Arco-boulder",
        icon = "__Arcotorio__/graphics/Sloth-Arco-boulder.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Arco-planet",
        icon = "__Arcotorio__/graphics/Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Mercury-Arco-planet",
        icon = "__Arcotorio__/graphics/Mercury-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Venus-Arco-planet",
        icon = "__Arcotorio__/graphics/Venus-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Earth-Arco-planet",
        icon = "__Arcotorio__/graphics/Earth-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Mars-Arco-planet",
        icon = "__Arcotorio__/graphics/Mars-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Jupiter-Arco-planet",
        icon = "__Arcotorio__/graphics/Jupiter-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Saturn-Arco-planet",
        icon = "__Arcotorio__/graphics/Saturn-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Uranus-Arco-planet",
        icon = "__Arcotorio__/graphics/Uranus-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Neptune-Arco-planet",
        icon = "__Arcotorio__/graphics/Neptune-Arco-planet.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "McArco-sphere",
        icon = "__Arcotorio__/graphics/McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Walmart-McArco-sphere",
        icon = "__Arcotorio__/graphics/Walmart-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "McDonalds-McArco-sphere",
        icon = "__Arcotorio__/graphics/McDonalds-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Tesco-McArco-sphere",
        icon = "__Arcotorio__/graphics/Tesco-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Wendys-McArco-sphere",
        icon = "__Arcotorio__/graphics/Wendys-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Subway-McArco-sphere",
        icon = "__Arcotorio__/graphics/Subway-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "White-Castle-McArco-sphere",
        icon = "__Arcotorio__/graphics/White-Castle-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Taco-Bell-McArco-sphere",
        icon = "__Arcotorio__/graphics/Taco-Bell-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "KFC-McArco-sphere",
        icon = "__Arcotorio__/graphics/KFC-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Jimmy-Johns-McArco-sphere",
        icon = "__Arcotorio__/graphics/Jimmy-Johns-McArco-sphere.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        stack_size = 100
    },
    {
        type = "item",
        name = "Arcofolder",
        icon = "__Arcotorio__/graphics/Arcofolder-icon.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a[Arcofolder]",
        place_result = "Arcofolder",
        stack_size = 50
    },
    {
        type = "item",
        name = "Advanced Arcofolder",
        icon = "__Arcotorio__/graphics/Advanced-arcofolder-icon.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a[Advanced arcofolder]",
        place_result = "Advanced arcofolder",
        stack_size = 50
    },
    {
        type = "item",
        name = "McArcofolder",
        icon = "__Arcotorio__/graphics/McArcofolder-icon.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a[McArcofolder]",
        place_result = "McArcofolder",
        stack_size = 50
    },
})
 ]]
