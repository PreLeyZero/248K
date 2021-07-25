--local functions
local function config(name)
    return settings.startup['fi_crusher_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_crusher/fi_crusher_'..name
end

--item
data:extend({
    {
        name = 'fi_crusher_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fi_crusher_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-c',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fi_crusher_entity',
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
            result = 'fi_crusher_item',
        },
        crafting_categories = {'fi_crushing'},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            --input_flow_limit = '4MW',
        },
        energy_usage = '1MW',
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
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
            sound = { filename ='__base__/sound/electric-mining-drill.ogg'},
            apparent_volume = 2.7,
        },
    },
})