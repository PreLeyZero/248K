--local functions
local function config(name)
    return settings.startup['fi_materials_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_materials/fi_materials_'..name
end

--item
data:extend({
    {
        name = 'fi_industrial_steel_item',
        type = 'item',
        icon = sprite('industrial_steel_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_b',
        order = 'a-b',
    },
    {
        name = 'fi_industrial_steel_blend_item',
        type = 'item',
        icon = sprite('industrial_steel_blend_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_a-c',
        order = 'a-a',
    },
    

})
