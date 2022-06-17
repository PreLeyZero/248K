--local functions
local function config(name)
    return settings.startup['fu_ingot_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_ingot/fu_ingot_'..name
end

--item
data:extend({
    {
        name = 'fu_ingot_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'fu_ingot_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
  --prototype
  {
      name = 'fu_ingot_entity',
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
          result = 'fu_ingot_item',
      },
      crafting_categories = {'fu_ingot_category', 'smelting'},
      crafting_speed = 6,
      ingredient_count = 2,
      --fixed_recipe = 'el_water_pressure_recipe',
      energy_source = {
          type = 'electric',
          usage_priority = 'secondary-input',
      },
      energy_usage = '2MW',
      allowed_effects = {"speed", "consumption", "pollution", "productivity"},
      module_specification = {
        module_info_icon_shift = {
          0,
          0.8
        },
        module_slots = 2
      }, 
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
        filename = sprite('entity_base.png'),
        size = {512,512},
        scale = 0.54,
        line_length = 1,
        --lines_per_file = 2,
        frame_count = 1,
        --animation_speed = 0.2,
        shift = {0,-0.3} 
      },
      working_visualisations = {
        {
          animation = 
          {
            filename = sprite('entity_animation.png'),
            size = {512,512},
            scale = 0.54,
            line_length = 2,
            lines_per_file = 2,
            frame_count = 4,
            animation_speed = 0.2,
            shift = {0,-0.3} 
          },
          light = {
            type = "basic",
            intensity = 1,
            size = 15,
            color = {r=0.79 ,g=0.08 ,b=0.87 },
          }
        }
      },
      working_sound =
      {
        sound = {filename = "__base__/sound/electric-furnace.ogg" },
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