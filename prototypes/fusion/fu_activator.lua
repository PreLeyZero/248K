--local functions
local function config(name)
    return settings.startup['fu_activator_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_activator/fu_activator_'..name
end

--item
data:extend({
    {
        name = 'fu_activator_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fu_activator_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fu_activator_entity',
        type = 'assembling-machine',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_activator_item',
        },
        crafting_categories = {'fu_activator_crafting_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            --input_flow_limit = '4MW',
        },
        energy_usage = '2MW',
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 4
        }, 
        --fluids
        fluid_boxes = {
            { 
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {type = "input", position = {-2, 0}}
                },
                production_type = "input"
            },
            { 
              base_area = 1,
              height = 2,
              base_level = -1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "input", position = {0, 2}}
              },
              production_type = "input"
            },
            { 
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "output", position = {2, 0}},
              },
              production_type = "output"
            },
            {
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "output", position = {0, -2}},
              },
              production_type = "output"
            },
        },
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {420,448},
                scale = 0.26,
                line_length = 2,
                frame_count = 2,
                animation_speed = 0.5,
                shift = {0,-0.2}
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {420,448},
                scale = 0.26,
                line_length = 2,
                frame_count = 2,
                animation_speed = 0.5,
                shift = {0,-0.2}
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {420,448},
                scale = 0.26,
                line_length = 2,
                frame_count = 2,
                animation_speed = 0.5,
                shift = {0,-0.2}
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {420,448},
                scale = 0.26,
                line_length = 2,
                frame_count = 2,
                animation_speed = 0.5,
                shift = {0,-0.2},
            },
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
})