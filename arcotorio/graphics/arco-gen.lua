local deform = {}
for i = 1, 16 do
    deform[i] = {
        file = {
            filename = "__arcotorio__/graphics/deform/deform-" .. i .. ".png",
            size = 32,
            scale = 0.5,
            hr_version = {
                filename = "__arcotorio__/graphics/deform/hr-deform-" .. i .. ".png",
                size = 64,
                scale = 0.25
            }
        },
        icon = {
            icon = "__arcotorio__/graphics/deform/deform-" .. i .. ".png",
            icon_size = 32
        }
    }
end
local sphere = {
    file = {
        filename = "__arcotorio__/graphics/sphere.png",
        size = 64
    },
    icon = {
        icon = "__arcotorio__/graphics/sphere.png",
        icon_size = 64
    },
}
local glow_layer = function(tint) return {
    file = {
        filename = "__arcotorio__/graphics/glow-layer.png",
        size = 32,
        scale = 0.5,
        tint = tint,
        hr_version = {
            filename = "__arcotorio__/graphics/hr-glow-layer.png",
            size = 64,
            scale = 0.25,
            tint = tint,
        }
    },
    icon = {
        icon = "__arcotorio__/graphics/glow-layer.png",
        tint = tint,
        icon_size = 32
    }
} end

local function gen_arco_beads()
    local top = {
        {name = "paper",    tint = {1,0,0}},
        {name = "rock",     tint = {0,1,0}},
        {name = "scissors", tint = {0,0,1}}
    }
    local items = {}
    for i = 1, 3 do
        items[i] = {
            name = "arco-"..top[i].name,
            type = "item",
            --pictures = {},
            stack_size = 100,
            subgroup = "production-machine",
            order = "a[Arco-bead][".. top[i].name .."]",
            icons = {
                deform[i].icon,
                glow_layer(top[i].tint).icon,
                {
                    icon = "__arcotorio__/graphics/symbols/beads/" .. top[i].name .. ".png",
                    icon_size = 32
                }
            }
        }
        --[[ for j = 1, 16 do
            items[i].pictures[j] = {
                layers = {
                    deform[j].file,
                    glow_layer(top[i].tint).file,
                    {
                        filename = "__arcotorio__/graphics/symbols/beads/" .. top[i].name .. ".png",
                        size = 32,
                        scale = 0.5,
                        hr_version = {
                            filename = "__arcotorio__/graphics/symbols/beads/hr-" .. top[i].name .. ".png",
                            size = 64,
                            scale = 0.25
                        }
                    }
                }
            }
        end ]]
    end
    return items
end

local function gen_arco_orbs()

end

local function gen_arco_boulders()

end

local function gen_arco_planets()

end

local function gen_mc_arco_spheres()

end

return {
    arco_beads = gen_arco_beads(),
    arco_orbs = gen_arco_orbs(),
    arco_boulders = gen_arco_boulders(),
    arco_planets = gen_arco_planets(),
    mc_arco_spheres = gen_mc_arco_spheres(),
}
