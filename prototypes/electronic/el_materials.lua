--local functions
local function config(name)
    return settings.startup['el_materials_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_materials/el_materials_'..name
end

--item
data:extend({
    {
        name = 'el_materials_pure_iron',
        type = 'item',
        icon = sprite('pure_iron.png'),
        icon_size = 64,
        stack_size = 50,
        subgroup = 'el_item_subgroup_a',
        order = 'a-a',
    },
    {
        name = 'el_materials_pure_copper',
        type = 'item',
        icon = sprite('pure_copper.png'),
        icon_size = 64,
        stack_size = 50,
        subgroup = 'el_item_subgroup_a',
        order = 'a-b',
    },
    {
        name = 'el_materials_pure_aluminum',
        type = 'item',
        icon = sprite('pure_aluminum.png'),
        icon_size = 64,
        stack_size = 50,
        subgroup = 'el_item_subgroup_a',
        order = 'a-c',
    },
    {
        name = 'el_materials_ceramic',
        type = 'item',
        icon = sprite('ceramic.png'),
        icon_size = 64,
        stack_size = 50,
        subgroup = 'el_item_subgroup_a',
        order = 'a-c',
    },
    {
        name = 'el_materials_ALK',
        type = 'item',
        icon = sprite('ALK.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_a',
        order = 'a-c',
    },
})