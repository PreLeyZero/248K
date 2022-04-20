--local functions
local function config(name)
    return settings.startup['fu_miner_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_miner/fu_miner_'..name
end

--item
data:extend({
    {
        name = 'fu_miner_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'fu_miner_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-b',
    },
    {
        name = 'fu_miner_fuel_item',
        type = 'item',
        icon = sprite('drill.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_b',
        order = 'a-b',
        fuel_category = 'fu_miner_fuel_category',
        fuel_value = '80MJ',
    },

})

--entity
data:extend({
  --prototype
  {
      name = 'fu_miner_entity',
      type = 'assembling-machine',
      icon = sprite('icon.png'),
      icon_size = 64,
      flags = {"player-creation","placeable-neutral"},
      max_health = 300,
      fixed_recipe = '',
      corpse = 'big-remnants',
      collision_box = {{-5.4,-5.4},{5.4,5.4}},
      selection_box = {{-5.5,-5.5},{5.5,5.5}},
      map_color = {r=0, g=0, b=1, a=1},
      minable = {
          mining_time = 1,
          result = 'fu_miner_item',
      },
      crafting_categories = {'fu_miner_category'},
      crafting_speed = 1,
      ingredient_count = 2,
      fixed_recipe = 'fu_mining_recipe',
      energy_source = {
        type = "burner",
        fuel_inventory_size = 1,
        effectivity = 1,
        emissions_per_minute = 20,
        fuel_category = "fu_miner_fuel_category",
        smoke = {
            {
                name = "smoke",
                tape = "trival-smoke",
                frequency = 60,
                position = {0,-3},
                --deviation = {x = -2, y = -2},
                duration = 1,
            },
        },
      },
      energy_usage = '1MW',
      --animation
      animation = {
        filename = sprite('base.png'),
        size = {512*2,512*2},
        scale = 0.4,
        line_length = 1,
        --lines_per_file = 2,
        frame_count = 1,
        --animation_speed = 0.2,
        shift = {0,-0.9} 
      },
      working_visualisations = {
        {
          animation = 
          {
            filename = sprite('animation.png'),
            size = {512*2,512*2},
            scale = 0.4,
            line_length = 3,
            lines_per_file = 3,
            frame_count = 9,
            animation_speed = 0.2,
            shift = {0,-0.9} 
          }
        }
      },
      working_sound =
      {
        sound = {filename = "__base__/sound/burner-mining-drill.ogg" },
        apparent_volume = 0.3,
      },
  },
})