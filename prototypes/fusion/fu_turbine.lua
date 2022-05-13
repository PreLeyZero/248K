--local functions
local function config(name)
    return settings.startup['fu_turbine_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_turbine/fu_turbine_'..name
end

--item
data:extend({
    {
        name = 'fu_turbine_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'fu_turbine_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
  --prototype
  {
      name = 'fu_turbine_entity',
      type = 'generator',
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
          result = 'fu_turbine_item',
      },
      effectivity = 1,
      energy_source = {
          type = 'electric',
          usage_priority = 'primary-output',
      },
      fluid_usage_per_tick = 10/6,
      maximum_temperature = 1500,
      max_power_output = "200MW",
      fluid_box = {
        filter = "fu_hot_steam",
        base_area = 1,
        height = 2,
        base_level = -1,
        pipe_covers = pipecoverspictures(),
        pipe_picture = grey_south_pipe_picture,
        pipe_connections =
        {
          {type = "input-output", position = {-4, 0}},
          {type = "input-output", position = {4, 0}},
          {type = "input-output", position = {0, 4}},
          {type = "input-output", position = {0, -4}}
        },
        production_type = "input-output"
      },
      --animation
      horizontal_animation = {
        filename = sprite('entity_animation.png'),
        size = {512,512},
        scale = 0.7,
        line_length = 5,
        lines_per_file = 5,
        frame_count = 25,
        animation_speed = 0.5,
        shift = {1.85,-0.6} 
      },
      vertical_animation = {
        filename = sprite('entity_animation.png'),
        size = {512,512},
        scale = 0.7,
        line_length = 5,
        lines_per_file = 5,
        frame_count = 25,
        animation_speed = 0.5,
        shift = {1.85,-0.6} 
      },
      smoke = {
        {
            name = "smoke",
            tape = "trival-smoke",
            frequency = 1,
            position = {0,-3},
            --deviation = {x = -2, y = -2},
            duration = 1,
        },
      },
      working_sound =
      {
        sound = {filename = "__base__/sound/chemical-plant-3.ogg" },
        apparent_volume = 0.3,
      },
  },
})