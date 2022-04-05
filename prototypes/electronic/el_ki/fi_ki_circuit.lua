--local functions
local function config(name)
    return settings.startup['fi_ki_circuit_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_ki/fi_ki_circuit/fi_ki_circuit_'..name
end

--item
data:extend({
    {
        name = 'fi_ki_circuit_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fi_ki_circuit_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_k',
        order = 'a-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fi_ki_circuit_entity',
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
            result = 'fi_ki_circuit_item',
        },
        crafting_categories = {'fi_ki_circuit_category'},
        crafting_speed = 1,
        ingredient_count = 3,
        --fixed_recipe = 'fi_ki_circuit_fluid_recipe',
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            input_flow_limit = '50000kW',
        },
        energy_usage = '40000kW',
        fluid_boxes = {
            {
              filter = 'fi_ki_circuit_fluid',
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_picture = grey_south_pipe_picture,
              pipe_connections =
              {
                {type = "output", position = {0, 2}},
              },
              production_type = "output"
            },
        },

        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {480,484},
                scale = 0.22,
                line_length = 5,
                frame_count = 4,
                animation_speed = 0.5,
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {480,484},
                scale = 0.22,
                line_length = 5,
                frame_count = 4,
                animation_speed = 0.5,
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {480,484},
                scale = 0.22,
                line_length = 5,
                frame_count = 4,
                animation_speed = 0.5,
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {480,484},
                scale = 0.22,
                line_length = 5,
                frame_count = 4,
                animation_speed = 0.5,
            },
        },
        working_sound = { 
            sound = { filename = '__base__/sound/accumulator-idle.ogg'},
            apparent_volume = 1.5,
        },
    },
})