--local functions
local function config(name)
    return settings.startup['fi_fuel_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_fuel/fi_fuel_'..name
end

--item
data:extend({
    {
        --u 235 + u 238
        name = 'fi_basic_fuel_item',
        type = 'item',
        icon = sprite('basic_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        fuel_category = 'fi_basic_fuel',
        fuel_value = '10GJ',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        order = 'a-a',
        burnt_result = 'fi_used_basic_fuel_item',
    },
    {
        --u 238 + th 232
        name = 'fi_basic_thorium_fuel_item',
        type = 'item',
        icon = sprite('basic_thorium_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        fuel_category = 'fi_basic_fuel',
        fuel_value = '6GJ',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        order = 'a-b',
        burnt_result = 'fi_used_basic_thorium_fuel_item',
    },
    {
        --u 238 + pu 239
        name = 'fi_advanced_fuel_item',
        type = 'item',
        icon = sprite('advanced_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        fuel_category = 'fi_advanced_fuel',
        fuel_value = '14GJ',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        order = 'b-a',
        burnt_result = 'fi_used_advanced_fuel_item',
    },
    {
        --u 233 + u 238
        name = 'fi_advanced_thorium_fuel_item',
        type = 'item',
        icon = sprite('advanced_thorium_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        fuel_category = 'fi_advanced_fuel',
        fuel_value = '10GJ',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        order = 'b-b',
        burnt_result = 'fi_used_advanced_thorium_fuel_item',
    },
    {   
        --u 235 + pu 239
        name = 'fi_pure_fuel_item',
        type = 'item',
        icon = sprite('pure_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        fuel_category = 'fi_pure_fuel',
        fuel_value = '28GJ',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        order = 'c-a',
        burnt_result = 'fi_used_pure_fuel_item',
    },
    {   
        --used_basic
        name = 'fi_used_basic_fuel_item',
        type = 'item',
        icon = sprite('used_basic_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        order = 'c-a',
    },
    {   
        --used_basic_thorium
        name = 'fi_used_basic_thorium_fuel_item',
        type = 'item',
        icon = sprite('used_basic_thorium_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        order = 'c-a',
    },
    {   
        --used_advanced
        name = 'fi_used_advanced_fuel_item',
        type = 'item',
        icon = sprite('used_advanced_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        order = 'c-a',
    },
    {   
        --used_advanced_thorium
        name = 'fi_used_advanced_thorium_fuel_item',
        type = 'item',
        icon = sprite('used_advanced_thorium_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        order = 'c-a',
    },
    {   
        --used_pure
        name = 'fi_used_pure_fuel_item',
        type = 'item',
        icon = sprite('used_pure_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        order = 'c-a',
    },
    {   
        --u33
        name = 'fi_uranium233_item',
        type = 'item',
        icon = sprite('uranium233_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_a',
        order = 'a-b',
    },
    {   
        --pu239
        name = 'fi_plutonium239_item',
        type = 'item',
        icon = sprite('plutonium239_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_a',
        order = 'a-c',
    },
    {   
        --th232
        name = 'fi_thorium232_item',
        type = 'item',
        icon = sprite('thorium232_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_a',
        order = 'a-a',
    },
    --train crystal fuel
    {
        name = 'fi_fuel_train_crystal_item',
        type = 'item',
        icon = sprite('train_crystal_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_d',
        order = 'd-a',
        fuel_acceleration_multiplier = 0.6,
        fuel_top_speed_multiplier = 1.55,
        fuel_category = 'el_train_fuel',
        fuel_emissions_multiplier = 3.5,
        fuel_value = '250MJ',
    },



})