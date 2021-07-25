--local functions
local function config(name)
    return settings.startup['fi_energy_crystal_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_energy_crystal/fi_energy_crystal_'..name
end

--item
data:extend({
    {
        name = 'fi_energy_crystal_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 500,
        subgroup = 'fi_item_subgroup_b',
        order = 'a-c',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        fuel_category = 'chemical',
        fuel_acceleration_multiplier = 1,
        fuel_emissions_multiplier = 1,
        fuel_top_speed_multiplier = 1,
        fuel_value = '300MJ',
    },
    {
        name = 'fi_crushed_crystal_item',
        type = 'item',
        icon = sprite('crushed_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-e',
    },
    {
        name = 'fi_catalyst_crystal_item',
        type = 'item',
        icon = sprite('catalyst_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_f',
        order = 'a-b',
    },
    {
        name = 'fi_base_crystal_item',
        type = 'item',
        icon = sprite('base_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_f',
        order = 'a-c',
    },
})