--local functions
local function config(name)
    return settings.startup['fu_space_probe_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_space_probe/fu_space_probe_'..name
end

--item
data:extend({
    --space probes
    {
        name = 'fu_space_probe_sputnik_item',
        type = 'item',
        icon = sprite('sputnik_item.png'),
        icon_size = 64,
        stack_size = 1,
        subgroup = 'fu_item_subgroup_d',
        rocket_launch_product = {'fu_space_probe_data_card_1_item',10},
        order = 'd-a',
    },
    {
        name = 'fu_space_probe_probe_item',
        type = 'item',
        icon = sprite('probe_item.png'),
        icon_size = 64,
        stack_size = 1,
        subgroup = 'fu_item_subgroup_d',
        rocket_launch_product = {'fu_space_probe_data_card_3_item',10},
        order = 'd-b',
    },
    {
        name = 'fu_space_probe_deep_probe_item',
        type = 'item',
        icon = sprite('deep_probe_item.png'),
        icon_size = 64,
        stack_size = 1,
        subgroup = 'fu_item_subgroup_d',
        rocket_launch_product = {'fu_space_probe_ore_item',100},
        order = 'd-c',
    },
    --data cards
    {
        name = 'fu_space_probe_data_card_1_item',
        type = 'item',
        icon = sprite('data_card_1_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'd-a',
    },
    {
        name = 'fu_space_probe_data_card_2_item',
        type = 'item',
        icon = sprite('data_card_2_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'd-b',
    },
    {
        name = 'fu_space_probe_data_card_3_item',
        type = 'item',
        icon = sprite('data_card_3_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'd-c',
    },
    -- matter
    --ore
    {
        name = 'fu_space_probe_ore_item',
        type = 'item',
        icon = sprite('ore_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_d',
        order = 'd-d',
    },
    {
        name = 'fu_space_probe_down_matter_item',
        type = 'item',
        icon = sprite('down_matter_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'd-d',
    },
    {
        name = 'fu_space_probe_up_matter_item',
        type = 'item',
        icon = sprite('up_matter_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'd-e',
    },
    --science
    {
        name = 'fu_space_probe_science_item',
        type = 'tool',
        icon = sprite('science_item.png'),
        durability = 1,
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'fu_item_subgroup_b',
        order = 'd-a',
    },
    {
        name = 'fu_space_probe_science_item_1',
        type = 'item',
        icon = sprite('science_item_1.png'),
        durability = 1,
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'fu_item_subgroup_b',
        order = 'd-b',
    },

})