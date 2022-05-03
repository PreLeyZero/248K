--local functions
local function config(name)
    return settings.startup['el_train_fuel_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_train_fuel/el_train_fuel_'..name
end

--item
data:extend({
    {
        name = 'el_train_fuel_diesel_item',
        type = 'item',
        icon = sprite('diesel_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_d',
        order = 'b-a',
        fuel_acceleration_multiplier = 1,
        fuel_category = 'el_train_fuel',
        fuel_emissions_multiplier = 1,
        fuel_top_speed_multiplier = 1,
        fuel_value = '70MJ',
    },
    {
        name = 'el_train_fuel_diesel_energized_item',
        type = 'item',
        icon = sprite('diesel_energized_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_d',
        order = 'b-b',
        fuel_acceleration_multiplier = 0.55,
        fuel_top_speed_multiplier = 1.3,
        fuel_category = 'el_train_fuel',
        fuel_emissions_multiplier = 1,
        fuel_value = '100MJ',
    },

})