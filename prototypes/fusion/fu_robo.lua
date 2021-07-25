--local functions
local function config(name)
    return settings.startup['fu_robo_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_robo/fu_robo_'..name
end

--item
data:extend({
    {
        name = 'fu_robo_logistic_item',
        type = 'item',
        icon = sprite('logistic_item.png'),
        icon_size = 64,
        place_result = 'fu_robo_logistic_entity',
        stack_size = 50,
        subgroup = 'fu_item_subgroup_d',
        order = 'b-a',
	},
	{
        name = 'fu_robo_construction_item',
        type = 'item',
        icon = sprite('construction_item.png'),
        icon_size = 64,
        place_result = 'fu_robo_construction_entity',
        stack_size = 50,
        subgroup = 'fu_item_subgroup_d',
        order = 'b-b',
    },
})

data:extend({
    {
        name = 'fu_robo_logistic_entity',
        type = 'logistic-robot',
        icon = sprite('logistic_entity_icon.png'),
        icon_size = 64,
        flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
        max_health = 800,
        corpse = 'big-remnants',
        collision_box = {{0, 0}, {0, 0}},
		selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
        minable = {
            mining_time = 1,
            result = 'fu_robo_logistic_item',
        },
        max_payload_size = 5,
		speed = 0.24,
		transfer_distance = 0.5,
		max_energy = "20MJ",
		energy_per_tick = "0.14kJ",
		speed_multiplier_when_out_of_energy = 0.2,
		energy_per_move = "10kJ",
		min_to_charge = 0.2,
		max_to_charge = 0.9,
		cargo_centered = {0.0, 0.2},
        idle =
		{
			filename = sprite('logistic_entity_animation.png'),
			priority = "high",
			line_length = 16,
			width = 128,
			height = 128,
			scale = 0.5,
			frame_count = 1,
			shift = {0,0},
			direction_count = 16,			
		},
		idle_with_cargo =
		{
			filename = sprite('logistic_entity_animation.png'),
			priority = "high",
			line_length = 16,
			width = 128,
			height = 128,
			scale = 0.5,
			frame_count = 1,
			shift = {0,0},
			direction_count = 16,				
        },
        in_motion =
		{
			filename = sprite('logistic_entity_animation.png'),
			priority = "high",
			line_length = 16,
			width = 128,
			height = 128,
			scale = 0.5,
			frame_count = 1,
			shift = {0,0},
			direction_count = 16,				
        },
		in_motion_with_cargo =
		{
			filename = sprite('logistic_entity_animation.png'),
			priority = "high",
			line_length = 16,
			width = 128,
			height = 128,
			scale = 0.5,
			frame_count = 1,
			shift = {0,0},
			direction_count = 16,				
        },
        shadow_idle =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			y = 29,
			draw_as_shadow = true,
		},
		shadow_in_motion =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			draw_as_shadow = true,
		},
		shadow_idle_with_cargo =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			draw_as_shadow = true,
        },
        shadow_in_motion_with_cargo =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			draw_as_shadow = true,
        },
	},
	{
        name = 'fu_robo_construction_entity',
        type = 'construction-robot',
        icon = sprite('construction_entity_icon.png'),
        icon_size = 64,
        flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
        max_health = 800,
        corpse = 'big-remnants',
        collision_box = {{0, 0}, {0, 0}},
		selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
        minable = {
            mining_time = 1,
            result = 'fu_robo_construction_item',
		},
		working_light = {intensity = 0.8, size = 3},
        max_payload_size = 5,
		speed = 0.24,
		transfer_distance = 0.5,
		max_energy = "20MJ",
		energy_per_tick = "0.14kJ",
		speed_multiplier_when_out_of_energy = 0.2,
		energy_per_move = "10kJ",
		min_to_charge = 0.2,
		max_to_charge = 0.9,
		cargo_centered = {0.0, 0.2},
		construction_vector = {0.30, 0.22},
        idle =
		{
			filename = sprite('construction_entity_animation.png'),
			priority = "high",
			line_length = 16,
			width = 128,
			height = 128,
			scale = 0.5,
			frame_count = 1,
			shift = {0,0},
			direction_count = 16,			
		},
        in_motion =
		{
			filename = sprite('construction_entity_animation.png'),
			priority = "high",
			line_length = 16,
			width = 128,
			height = 128,
			scale = 0.5,
			frame_count = 1,
			shift = {0,0},
			direction_count = 16,				
        },
        shadow_idle =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			y = 29,
			draw_as_shadow = true,
		},
		shadow_in_motion =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			draw_as_shadow = true,
		},
		working =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			draw_as_shadow = true,
		},
		shadow_working =
		{
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 58,
			height = 29,
			frame_count = 1,
			direction_count = 16,
			draw_as_shadow = true,
		},
		smoke =
		{
			filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
			width = 39,
			height = 32,
			frame_count = 19,
			line_length = 19,
			shift = {0.078125, -0.15625},
			animation_speed = 0.3,
		},
	},
})