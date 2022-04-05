--local functions
local function config(name)
    return settings.startup['el_tank_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_tank/el_tank_'..name
end

--item
data:extend({
    {
        name = 'el_tank_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'el_tank_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_c',
        order = 'a-c',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'el_tank_entity',
        type = 'storage-tank',
        icon = sprite('item.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        --minable
        minable = {
            mining_time = 1,
            result = 'el_tank_item',
        },
        max_health = 300,
        corpse = 'small-remnants',
        collision_box = {{-3.5,-3.5},{3.5,3.5}},
        selection_box = {{-3.5,-3.5},{3.5,3.5}},
        pictures = {
            picture = {
                filename = sprite('entity_picture.png'),
                width = 512,
                height = 512,
                scale = 1.11/2,
                shift = {0,-0.96},
            },
            window_background = {
                filename = sprite('blank.png'),
                width = 64,
                height = 64,
                scale = 0.5,
            },
            fluid_background = {
                filename = sprite('blank.png'),
                width = 64,
                height = 64,
                scale = 0.5,
            },
            flow_sprite = {
                filename = sprite('blank.png'),
                width = 64,
                height = 64,
                scale = 0.5,
            },
            gas_flow = {
                filename = sprite('blank.png'),
                width = 64,
                height = 64,
                scale = 0.5,
                line_length = 1,
                frame_count = 1,
                animation_speed = 1,
            }
        },
        flow_length_in_ticks = 1,
        fluid_box = {
            base_area = 5000,
            height = 1,
            base_level = 0,
            pipe_covers = pipecoverspictures(),
            pipe_connections =
            {
              {type = "input-output", position = {-4, 1}},
              {type = "input-output", position = {-4, -1}},

              {type = "input-output", position = {4, 1}},
              {type = "input-output", position = {4, -1}},

              {type = "input-output", position = {1, 4}},
              {type = "input-output", position = {1, -4}},

              {type = "input-output", position = {-1, 4}},
              {type = "input-output", position = {-1, -4}}
            },
            production_type = "input-output"
        },
        window_bounding_box = {{0,0},{1,1}},
        map_color = {r=1.7,g=1.7,b=1.7},
    },
})
