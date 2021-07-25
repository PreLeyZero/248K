--local functions
local function config(name)
    return settings.startup['el_aluminum_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_aluminum/el_aluminum_'..name
end
--ore
data:extend({
    {
        name = 'el_aluminum_ore_item',
        type = 'item',
        icon = sprite('ore_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_a',
        order = 'a-a',
    },

})
--item
data:extend({
    {
        name = 'el_aluminum_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'el_item_subgroup_a',
        order = 'b-a',
    },

})