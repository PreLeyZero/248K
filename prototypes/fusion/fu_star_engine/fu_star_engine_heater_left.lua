--local functions
local function config(name)
    return settings.startup['fu_star_engine_heater_left_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_star_engine/fu_star_engine_heater_left/fu_star_engine_heater_left_'..name
end

--item
data:extend({
    {
        name = 'fu_star_engine_heater_left_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'fu_star_engine_heater_left_entity',
        stack_size = 1,
        subgroup = 'fu_item_subgroup_d-b',
        order = 'c-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fu_star_engine_heater_left_entity',
        type = 'assembling-machine',
        icon = sprite('icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-rotatable"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-8.5,-4.5},{10.5,4.5}},
        selection_box = {{-8.5,-4.5},{10.5,4.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_star_engine_heater_left_item',
        },
        crafting_categories = {'fu_star_engine_heater_crafting_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            input_flow_limit = '4GW',
          },
          energy_usage = '0.7GW',
        --fluids
        fluid_boxes = {
            { 
              base_area = 1,
              height = 2,
              base_level = -1,
              
              pipe_connections =
              {
                {type = "input", position = {-9, 0}}
              },
              production_type = "input"
            },
            { 
                base_area = 1,
                height = 2,
                base_level = -1,
                
                pipe_connections =
                {
                  {type = "input", position = {-9, 2}}
                },
                production_type = "input"
            },
            { 
                base_area = 1,
                height = 2,
                base_level = -1,
                
                pipe_connections =
                {
                  {type = "input", position = {-9, -2}}
                },
                production_type = "input"
            },
            { 
                base_area = 1,
                height = 2,
                base_level = 1,
                
                pipe_connections =
                {
                  {type = "output", position = {11, -1}},
                },
                production_type = "output"
            },
            { 
              base_area = 1,
              height = 2,
              base_level = 1,
              
              pipe_connections =
              {
                {type = "output", position = {11, 1}},
              },
              production_type = "output"
            },
            --{-15, -3.5}}{-15, 3.5}}
            --{11, 0}},{11, 3.5}},{11, -3.5}},
        },
        --animation
        animation = {
          filename = sprite('base.png'),
          size = {1080, 1080},
          scale = 0.58,
          shift = {0.75, 0.6},
          line_length = 1,
          lines_per_file = 1,
          frame_count = 1,
          animation_speed = 1,
        },
        working_visualisations = {
          {
            animation = 
            {
              filename = sprite('animation.png'),
              size = {1080, 1080},
              scale = 0.58,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.3,
              shift = {0.75, 0.6} 
            }
          }
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/heat-exchanger.ogg'},
            apparent_volume = 2.5,
        },
    },
})