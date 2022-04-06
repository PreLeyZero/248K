--local functions
local function config(name)
    return settings.startup['el_ki_core_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_ki/el_ki_core/el_ki_core_'..name
end

local function core_input(core_number)
    if core_number == 1 then
        if config("energy_usage") == "normal" then return "20MW" end
        if config("energy_usage") == "high" then return "40MW" end
        if config("energy_usage") == "very high" then return "100MW" end
        if config("energy_usage") == "low" then return "10MW" end
    end

    if core_number == 2 then
        if config("energy_usage") == "normal" then return "200MW" end
        if config("energy_usage") == "high" then return "400MW" end
        if config("energy_usage") == "very high" then return "1000MW" end
        if config("energy_usage") == "low" then return "100MW" end
    end

    if core_number == 3 then
        if config("energy_usage") == "normal" then return "2000MW" end
        if config("energy_usage") == "high" then return "4000MW" end
        if config("energy_usage") == "very high" then return "10000MW" end
        if config("energy_usage") == "low" then return "1000MW" end
    end
end

local allowed_modules = {}
if config("productivity") then
    allowed_modules = {"speed", "productivity", "consumption", "pollution"}
else 
    allowed_modules = {"speed", "consumption", "pollution"}
end

--item
data:extend({
    {
        name = 'el_ki_core_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'el_ki_core_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_f',
        order = 'b-b',
    },
    {
        name = 'fi_ki_core_item',
        type = 'item',
        icon = sprite('fi.png'),
        icon_size = 64,
        place_result = 'fi_ki_core_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_k',
        order = 'b-b',
    },
    {
        name = 'fu_ki_core_item',
        type = 'item',
        icon = sprite('fu.png'),
        icon_size = 64,
        place_result = 'fu_ki_core_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_k',
        order = 'b-b',
    },

})

--entity
data:extend({
    {
        name = 'el_ki_core_entity',
        type = 'assembling-machine',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        crafting_categories = {'el_ki_core_category'},
        crafting_speed = 1,
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3, -3}, {3, 3}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'el_ki_core_item',
        },
        fixed_recipe = 'el_ki_cpu_memory_recipe',
        energy_source = {
            type = 'electric',
            usage_priority = 'primary-input',
        },
        energy_usage = core_input(1),
        fluid_boxes = {
            {
                filter = 'el_ki_cpu_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {0.5, -3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_cpu_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-0.5, -3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_memory_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {0.5, 3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_memory_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-0.5, 3.5}},
                },
                production_type = "input"
            },
        },
        animation = {
            
            filename = sprite('entity_animation.png'),
            width = 960,
            height = 930,
            line_length = 3,
			lines_per_file = 3,
            animation_speed = 0.3,
            frame_count = 9,
            scale = 0.2,
        },
        working_sound = { 
            sound = { filename ='__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
    --slave
    {
        name = 'el_ki_core_slave_entity',
        type = 'beacon',
        icon = sprite('slave_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        selection_priority = 60,
        base_picture = {
            filename = sprite('slave_entity_animation.png'),
            width = 64,
            height = 64
        },
        distribution_effectivity = 0,
        energy_source = {type = "void"},
        energy_usage = '1W',
        supply_area_distance = 0,
        allowed_effects = allowed_modules, 
        module_specification =
        {
            module_slots = 2,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3
        },
    },
    --slave container
    {
        name = 'el_ki_core_slave_container_entity',
        type = 'container',
        icon = sprite('slave_container_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        selection_priority = 60,
        picture = {
            filename = sprite('slave_container_entity_animation.png'),
            width = 64,
            height = 64
        },
        inventory_size = 20,
    },
    --===============================================================
    {
        name = 'fi_ki_core_entity',
        type = 'assembling-machine',
        icon = sprite('fi.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        crafting_categories = {'fi_ki_core_category'},
        crafting_speed = 1,
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_ki_core_item',
        },
        fixed_recipe = 'fi_ki_cpu_memory_circuit_recipe',
        energy_source = {
            type = 'electric',
            usage_priority = 'primary-input',
        },
        energy_usage = core_input(2),
        fluid_boxes = {
            {
                filter = 'el_ki_cpu_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {0.5, -3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_cpu_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-0.5, -3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_memory_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {0.5, 3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_memory_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-0.5, 3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'fi_ki_circuit_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {3.5, 0.5}},
                },
                production_type = "input"
            },
            {
                filter = 'fi_ki_circuit_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {3.5, -0.5}},
                },
                production_type = "input"
            }
        },
        animation = {
            
            filename = sprite('entity_animation_2.png'),
            width = 960,
            height = 930,
            line_length = 3,
			lines_per_file = 3,
            animation_speed = 0.3,
            frame_count = 9,
            scale = 0.2,
        },
        working_sound = { 
            sound = { filename ='__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
    --slave
    {
        name = 'fi_ki_core_slave_entity',
        type = 'beacon',
        icon = sprite('slave_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        selection_priority = 60,
        base_picture = {
            filename = sprite('slave_entity_animation.png'),
            width = 64,
            height = 64
        },
        distribution_effectivity = 0,
        energy_source = {type = "void"},
        energy_usage = '1W',
        supply_area_distance = 0,
        allowed_effects = allowed_modules, 
        module_specification =
        {
            module_slots = 2,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3
        },
    },
    --slave container
    {
        name = 'fi_ki_core_slave_container_entity',
        type = 'container',
        icon = sprite('slave_container_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        selection_priority = 60,
        picture = {
            filename = sprite('slave_container_entity_animation.png'),
            width = 64,
            height = 64
        },
        inventory_size = 1,
    },
    --===============================================================
    {
        name = 'fu_ki_core_entity',
        type = 'assembling-machine',
        icon = sprite('fu.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        crafting_categories = {'fu_ki_core_category'},
        crafting_speed = 1,
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_ki_core_item',
        },
        fixed_recipe = 'fu_ki_cpu_memory_circuit_recipe',
        energy_source = {
            type = 'electric',
            usage_priority = 'primary-input',
        },
        energy_usage = core_input(3),
        fluid_boxes = {
            {
                filter = 'el_ki_cpu_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {0.5, -3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_cpu_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-0.5, -3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_memory_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {0.5, 3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'el_ki_memory_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-0.5, 3.5}},
                },
                production_type = "input"
            },
            {
                filter = 'fi_ki_circuit_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {3.5, 0.5}},
                },
                production_type = "input"
            },
            {
                filter = 'fi_ki_circuit_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {3.5, -0.5}},
                },
                production_type = "input"
            },
            {
                filter = 'fu_ki_circuit_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-3.5, 0.5}},
                },
                production_type = "input"
            },
            {
                filter = 'fu_ki_circuit_fluid',
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_long_north_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-3.5, -0.5}},
                },
                production_type = "input"
            }
        },
        animation = {
            
            filename = sprite('entity_animation_3.png'),
            width = 960,
            height = 930,
            line_length = 3,
			lines_per_file = 3,
            animation_speed = 0.3,
            frame_count = 9,
            scale = 0.2,
        },
        working_sound = { 
            sound = { filename ='__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
    --slave
    {
        name = 'fu_ki_core_slave_entity',
        type = 'beacon',
        icon = sprite('slave_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        selection_priority = 60,
        base_picture = {
            filename = sprite('slave_entity_animation.png'),
            width = 64,
            height = 64
        },
        distribution_effectivity = 0,
        energy_source = {type = "void"},
        energy_usage = '1W',
        supply_area_distance = 0,
        allowed_effects = allowed_modules, 
        module_specification =
        {
            module_slots = 2,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3
        },
    },
    --slave container
    {
        name = 'fu_ki_core_slave_container_entity',
        type = 'container',
        icon = sprite('slave_container_entity_icon.png'),
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        selection_priority = 60,
        picture = {
            filename = sprite('slave_container_entity_animation.png'),
            width = 64,
            height = 64
        },
        inventory_size = 1,
    }
})