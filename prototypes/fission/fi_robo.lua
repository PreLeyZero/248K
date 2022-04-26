--local functions
local function config(name)
    return settings.startup['fi_robo_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_robo/fi_robo_'..name
end

--item
data:extend({
    {
        name = 'fi_robo_port_item',
        type = 'item',
        icon = sprite('port_item.png'),
        icon_size = 64,
        place_result = 'fi_robo_port_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-b',
    },
    {
        name = 'fi_robo_charger_item',
        type = 'item',
        icon = sprite('charger_item.png'),
        icon_size = 64,
        place_result = 'fi_robo_charger_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
    --prototype port
    {
        name = 'fi_robo_port_entity',
        type = 'roboport',
        icon = sprite('port_entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.3,-1.3},{1.3,1.3}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_robo_port_item',
        },
        energy_source = {
            type = 'electric',
            buffer_capacity = '400MJ',
            usage_priority = 'secondary-input',
            input_flow_limit = '160MW',
        },
        energy_usage = '4MW',
        charge_approach_distance = 2,
        charging_energy = '2MW',
        recharge_minimum = '1MW',
        charging_station_count = 4, 
        construction_radius = 70,
        logistics_radius = 70,
        material_slots_count = 10,
        robot_slots_count = 10,
        request_to_open_door_timeout = 15,
        spawn_and_station_height = 1.2,
        robots_shrink_when_entering_and_exiting = true,

        base = {
            filename = sprite('port_base.png'),
            width = 600,
            height = 600,
            scale = 0.2,
            shift = {0,-0.3},
        },
        base_patch = {
            filename = sprite('port_base.png'),
            width = 64,
            height = 64,
        },
        base_animation = {
            filename = sprite('port_base.png'),
            width = 64,
            height = 1,
            line_length = 1,
            --lines_per_file = 1,
            animation_speed = 0.5,
            frame_count = 6,
            scale = 1,
        },
        door_animation_up = {
            filename = sprite('port_door_animation.png'),
            width = 600,
            height = 600,
            scale = 0.2,
            shift = {0,-0.3},
            line_length = 4,
            --lines_per_file = 1,
            animation_speed = 0.5,
            frame_count = 4,
        },
        door_animation_down = {
            filename = sprite('port_door_animation.png'),
            width = 600,
            height = 600,
            scale = 0.2,
            shift = {0,-0.3},
            line_length = 4,
            --lines_per_file = 1,
            animation_speed = 0.5,
            frame_count = 4,
        },
        recharging_animation = {
            filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
			priority = "high",
			width = 37,
			height = 35,
			frame_count = 16,
			scale = 1.5,
			animation_speed = 0.5
        },
 
        
    },
    --charger
    {
        name = 'fi_robo_charger_entity',
        type = 'roboport',
        icon = sprite('charger_entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.3,-1.3},{1.3,1.3}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_robo_charger_item',
        },
        energy_source = {
            type = 'electric',
            buffer_capacity = '400MJ',
            usage_priority = 'secondary-input',
            input_flow_limit = '40MW',
        },
        energy_usage = '4MW',
        charge_approach_distance = 2,
        charging_energy = '6MW',
        recharge_minimum = '1MW',
        charging_station_count = 6, 
        construction_radius = 1,
        logistics_radius = 1,
        material_slots_count = 0,
        robot_slots_count = 0,
        request_to_open_door_timeout = 4,
        spawn_and_station_height = 2,

        base = {
            filename = sprite('charger_base_2.png'),
            width = 600,
            height = 600,
            scale = 0.2,
            shift = {0,-0.3},
        },
        base_patch = {
            filename = sprite('charger_base.png'),
            width = 64,
            height = 64,
        },
        base_animation = {
            filename = sprite('charger_animation_2.png'),
            width = 600,
            height = 600,
            line_length = 5,
            lines_per_file = 1,
            scale = 0.2,
            animation_speed = 0.3,
            frame_count = 5,
            shift = {0,-0.3},
        },
        door_animation_up = {
            filename = sprite('charger_base.png'),
            width = 64,
            height = 1,
            line_length = 1,
            --lines_per_file = 1,
            animation_speed = 0.5,
            frame_count = 6,
            scale = 1,
        },
        door_animation_down = {
            filename = sprite('charger_base.png'),
            width = 64,
            height = 1,
            line_length = 1,
            --lines_per_file = 1,
            animation_speed = 0.5,
            frame_count = 6,
            scale = 1,
        },
        recharging_animation = {
            filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
			priority = "high",
			width = 37,
			height = 35,
			frame_count = 16,
			scale = 1.5,
			animation_speed = 0.5
        }
        

        
        
    },
})