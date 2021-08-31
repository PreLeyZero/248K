--local functions
local function config(name)
    return settings.startup['fi_crushed_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_crushed/fi_crushed_'..name
end

--item
data:extend({
    {
        name = 'fi_crushed_lithium_item',
        type = 'item',
        icon = sprite('lithium_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-d',
    },
    {
        name = 'fi_crushed_iron_item',
        type = 'item',
        icon = sprite('iron_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-a',
    },
    {
        name = 'fi_crushed_copper_item',
        type = 'item',
        icon = sprite('copper_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-b',
    },
    {
        name = 'fi_crushed_aluminum_item',
        type = 'item',
        icon = sprite('aluminum_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-c',
    },
    {
        name = 'fi_crushed_coal_item',
        type = 'item',
        icon = sprite('coal_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-f',
    },
    {
        name = 'fi_crushed_glass_item',
        type = 'item',
        icon = sprite('glass_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-f',
    },
    {
        name = 'fi_crushed_stone_item',
        type = 'item',
        icon = sprite('stone_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-f',
    },
    {
        name = 'fi_crushed_uranium_item',
        type = 'item',
        icon = sprite('uranium_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-b',
        order = 'a-f',
    },
})