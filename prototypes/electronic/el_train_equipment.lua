--local functions
local function config(name)
    return settings.startup['el_train_equipment_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_train_equipment/el_train_equipment_'..name
end

--item
data:extend({
    {
        name = 'el_train_equipment_generator_item',
        type = 'item',
        icon = sprite('generator_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'el_item_subgroup_d',
        placed_as_equipment_result = 'el_train_equipment_generator_item',
        order = 'c-a',
    },
    {
        name = 'el_train_equipment_accelerator_item',
        type = 'item',
        icon = sprite('accelerator_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'el_item_subgroup_d',
        placed_as_equipment_result = 'el_train_equipment_accelerator_item',
        order = 'c-b',
    },

})

--equipment
data:extend({
    {
        name = 'el_train_equipment_generator_item',
        type = 'generator-equipment',
        power = '600kW',
        categories = {'el_train_equipment'},
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
        name = 'el_train_equipment_accelerator_item',
        type = 'movement-bonus-equipment',
        categories = {'el_train_equipment'},
        energy_consumption = "600kW",
		movement_bonus = 0.35,
        sprite = {
            filename = sprite('accelerator_entity.png'),
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
            buffer_capacity = '8MJ',
            drain = '40kW',
        },

    },

})