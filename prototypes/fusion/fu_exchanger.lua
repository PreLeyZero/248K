--local functions
local function config(name)
    return settings.startup['fu_exchanger_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_exchanger/fu_exchanger_'..name
end

--item
data:extend({
    {
        name = 'fu_exchanger_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fu_exchanger_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-c',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fu_exchanger_entity',
        type = 'assembling-machine',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.9,-1.9},{1.9,1.9}},
        selection_box = {{-2,-2},{2,2}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_exchanger_item',
        },
        crafting_categories = {'fu_exchanger_crafting_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'void',
        },
        energy_usage = '20MW',
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
        }, 
        --fluids
        fluid_boxes = {
            { 
              base_area = 1,
              height = 2,
              base_level = -1,
              pipe_covers = pipecoverspictures(),
              pipe_picture = grey_south_pipe_picture,
              pipe_connections =
              {
                {type = "input", position = {-2.5, -0.5}}
              },
              production_type = "input"
            },
            { 
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = grey_south_pipe_picture,
                pipe_connections =
                {
                  {type = "input", position = {-2.5, 1.5}}
                },
                production_type = "input"
              },
            { 
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_picture = grey_south_pipe_picture,
              pipe_connections =
              {
                {type = "output", position = {2.5, -0.5}},
              },
              production_type = "output"
            },
            {
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_picture = grey_south_pipe_picture,
              pipe_connections =
              {
                {type = "output", position = {2.5, 1.5}},
              },
              production_type = "output"
            },
        },
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {480,500},
                scale = 0.27,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {480,500},
                scale = 0.27,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {480,500},
                scale = 0.27,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {480,500},
                scale = 0.27,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/heat-exchanger.ogg'},
            apparent_volume = 2.5,
        },
    },
})