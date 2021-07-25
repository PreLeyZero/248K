--local functions
local function config(name)
    return settings.startup['fi_equipment_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_equipment/fi_equipment_'..name
end

--item
data:extend({
    {
        name = 'fi_train_equipment_generator_item',
        type = 'item',
        icon = sprite('generator_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_e',
        placed_as_equipment_result = 'fi_train_equipment_generator_item',
        order = 'a-a',
    },
    {
        name = 'fi_equipment_player_reactor_item',
        type = 'item',
        icon = sprite('player_reactor_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_e',
        placed_as_equipment_result = 'fi_equipment_player_reactor_item',
        order = 'a-b',
    },
    {
        name = 'fi_equipment_player_shield_item',
        type = 'item',
        icon = sprite('player_shield_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_e',
        placed_as_equipment_result = 'fi_equipment_player_shield_item',
        order = 'a-c',
    },

})

--equipment
data:extend({
    {
        name = 'fi_train_equipment_generator_item',
        type = 'generator-equipment',
        power = '2400kW',
        categories = {'fi_train_equipment'},
        sprite = {
            filename = sprite('generator_entity.png'),
            width = 256,
            height = 256,
            priority = 'medium',
        },
        shape = {
            width = 3,
            height = 3,
            type = "full",
        },
        energy_source = {
            type = 'electric',
			usage_priority = 'primary-output',
        },

    },
    {
        name = 'fi_equipment_player_reactor_item',
        type = 'generator-equipment',
        power = '600kW',
        categories = {'armor'},
        sprite = {
            filename = sprite('player_reactor_entity.png'),
            width = 256,
            height = 256,
            priority = 'medium',
        },
        shape = {
            width = 3,
            height = 3,
            type = "full",
        },
        energy_source = {
            type = 'electric',
			usage_priority = 'primary-output',
        },

    },
    {
        name = 'fi_equipment_player_shield_item',
        type = 'energy-shield-equipment',
        energy_per_shield = '20kJ',
        max_shield_value = 400,
        categories = {'armor'},
        sprite = {
            filename = sprite('player_shield_entity.png'),
            width = 256,
            height = 256,
            priority = 'medium',
        },
        shape = {
            width = 3,
            height = 3,
            type = "full",
        },
        energy_source = {
            type = 'electric',
			usage_priority = 'primary-input',
            input_flow_limit = "600kW",
            buffer_capacity = "300kJ",
        },

    },

})