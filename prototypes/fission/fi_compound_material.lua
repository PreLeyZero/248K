--local functions
local function config(name)
    return settings.startup['fi_compound_material_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_compound_material/fi_compound_material_'..name
end

--item
data:extend({
    {
        name = 'fi_compound_material_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_b',
        order = 'a-a',
    },

})
