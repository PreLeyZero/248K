--local functions
local function config(name)
    return settings.startup['el_lead_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_lead/fu_lead_'..name
end
--ore
data:extend({
    {
        name = 'fu_lead_ore_item',
        type = 'item',
        icon = sprite('ore_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'a-a',
    },

})
--item
data:extend({
    {
        name = 'fu_lead_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a',
        order = 'b-a',
    },
    {
        name = 'fu_crushed_lead_item',
        type = 'item',
        icon = sprite('crushed_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fu_item_subgroup_a-b',
        order = 'c-a',
    },

})