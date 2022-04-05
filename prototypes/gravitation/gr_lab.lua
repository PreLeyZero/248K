--local functions
local function config(name)
    return settings.startup['gr_lab_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/gravitation/gr_lab/gr_lab_'..name
end

--item
data:extend({
    {
        name = 'gr_lab_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'gr_lab_entity',
        stack_size = 20,
        subgroup = 'gr_item_subgroup_c',
        order = 'a-a',
    }
})

--entity
data:extend({
    --prototype
    {
        name = 'gr_lab_entity',
        type = 'lab',
        icon = sprite('item.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-rotatable"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-3.9,-3.4},{3.9,3.4}},
        selection_box = {{-4,-3.5},{4,3.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'gr_lab_item',
        },
        crafting_speed = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            drain = "20MW"
        },
        energy_usage = "500MW",
        --animation
        
        inputs = {
            "gr_materials_red_pack_item",
            "gr_materials_green_pack_item",
            "gr_materials_blue_pack_item",
            "gr_materials_purple_pack_item",
            "gr_materials_yellow_pack_item",
            "gr_materials_grey_pack_item",
            "gr_materials_white_pack_item"
        },

        off_animation = {
            filename = sprite('off_animation.png'),
            size = {512,512},
            scale = 0.6,
            line_length = 1,
            frame_count = 1,
            animation_speed = 0.1,
            shift = {0,-0.2}
        },
        on_animation = {
            filename = sprite('animation.png'),
            size = {512,512},
            scale = 0.6,
            line_length = 5,
            frame_count = 5,
            animation_speed = 0.1,
            shift = {0,-0.2}
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/assembling-machine-t3-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
})