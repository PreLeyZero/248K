--local functions
local function config(name)
    return settings.startup['fi_compound_machine_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_compound_machine/fi_compound_machine_'..name
end

--item
data:extend({
    {
        name = 'fi_compound_machine_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'fi_compound_machine_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
  --prototype
  {
      name = 'fi_compound_machine_entity',
      type = 'assembling-machine',
      icon = sprite('icon.png'),
      icon_size = 64,
      flags = {"player-creation","placeable-neutral"},
      max_health = 300,
      corpse = 'big-remnants',
      collision_box = {{-3.4,-3.4},{3.4,3.4}},
      selection_box = {{-3.5,-3.5},{3.5,3.5}},
      map_color = {r=0, g=0, b=1, a=1},
      minable = {
          mining_time = 1,
          result = 'fi_compound_machine_item',
      },
      crafting_categories = {'fi_compound_machine_category'},
      crafting_speed = 1,
      --fixed_recipe = 'el_water_pressure_recipe',
      energy_source = {
          type = 'electric',
          usage_priority = 'secondary-input',
      },
      allowed_effects = {"speed", "consumption", "productivity", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
        }, 
      energy_usage = '400kW',
      fluid_boxes = {
          {
            
            base_area = 1,
            height = 2,
            base_level = -1,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {type = "input", position = {0, -4}},
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
              {type = "input", position = {-4, 0}}
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
              {type = "input", position = {4, 0}},
              --{type = "output", position = {2, -2.5}}
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
              {type = "input", position = {0, 4}},
            },
            production_type = "input"
          },
      },
      --animation
      animation = {
          north = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.54,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.5,
              shift = {0,-0.3}
          },
          east = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.54,
              line_length = 3,
              --lines_per_file = 3,
              frame_count = 3,
              animation_speed = 0.5,
              shift = {0,-0.3}
          },
          south = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.54,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.5,
              shift = {0,-0.3}
          },
          west = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.54,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.5,
              shift = {0,-0.3}
          },
      },
      working_sound =
      {
        sound = {filename = "__base__/sound/chemical-plant-3.ogg" },
        apparent_volume = 0.3,
      },
  },
})

--{
--    production_type = "input",
    --pipe_picture = assembler2pipepictures(),
    --pipe_covers = pipecoverspictures(),
--    base_area = 10,
--    base_level = -1,
--    pipe_connections = {
--        { type="input", position = {-2, -2,5} },
--        { type="input", position = {2, -2.5} },
--    },
--  },
--  {
--    production_type = "output",
    --pipe_picture = assembler2pipepictures(),
    --pipe_covers = pipecoverspictures(),
--    base_area = 10,
--    base_level = 1,
--    pipe_connections = {{ type="output", position = {2, 2.5} }},
--  },
--  off_when_no_fluid_recipe = true