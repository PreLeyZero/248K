--local functions
local function config(name)
    return settings.startup['el_ki_beacon_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_ki/el_ki_beacon/el_ki_beacon_'..name
end

local function config_blueprintable(name,int)
    if not config('blueprintable') then
        if int == 1 then
            return 'no-copy-paste'
        end
        if int == 2 then
            return 'not-blueprintable'
        end
    end    
    return "player-creation"
end


--item
data:extend({
    {
        name = 'el_ki_beacon_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'el_ki_beacon_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_f',
        order = 'b-a',
    },
    {
        name = 'fi_ki_beacon_item',
        type = 'item',
        icon = sprite('fi.png'),
        icon_size = 64,
        place_result = 'fi_ki_beacon_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_k',
        order = 'b-a',
    },
    {
        name = 'fu_ki_beacon_item',
        type = 'item',
        icon = sprite('fu.png'),
        icon_size = 64,
        place_result = 'fu_ki_beacon_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_k',
        order = 'b-a',
    },

})

--entity
data:extend({
    {
        name = 'el_ki_beacon_entity',
        type = 'beacon',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","no-automated-item-insertion","no-automated-item-removal","not-upgradable","hide-alt-info",config_blueprintable('el_ki_beacon',1),config_blueprintable('el_ki_beacon',2)},
       
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        map_color = {r=0, g=0, b=1, a=1},
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        minable = {
            mining_time = 1,
            result = 'el_ki_beacon_item',
        },
        distribution_effectivity = config('effectivity'),
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            input_flow_limit = '400MW',
        },
        energy_usage = '0.4MW',
        module_specification = {
            module_slots = 2,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3,
        },
        supply_area_distance = config('supply_area'),
        radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
			width = 10,
			height = 10,
        },
        animation = {
            
            filename = sprite('entity_animation.png'),
            width = 480,
            height = 480,
            line_length = 4,
			lines_per_file = 1,
            animation_speed = 0.1,
            frame_count = 4,
            scale = 0.13,
            shift = { 0, 0},
        },
    },
    --slave
    {
        name = 'el_ki_beacon_slave_entity',
        type = 'container',
        icon = sprite('slave_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        selection_priority = 60,
        picture = {
            filename = sprite('slave_entity_animation.png'),
            width = 64,
            height = 64
        },
        inventory_size = 1,
    },

    {
        name = 'fi_ki_beacon_entity',
        type = 'beacon',
        icon = sprite('fi.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","no-automated-item-insertion","no-automated-item-removal","not-upgradable","hide-alt-info",config_blueprintable('el_ki_beacon',1),config_blueprintable('el_ki_beacon',2)},
       
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        minable = {
            mining_time = 1,
            result = 'fi_ki_beacon_item',
        },
        distribution_effectivity = config('effectivity_2'),
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            input_flow_limit = '400MW',
        },
        energy_usage = '4MW',
        module_specification = {
            module_slots = 6,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3,
        },
        supply_area_distance = config('supply_area_2'),
        radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
			width = 10,
			height = 10,
        },
        animation = {
            
            filename = sprite('entity_animation_2.png'),
            width = 480,
            height = 480,
            line_length = 4,
			lines_per_file = 1,
            animation_speed = 0.1,
            frame_count = 4,
            scale = 0.2,
            shift = { 0, 0},
        },
    },
    --slave
    {
        name = 'fi_ki_beacon_slave_entity',
        type = 'container',
        icon = sprite('slave_entity_icon.png'),
        flags = {"placeable-off-grid"},
        icon_size = 64,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        selection_priority = 60,
        picture = {
            filename = sprite('slave_entity_animation.png'),
            width = 64,
            height = 64
        },
        inventory_size = 1,
    },
    {
        name = 'fu_ki_beacon_entity',
        type = 'beacon',
        icon = sprite('fu.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","no-automated-item-insertion","no-automated-item-removal","not-upgradable","hide-alt-info",config_blueprintable('el_ki_beacon',1),config_blueprintable('el_ki_beacon',2)},
       
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.8,-1.8},{1.8,1.8}},
        selection_box = {{-2,-2},{2,2}},
        map_color = {r=0, g=0, b=1, a=1},
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        minable = {
            mining_time = 1,
            result = 'fu_ki_beacon_item',
        },
        distribution_effectivity = config('effectivity_3'),
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            input_flow_limit = '400MW',
        },
        energy_usage = '40MW',
        module_specification = {
            module_slots = 18,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3,
        },
        supply_area_distance = config('supply_area_3'),
        radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
			width = 10,
			height = 10,
        },
        animation = {
            
            filename = sprite('entity_animation_3.png'),
            width = 480,
            height = 480,
            line_length = 4,
			lines_per_file = 1,
            animation_speed = 0.1,
            frame_count = 4,
            scale = 0.27,
            shift = { 0, 0},
        },
    },
    --slave
    {
        name = 'fu_ki_beacon_slave_entity',
        type = 'container',
        icon = sprite('slave_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        selection_priority = 60,
        picture = {
            filename = sprite('slave_entity_animation.png'),
            width = 64,
            height = 64
        },
        inventory_size = 1,
    }

})



