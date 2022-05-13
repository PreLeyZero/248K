--local functions
local function config(name)
    return settings.startup['el_diesel_train_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_diesel_train/el_diesel_train_'..name
end

--item
data:extend({
    {
        name = 'el_diesel_train_item',
        type = 'item-with-entity-data',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'el_diesel_train_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_d',
        order = 'a-a',
    },
})

--entity
data:extend({
    {
        name = 'el_diesel_train_entity',
        type = 'locomotive',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","placeable-off-grid"},
        max_health = 1200,
		corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
		selection_box = {{-1, -3}, {1, 3}},
        drawing_box = {{-1, -4}, {1, 3}},
        connection_distance = 3,
        joint_distance = 4,
        wheels = standard_train_wheels,
        rail_category = "regular",
        open_sound = {filename = "__base__/sound/car-door-open.ogg", volume = 0.7},
        close_sound = {filename = "__base__/sound/car-door-close.ogg", volume = 0.7},
        sound_minimum_speed = 0.2,
        allow_manual_color = false,
        minable = {
            mining_time = 1,
            result = 'el_diesel_train_item',
        },
        --stats
        max_speed = 1.20,
        max_power = '1800kW',
        braking_force = 40,
        friction_force = 0.00825,
        air_resistance = 0.00225,
        vertical_selection_shift = -0.5,
        energy_per_hit_point = 8,
        reversing_power_modifier = 0.5,
        weight = 3200,
        --grid
        equipment_grid = 'el_train_equipment_grid',
        --burner
        burner = {
            fuel_category = 'el_train_fuel',
            fuel_inventory_size = 3,
            effectitvity = 1,
            emissions_per_minute = 40,
            smoke = {
                {
                    name = "train-smoke",
                    deviation = {0.3, 0.3},
                    frequency = 300,
                    position = {0, 0},
                    starting_frame = 0,
                    starting_frame_deviation = 60,
                    height = 2,
                    height_deviation = 0.5,
                    starting_vertical_speed = 0.2,
                    starting_vertical_speed_deviation = 0.1, 
                },
            },
        },
        --light
        front_light = {
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture = {
                    filename = "__core__/graphics/light-cone.png",
                    priority = "medium",
                    scale = 2,
                    width = 200,
                    height = 200,
                },
                shift = {-0.3, -10},
                size = 1,
                intensity = 1.5,
            },
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture = {
                    filename = "__core__/graphics/light-cone.png",
                    priority = "medium",
                    scale = 2,
                    width = 200,
                    height = 200,
                },
                shift = {0.3, -10},
                size = 1,
                intensity = 1.5,
            },
        },
        --animation
        pictures = {
			priority = "low",
			width = 512,
			height = 512,
			direction_count = 128,
			filenames = {sprite('animation_1.png'),sprite('animation_2.png')},
			line_length = 8,
			lines_per_file = 8,
            shift = {0.2, -0.6},
            scale = 0.5,
        },
        --minimap
        minimap_representation = {
			filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5,
		},
		selected_minimap_representation = {
			filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5,
        },
        --stop trigger
        stop_trigger = {
            -- left side
            {
                type = "create-trivial-smoke",
                repeat_count = 75,
                smoke_name = "smoke-train-stop",
                initial_height = 0,
                -- smoke goes to the left
                speed = {-0.03, 0},
                speed_multiplier = 0.75,
                speed_multiplier_deviation = 1.1,
                offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}},
            },
            -- right side
            {
                type = "create-trivial-smoke",
                repeat_count = 75,
                smoke_name = "smoke-train-stop",
                initial_height = 0,
                -- smoke goes to the right
                speed = {0.03, 0},
                speed_multiplier = 0.75,
                speed_multiplier_deviation = 1.1,
                offset_deviation = {{0.3, -2.7}, {0.75, 2.7}},
            },
            {
                type = "play-sound",
                sound = {
                    {
                        filename = "__base__/sound/train-breaks.ogg",
                        volume = 0.2,
                    }
                },
            },
        },
        working_sound = { 
            sound = { filename ='__base__/sound/train-engine.ogg'},
            apparent_volume = 0.2,
        }, 
        vehicle_impact_sound = {
            filename = "__base__/sound/car-metal-impact-6.ogg",
            volume = 0.3
        },

    },
})