--local functions
local function config(name)
    return settings.startup['gr_white_hole_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/gravitation/gr_white_hole/gr_white_hole_'..name
end

--item
data:extend({
    {
        name = 'gr_white_hole_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'gr_white_hole_entity',
        stack_size = 1,
        subgroup = 'gr_item_subgroup_c',
        order = 'e-a',
    },
    {
        name = "gr_white_hole_entity",
        type = "furnace",
        icon = sprite('item.png'),
        icon_size = 64,
        collision_box = {{-5.8,-5.8},{5.8,5.8}},
        selection_box = {{-6,-6},{6,6}},
        max_health = 1500,
        corpse = 'big-remnants',
        map_color = {r=1, g=0, b=0, a=0.5},
        minable = {
            mining_time = 1,
            result = 'gr_white_hole_item',
        },
        result_inventory_size = 1,
        source_inventory_size = 1,
        crafting_categories = {"gr_white_hole_category"},
        crafting_speed = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        energy_usage = "1TW",
        animation =  {
            filename = sprite('animation.png'),
            size = {512*2,512*2},
            scale = 0.4,
            line_length = 4,
            frame_count = 4,
            animation_speed = 0.1
        },
    }
})


