--local functions
local function config(name)
    return settings.startup['el_pressurizer_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_pressurizer/el_pressurizer_'..name
end

--item
data:extend({
    {
        name = 'el_pressurizer_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'el_pressurizer_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
  --prototype
  {
      name = 'el_pressurizer_entity',
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
          result = 'el_pressurizer_item',
      },
      crafting_categories = {'el_special_fluid'},
      crafting_speed = 1,
      ingredient_count = 2,
      fixed_recipe = 'el_water_pressure_recipe',
      energy_source = {
          type = 'electric',
          usage_priority = 'secondary-input',
          input_flow_limit = '60kW',
          emissions_per_minute = 25,
      },
      energy_usage = '40kW',
      fluid_boxes = {
          {
            filter = 'water',
            base_area = 1,
            height = 2,
            base_level = -1,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {type = "input", position = {0, -2}},
            },
            production_type = "input"
          },
          { 
            filter = 'steam',
            base_area = 1,
            height = 2,
            base_level = -1,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {type = "input", position = {-2, 0}}
            },
            production_type = "input"
          },
          { 
            filter = 'el_pressurized_water',
            base_area = 1,
            height = 2,
            base_level = 1,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {type = "output", position = {2, 0}},
              --{type = "output", position = {2, -2.5}}
            },
            production_type = "output"
          },
          {
            filter = 'water',
            base_area = 1,
            height = 2,
            base_level = 1,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {type = "output", position = {0, 2}},
            },
            production_type = "output"
          },
      },
      --animation
      animation = {
          north = {
              filename = sprite('entity_animation.png'),
              size = {480,448},
              scale = 0.22,
              line_length = 4,
              frame_count = 4,
              animation_speed = 0.5,
          },
          east = {
              filename = sprite('entity_animation.png'),
              size = {480,448},
              scale = 0.22,
              line_length = 4,
              frame_count = 4,
              animation_speed = 0.5,
          },
          south = {
              filename = sprite('entity_animation.png'),
              size = {480,448},
              scale = 0.22,
              line_length = 4,
              frame_count = 4,
              animation_speed = 0.5,
          },
          west = {
              filename = sprite('entity_animation.png'),
              size = {480,448},
              scale = 0.22,
              line_length = 4,
              frame_count = 4,
              animation_speed = 0.5,
          },
      },
      working_sound =
      {
        sound = {filename = "__base__/sound/chemical-plant-3.ogg" },
        apparent_volume = 0.1,
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