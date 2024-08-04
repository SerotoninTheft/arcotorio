data:extend({
    {
        type = "assembling-machine",
        name = "Arcofolder",
        icon = "__arcotorio__/graphics/Arcofolder-icon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "Arcofolder"},
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        crafting_categories = {"arcofolding"},
        crafting_speed = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = 0.04
        },
        energy_usage = "10kW",
        ingredient_count = 6,
        integration_patch = {
            filename = "__arcotorio__/graphics/Arcofolder-integration.png",
            height = 98,
            width = 98,
            scale = 0.54 * 2,
            shift = {x = 0 / 64, y = 0 / 64},
            hr_version = {
                filename = "__arcotorio__/graphics/hr-Arcofolder-integration.png",
                height = 196,
                width = 196,
                scale = 0.54,
                shift = {x = 0 / 64, y = 0 / 64},
            }
        },
        animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/Arcofolder.png",
                    height = 98,
                    width = 97,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 0 / 64, y = 0 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder.png",
                        height = 196,
                        width = 194,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = 0 / 64, y = 0 / 64},
                    }
                },
                {
                    filename = "__arcotorio__/graphics/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-shadow.png",
                        height = 145,
                        width = 215,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                        draw_as_shadow = true,
                        shift = {x = 10 / 64, y = 29 / 64}
                    }
                }
            }
        },
        idle_animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/Arcofolder-idle.png",
                    height = 98,
                    width = 98,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-idle.png",
                        height = 196,
                        width = 196,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                    }
                },
                {
                    filename = "__arcotorio__/graphics/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-shadow.png",
                        height = 145,
                        width = 215,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                        draw_as_shadow = true,
                        shift = {x = 10 / 64, y = 29 / 64}
                    }
                }
            }
        },
        allowed_effects = {"consumption", "speed", "pollution"},
    },
    {
        type = "assembling-machine",
        name = "Advanced-Arcofolder",
        icon = "__arcotorio__/graphics/advanced-arcofolder-icon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "Advanced-Arcofolder"},
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        crafting_categories = {"arcofolding"},
        crafting_speed = 2,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = 0.04
        },
        energy_usage = "400kW",
        ingredient_count = 6,
        integration_patch = {
            filename = "__arcotorio__/graphics/Arcofolder-integration.png",
            height = 98,
            width = 98,
            scale = 0.54 * 2,
            shift = {x = 0 / 64, y = 0 / 64},
            hr_version = {
                filename = "__arcotorio__/graphics/hr-Arcofolder-integration.png",
                height = 196,
                width = 196,
                scale = 0.54,
                shift = {x = 0 / 64, y = 0 / 64},
            }
        },
        animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/Arcofolder.png",
                    height = 98,
                    width = 97,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 0 / 64, y = 0 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder.png",
                        height = 196,
                        width = 194,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = 0 / 64, y = 0 / 64},
                    }
                },
                {
                    filename = "__arcotorio__/graphics/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-shadow.png",
                        height = 145,
                        width = 215,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                        draw_as_shadow = true,
                        shift = {x = 10 / 64, y = 29 / 64}
                    }
                }
            }
        },
        idle_animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/Arcofolder-idle.png",
                    height = 98,
                    width = 98,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-idle.png",
                        height = 196,
                        width = 196,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                    }
                },
                {
                    filename = "__arcotorio__/graphics/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-shadow.png",
                        height = 145,
                        width = 215,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                        draw_as_shadow = true,
                        shift = {x = 10 / 64, y = 29 / 64}
                    }
                }
            }
        },
        allowed_effects = {"consumption", "speed", "pollution"},
    },
    {
        type = "assembling-machine",
        name = "McArcofolder",
        icon = "__arcotorio__/graphics/McArcofolder-icon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "McArcofolder"},
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        crafting_categories = {"arcofolding"},
        crafting_speed = 4,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = 0.12
        },
        energy_usage = "1000kW",
        ingredient_count = 6,
        integration_patch = {
            filename = "__arcotorio__/graphics/Arcofolder-integration.png",
            height = 98,
            width = 98,
            scale = 0.54 * 2,
            shift = {x = 0 / 64, y = 0 / 64},
            hr_version = {
                filename = "__arcotorio__/graphics/hr-Arcofolder-integration.png",
                height = 196,
                width = 196,
                scale = 0.54,
                shift = {x = 0 / 64, y = 0 / 64},
            }
        },
        animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/Arcofolder.png",
                    height = 98,
                    width = 97,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 0 / 64, y = 0 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder.png",
                        height = 196,
                        width = 194,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = 0 / 64, y = 0 / 64},
                    }
                },
                {
                    filename = "__arcotorio__/graphics/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-shadow.png",
                        height = 145,
                        width = 215,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                        draw_as_shadow = true,
                        shift = {x = 10 / 64, y = 29 / 64}
                    }
                }
            }
        },
        idle_animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/Arcofolder-idle.png",
                    height = 98,
                    width = 98,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-idle.png",
                        height = 196,
                        width = 196,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                    }
                },
                {
                    filename = "__arcotorio__/graphics/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/hr-Arcofolder-shadow.png",
                        height = 145,
                        width = 215,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                        draw_as_shadow = true,
                        shift = {x = 10 / 64, y = 29 / 64}
                    }
                }
            }
        },
        allowed_effects = {"consumption", "speed", "pollution"},
    },
})
