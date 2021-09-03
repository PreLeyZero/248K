--local functions
local function config(name)
    return settings.startup['fi_castor_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_castor/fi_castor_'..name
end

--item
data:extend({
    {
        name = 'fi_castor_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'fi_castor_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fi_castor_entity',
        type = 'assembling-machine',
        icon = sprite('icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_castor_item',
        },
        fixed_recipe = 'fi_decay_waste_recipe',
        crafting_categories = {'fi_castor_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            --input_flow_limit = '4MW',
        },
        energy_usage = '100kW',
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 1,
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 1,
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 1,
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {480,448},
                scale = 0.2,
                line_length = 1,
                frame_count = 1,
                animation_speed = 1,
            },
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
            apparent_volume = 0.2,
        },
    },
})