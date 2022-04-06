--local functions
local function config(name)
    return settings.startup['fu_fusor_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_fusor/fu_fusor_'..name
end

--item
data:extend({
    {
        name = 'fu_fusor_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fu_fusor_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-a',
    },
    {
        name = 'fu_tech_sign_item',
        type = 'item',
        icon = sprite('tech_sign_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'fu_item_subgroup_b',
        order = 'a-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fu_fusor_entity',
        type = 'assembling-machine',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-rotatable"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.8,-2.3},{2.8,2.3}},
        selection_box = {{-3,-2.5},{3,2.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_fusor_item',
        },
        crafting_categories = {'fu_fusor_crafting_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            buffer_capacity = '400MJ',
            usage_priority = 'secondary-input'
        },
        energy_usage = '400MW',
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
        }, 
        --fluid
        fluid_boxes = {
            {
              base_area = 1,
              height = 2,
              base_level = -1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "input", position = {-1.5, -3}},
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
                {type = "input", position = {1.5, -3}}
              },
              production_type = "input"
            },
        },
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
                shift = {0,-1},
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
                shift = {0,-1},
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
                shift = {0,-1},
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
                shift = {0,-1},
            },
        },

        working_visualisations = {
            {
              light = {
                type = "basic",
                intensity = 1,
                size = 12,
                color = {r=0.08 ,g=0.51 ,b=0.87 },
              }
            }
          },
        
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
})