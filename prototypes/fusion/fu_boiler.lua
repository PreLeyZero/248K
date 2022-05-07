--local functions
local function config(name)
    return settings.startup['fu_boiler_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_boiler/fu_boiler_'..name
end

--item
data:extend({
    {
        name = 'fu_boiler_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fu_boiler_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-c',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fu_boiler_entity',
        type = 'assembling-machine',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-1.8,-1.8},{1.8,1.8}},
        selection_box = {{-2,-2},{2,2}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fu_boiler_item',
        },
        crafting_categories = {'fu_boiler_crafting_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'heat',
            max_temperature = 1000,
            specific_heat = '100MJ',
            max_transfer = '10GW',
            min_working_temperature = 500,
            connections = {
                {position = {0.5,-1.8}, direction = defines.direction.north},
                {position = {-0.5,-1.8}, direction = defines.direction.north},
            }
        },
        energy_usage = '150MW',
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
        }, 
        --fluids
        fluid_boxes = {
            { 
              filter = 'water',
              base_area = 1,
              height = 2,
              base_level = -1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "input", position = {-2.5, -0.5}}
              },
              production_type = "input"
            },
            { 
              filter = 'fu_hydrogen',
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "output", position = {2.5, -0.5}},
              },
              production_type = "output"
            },
            {
              filter = 'fu_oxygen',
              base_area = 1,
              height = 2,
              base_level = 1,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {type = "output", position = {0.5, 2.5}},
              },
              production_type = "output"
            },
        },
        --animation
        animation = {
            north = {
                filename = sprite('entity_animation.png'),
                size = {512,512},
                scale = 0.255,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
            east = {
                filename = sprite('entity_animation.png'),
                size = {512,512},
                scale = 0.255,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
            south = {
                filename = sprite('entity_animation.png'),
                size = {512,512},
                scale = 0.255,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
            west = {
                filename = sprite('entity_animation.png'),
                size = {512,512},
                scale = 0.255,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.5,
            },
        },
        
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
})