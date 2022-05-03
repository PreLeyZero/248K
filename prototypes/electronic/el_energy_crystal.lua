--local functions
local function config(name)
    return settings.startup['el_energy_crystal_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_energy_crystal/el_energy_crystal_'..name
end

--item
data:extend({
    {
        name = 'el_energy_crystal_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 500,
        subgroup = 'el_item_subgroup_a',
        order = 'a-c',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        fuel_category = 'chemical',
        fuel_acceleration_multiplier = 1,
        fuel_emissions_multiplier = 1,
        fuel_top_speed_multiplier = 1,
        fuel_value = '20MJ',
    },
})