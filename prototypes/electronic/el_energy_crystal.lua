--local functions
local function config(name)
    return settings.startup['el_energy_crystal_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_energy_crystal/el_energy_crystal_'..name
end

throw_projectile =
{
  {
    filename = "__base__/sound/fight/throw-projectile-1.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/throw-projectile-2.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/throw-projectile-3.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/throw-projectile-4.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/throw-projectile-5.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/throw-projectile-6.ogg",
    volume = 0.4
  }

}

--item
data:extend({
    {
        name = 'el_energy_crystal_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_a',
        order = 'a-c',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        fuel_category = 'chemical',
        fuel_acceleration_multiplier = 1,
        fuel_emissions_multiplier = 1,
        fuel_top_speed_multiplier = 1,
        fuel_value = '15MJ',
    },
    {
        name = 'el_energy_crystal_charged_item',
        type = 'item',
        icon = sprite('charged_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_a',
        order = 'a-c',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        fuel_category = 'charged_fuel',
        fuel_acceleration_multiplier = 1,
        fuel_emissions_multiplier = 1,
        fuel_top_speed_multiplier = 1,
        fuel_value = '20MJ',
        burnt_result = 'el_energy_crystal_item',
    }
})