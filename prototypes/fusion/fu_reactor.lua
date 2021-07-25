--local functions
local function config(name)
    return settings.startup['fu_stelar_reactor_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_reactor/fu_reactor_'..name
end

--item
data:extend({
    {
        name = 'fu_stelar_reactor_item',
        type = 'item',
        icon = sprite('stelar_item.png'),
        icon_size = 64,
        place_result = 'fu_stelar_reactor_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_d',
        order = 'a-c',
    },
    {
      name = 'fu_tokamak_reactor_item',
      type = 'item',
      icon = sprite('tokamak_item.png'),
      icon_size = 64,
      place_result = 'fu_tokamak_reactor_entity',
      stack_size = 20,
      subgroup = 'fu_item_subgroup_d',
      order = 'a-b',
  },
})

--entity
data:extend({
    --prototype
    {
        name = 'fu_stelar_reactor_entity',
        type = 'assembling-machine',
        icon = sprite('stelar_entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-rotatable"},
        max_health = 1500,
        corpse = 'big-remnants',
        collision_box = {{-5.8,-3.8},{5.8,5.8}},
        selection_box = {{-6,-4},{6,6}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_stelar_reactor_item',
        },
        crafting_categories = {'fu_stelar_reactor_crafting_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            buffer_capacity = '400MJ',
            usage_priority = 'secondary-input',
            input_flow_limit = '600MW',
        },
        energy_usage = '400MW',
        --fluid
        fluid_boxes = {
            {
              base_area = 1,
              height = 2,
              base_level = -1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "input", position = {-1.5, -4.5}},
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
                {type = "input", position = {1.5, -4.5}}
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
                  {type = "input", position = {0.5, -4.5}}
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
                  {type = "output", position = {-0.5, -4.5}}
                },
                production_type = "output"
              },
        },
        --animation
        animation = {
            north = {
                filename = sprite('stelar_entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.4,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 9,
                animation_speed = 0.5,
                shift = {0,0.4},
            },
            east = {
                filename = sprite('stelar_entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.4,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 9,
                animation_speed = 0.5,
                shift = {0,0.4},
            },
            south = {
                filename = sprite('stelar_entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.4,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 9,
                animation_speed = 0.5,
                shift = {0,0.4},
            },
            west = {
                filename = sprite('stelar_entity_animation.png'),
                size = {512*2,512*2},
                scale = 0.4,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 9,
                animation_speed = 0.5,
                shift = {0,0.4},
            },
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
    {
      name = 'fu_tokamak_reactor_entity',
      type = 'assembling-machine',
      icon = sprite('tokamak_entity_icon.png'),
      icon_size = 64,
      flags = {"player-creation","placeable-neutral","not-rotatable"},
      max_health = 1500,
      corpse = 'big-remnants',
      collision_box = {{-5.8,-3.8},{5.8,5.8}},
      selection_box = {{-6,-4},{6,6}},
      map_color = {r=0, g=0, b=1, a=1},
      minable = {
          mining_time = 1,
          result = 'fu_tokamak_reactor_item',
      },
      crafting_categories = {'fu_tokamak_reactor_crafting_category'},
      crafting_speed = 1,
      energy_source = {
        type = 'electric',
        buffer_capacity = '400MJ',
        usage_priority = 'secondary-input',
        input_flow_limit = '600MW',
      },
      energy_usage = '400MW',
      --fluid
      fluid_boxes = {
          {
            base_area = 1,
            height = 2,
            base_level = -1,
            pipe_covers = pipecoverspictures(),
            pipe_connections =
            {
              {type = "input", position = {-1.5, -4.5}},
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
              {type = "input", position = {1.5, -4.5}}
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
                {type = "input", position = {0.5, -4.5}}
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
                {type = "output", position = {-0.5, -4.5}}
              },
              production_type = "output"
            },
      },
      --animation
      animation = {
          north = {
              filename = sprite('tokamak_entity_animation_vertikal.png'),
              size = {512*3,512*2},
              scale = 0.37,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.5,
              shift = {2.34,0.3},
          },
          east = {
              filename = sprite('tokamak_entity_animation_horizontal.png'),
              size = {512*3,512*2},
              scale = 0.37,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.5,
              shift = {2.34,0.3},
          },
          south = {
              filename = sprite('tokamak_entity_animation_vertikal.png'),
              size = {512*3,512*2},
              scale = 0.37,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.5,
              shift = {2.34,0.3},
          },
          west = {
              filename = sprite('tokamak_entity_animation_horizontal.png'),
              size = {512*3,512*2},
              scale = 0.37,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.5,
              shift = {2.34,0.3},
          },
      },
      
      working_sound = { 
          sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
          apparent_volume = 2.5,
      },
  },
})