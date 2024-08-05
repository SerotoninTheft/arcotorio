data:extend({
    {
        type = "assembling-machine",
        name = "Arcofolder",
        icon = "__arcotorio__/graphics/arcofolder/Arcofolder-icon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "Arcofolder"},
        max_health = 300,
        fast_replaceable_group = "arcofolder",
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
            filename = "__arcotorio__/graphics/arcofolder/Arcofolder-integration.png",
            height = 98,
            width = 98,
            scale = 0.54 * 2,
            shift = {x = 0 / 64, y = 0 / 64},
            hr_version = {
                filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-integration.png",
                height = 196,
                width = 196,
                scale = 0.54,
                shift = {x = 0 / 64, y = 0 / 64},
            }
        },
        module_specification = {
            module_slots = 1
        },
        status_colors = {
            insufficient_input = {r = 1, g = 1, b = 0, a = 1},
            idle = {1, 0, 1, 1}
        },
        working_visualisations = {
            {
                --draw_as_light = true,
                apply_tint = "status",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-primary.png",
                    height = 80,
                    width = 90,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -2 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-primary.png",
                        height = 159,
                        width = 180,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -3.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "primary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-primary.png",
                    height = 80,
                    width = 90,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -2 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-primary.png",
                        height = 159,
                        width = 180,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -3.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "secondary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-secondary.png",
                    height = 56,
                    width = 78,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -20 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-secondary.png",
                        height = 111,
                        width = 154,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -39.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "tertiary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-tertiary.png",
                    height = 72,
                    width = 59,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = -8.5 / 32, y = 2 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-tertiary.png",
                        height = 144,
                        width = 117,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = -17.5 / 64, y = 4 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "quaternary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-quaternary.png",
                    height = 31,
                    width = 26,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 8 / 32, y = -18.5 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-quaternary.png",
                        height = 64,
                        width = 49,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = 15.5 / 64, y = -36 / 64},
                    }
                }
            },
        },
        animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder.png",
                    height = 98,
                    width = 97,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 0 / 64, y = 0 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder.png",
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
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-shadow.png",
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
        --[[ idle_animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-idle.png",
                    height = 98,
                    width = 98,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-idle.png",
                        height = 196,
                        width = 196,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                    }
                },
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-shadow.png",
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
        }, ]]
        allowed_effects = {"consumption", "speed", "pollution"},
    }--[[@as data.AssemblingMachinePrototype]],
    {
        type = "assembling-machine",
        name = "Advanced-Arcofolder",
        icons = {{icon = "__arcotorio__/graphics/arcofolder/Arcofolder-icon.png", tint = {0, 1, 0}}},
        --icon = "__arcotorio__/graphics/advanced-arcofolder-icon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "Advanced-Arcofolder"},
        max_health = 300,
        fast_replaceable_group = "arcofolder",
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
            filename = "__arcotorio__/graphics/arcofolder/Arcofolder-integration.png",
            height = 98,
            width = 98,
            scale = 0.54 * 2,
            shift = {x = 0 / 64, y = 0 / 64},
            hr_version = {
                filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-integration.png",
                height = 196,
                width = 196,
                scale = 0.54,
                shift = {x = 0 / 64, y = 0 / 64},
            }
        },
        module_specification = {
            module_slots = 2
        },
        status_colors = {
            insufficient_input = {r = 1, g = 1, b = 0, a = 1},
            idle = {1, 0, 1, 1}
        },
        working_visualisations = {
            {
                --draw_as_light = true,
                apply_tint = "status",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-primary.png",
                    height = 80,
                    width = 90,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -2 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-primary.png",
                        height = 159,
                        width = 180,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -3.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "primary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-primary.png",
                    height = 80,
                    width = 90,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -2 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-primary.png",
                        height = 159,
                        width = 180,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -3.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "secondary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-secondary.png",
                    height = 56,
                    width = 78,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -20 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-secondary.png",
                        height = 111,
                        width = 154,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -39.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "tertiary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-tertiary.png",
                    height = 72,
                    width = 59,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = -8.5 / 32, y = 2 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-tertiary.png",
                        height = 144,
                        width = 117,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = -17.5 / 64, y = 4 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "quaternary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-quaternary.png",
                    height = 31,
                    width = 26,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 8 / 32, y = -18.5 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-quaternary.png",
                        height = 64,
                        width = 49,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = 15.5 / 64, y = -36 / 64},
                    }
                }
            },
        },
        animation = {
            layers = {
                {
                    tint = {0, 1, 0},
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder.png",
                    height = 98,
                    width = 97,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 0 / 64, y = 0 / 64},
                    hr_version = {
                        tint = {0, 1, 0},
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder.png",
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
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-shadow.png",
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
        --[[ idle_animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-idle.png",
                    height = 98,
                    width = 98,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-idle.png",
                        height = 196,
                        width = 196,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                    }
                },
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-shadow.png",
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
        }, ]]
        allowed_effects = {"consumption", "speed", "pollution"},
    }--[[@as data.AssemblingMachinePrototype]],
    {
        type = "assembling-machine",
        name = "McArcofolder",
        icons = {{icon = "__arcotorio__/graphics/arcofolder/Arcofolder-icon.png", tint = {1, 0, 1}}},
        --icon = "__arcotorio__/graphics/McArcofolder-icon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "McArcofolder"},
        max_health = 300,
        fast_replaceable_group = "arcofolder",
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
            filename = "__arcotorio__/graphics/arcofolder/Arcofolder-integration.png",
            height = 98,
            width = 98,
            scale = 0.54 * 2,
            shift = {x = 0 / 64, y = 0 / 64},
            hr_version = {
                filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-integration.png",
                height = 196,
                width = 196,
                scale = 0.54,
                shift = {x = 0 / 64, y = 0 / 64},
            }
        },
        module_specification = {
            module_slots = 3
        },
        status_colors = {
            insufficient_input = {r = 1, g = 1, b = 0, a = 1},
            idle = {1, 0, 1, 1}
        },
        working_visualisations = {
            {
                --draw_as_light = true,
                apply_tint = "status",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-primary.png",
                    height = 80,
                    width = 90,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -2 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-primary.png",
                        height = 159,
                        width = 180,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -3.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "primary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-primary.png",
                    height = 80,
                    width = 90,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -2 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-primary.png",
                        height = 159,
                        width = 180,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -3.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "secondary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-secondary.png",
                    height = 56,
                    width = 78,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 5,
                    shift = {x = 0 / 64, y = -20 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-secondary.png",
                        height = 111,
                        width = 154,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 5,
                        shift = {x = 0 / 64, y = -39.5 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "tertiary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-tertiary.png",
                    height = 72,
                    width = 59,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = -8.5 / 32, y = 2 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-tertiary.png",
                        height = 144,
                        width = 117,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = -17.5 / 64, y = 4 / 64},
                    }
                }
            },
            {
                draw_as_light = true,
                apply_recipe_tint = "quaternary",
                animation = {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-quaternary.png",
                    height = 31,
                    width = 26,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 8 / 32, y = -18.5 / 32},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-quaternary.png",
                        height = 64,
                        width = 49,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 30,
                        line_length = 6,
                        shift = {x = 15.5 / 64, y = -36 / 64},
                    }
                }
            },
        },
        animation = {
            layers = {
                {
                    tint = {1, 0, 1},
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder.png",
                    height = 98,
                    width = 97,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 30,
                    line_length = 6,
                    shift = {x = 0 / 64, y = 0 / 64},
                    hr_version = {
                        tint = {1, 0, 1},
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder.png",
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
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-shadow.png",
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
        --[[ idle_animation = {
            layers = {
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-idle.png",
                    height = 98,
                    width = 98,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-idle.png",
                        height = 196,
                        width = 196,
                        scale = 0.5,
                        animation_speed = 0.5,
                        frame_count = 1,
                        repeat_count = 30,
                    }
                },
                {
                    filename = "__arcotorio__/graphics/arcofolder/Arcofolder-shadow.png",
                    height = 73,
                    width = 108,
                    scale = 1,
                    animation_speed = 0.5,
                    frame_count = 1,
                    repeat_count = 30,
                    draw_as_shadow = true,
                    shift = {x = 10 / 64, y = 29 / 64},
                    hr_version = {
                        filename = "__arcotorio__/graphics/arcofolder/hr-Arcofolder-shadow.png",
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
        }, ]]
        allowed_effects = {"consumption", "speed", "pollution"},
    }--[[@as data.AssemblingMachinePrototype]]
})
