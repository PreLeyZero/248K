--local functions
local function config(name)
    return settings.startup['gr_crafter_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/gravitation/gr_crafter/gr_crafter_'..name
end

--item
data:extend({
    {
        name = 'gr_crafter_item',
        type = 'item',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        place_result = 'gr_crafter_entity',
        stack_size = 20,
        subgroup = 'gr_item_subgroup_c',
        order = 'a-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'gr_crafter_entity',
        type = 'assembling-machine',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'gr_crafter_item',
        },
        crafting_categories = {'advanced-crafting','crafting','smelting','fi_crafting_category'},
        crafting_speed = 10,
        energy_source = {
            type = 'void',
        },
        energy_usage = '1W',
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 4
        }, 
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 4,
                animation_speed = 0.5,
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 4,
                animation_speed = 0.5,
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 4,
                animation_speed = 0.5,
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 4,
                animation_speed = 0.5,
            },
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/assembling-machine-t3-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
})