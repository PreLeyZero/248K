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
        icon = sprite('stelar_entity_icon.png'),
        icon_size = 64,
        place_result = 'fu_stelar_reactor_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_d',
        order = 'a-c',
    },
    {
      name = 'fu_tokamak_reactor_item',
      type = 'item',
      icon = sprite('tokamak_entity_icon.png'),
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
        flags = {"player-creation","placeable-neutral"},
        max_health = 1500,
        corpse = 'big-remnants',
        collision_box = {{-6.25,-6.25},{6.25,6.25}},
        selection_box = {{-6.5,-6.5},{6.5,6.5}},
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
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {type = "input", position = {-1, -7}},
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
              {type = "input", position = {1, -7}}
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
              {type = "input", position = {3, -7}}
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
              {type = "output", position = {-3, -7}}
            },
            production_type = "output"
          },
        },
        --animation
        animation = {
          filename = sprite('stelar_entity_base.png'),
          size = {512*2,512*2},
          scale = 0.56,
          line_length = 1,
          --lines_per_file = 2,
          frame_count = 1,
          --animation_speed = 0.2,
          shift = {2.4,-1.7} 
        },
        working_visualisations = {
          {
            animation = 
            {
              filename = sprite('stelar_entity_overlay.png'),
              size = {512*2,512*2},
              scale = 0.56,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.3,
              shift = {2.4,-1.7} 
            },
            light = {
              type = "basic",
              intensity = 1,
              size = 26,
              color = {r=0.79 ,g=0.08 ,b=0.87 },
            }
          }
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
      flags = {"player-creation","placeable-neutral"},
      max_health = 1500,
      corpse = 'big-remnants',
      collision_box = {{-6.2,-6.2},{6.2,6.2}},
      selection_box = {{-6.5,-6.5},{6.5,6.5}},
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
          pipe_picture = grey_south_pipe_picture,
          pipe_connections =
          {
            {type = "input", position = {-1, -7}},
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
            {type = "input", position = {1, -7}}
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
            {type = "input", position = {3, -7}}
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
            {type = "output", position = {-3, -7}}
          },
          production_type = "output"
        },
      },
      animation = {
        filename = sprite('tokamak_entity_animation.png'),
        size = {512*2,512*2},
        scale = 0.56,
        line_length = 3,
        lines_per_file = 3,
        frame_count = 9,
        animation_speed = 0.3,
        shift = {2.4,-1.7} 
      },

      working_visualisations = {
        {
          light = {
            type = "basic",
            intensity = 1,
            size = 26,
            color = {r=0.79 ,g=0.08 ,b=0.87 },
          }
        }
      },
      
      working_sound = { 
          sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
          apparent_volume = 2.5,
      },
  },
})