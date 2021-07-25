--local functions
local function config(name)
    return settings.startup['el_ammo_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_ammo/el_ammo_'..name
end

--item
data:extend({
    {
        name = 'el_ammo_item',
        type = 'ammo',
        icon = sprite('item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'el_item_subgroup_b',
        order = 'c-a',
    },
})