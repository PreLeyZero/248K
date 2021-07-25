--local functions
local function config(name)
    return settings.startup['gr_charger_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/gravitation/gr_charger/gr_charger_'..name
end

--item
data:extend({
    {
        name = 'gr_charger_item',
        type = 'item',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        place_result = 'gr_charger_entity',
        stack_size = 20,
        subgroup = 'gr_item_subgroup_c',
        order = 'a-a',
    }
})

--entity
data:extend({
    --prototype
    {
        name = 'gr_charger_entity',
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
            result = 'gr_charger_item',
        },
        crafting_categories = {"gr_charger_category"},
        crafting_speed = 1,
        energy_source = {
            type = 'heat',
            max_temperature = 1000,
            specific_heat = '100MJ',
            max_transfer = '10GW',
            connections = {
                {position = {0,-1.5}, direction = defines.direction.north},
                {position = {0,1.4}, direction = defines.direction.south},
                {position = {1.4,0}, direction = defines.direction.east},
                {position = {-1.5,0}, direction = defines.direction.west}
            }
        },
        energy_usage = '150MW',
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 4,
                frame_count = 4,
                animation_speed = 0.5,
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 4,
                frame_count = 4,
                animation_speed = 0.5,
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 4,
                frame_count = 4,
                animation_speed = 0.5,
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 4,
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