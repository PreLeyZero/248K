--local functions
local function config(name)
    return settings.startup['fi_solid_reactor_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_solid_reactor/fi_solid_reactor_'..name
end

--item
data:extend({
    {
        name = 'fi_solid_reactor_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fi_solid_reactor_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'b-a',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fi_solid_reactor_entity',
        type = 'reactor',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.7,-2.7},{2.7,2.7}},
        selection_box = {{-3.0,-3.0},{3.0,3.0}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_solid_reactor_item',
        },
        consumption = '60MW',
        neighbour_bonus = 2,
        energy_source = {
            type = 'burner',
            fuel_inventory_size = 3,
            burnt_inventory_size = 3,
            effectivity = 0.9,
            fuel_categories = {
                'fi_basic_fuel',
                'fi_advanced_fuel',
                'fi_pure_fuel'
            }
        },
        heat_buffer = {
            max_temperature = 1000,
            specific_heat = '10MJ',
            max_transfer = '10GW',
            connections = {
                {position = {0.5,-3}, direction = defines.direction.north},
                {position = {-0.5,-3}, direction = defines.direction.north},
                
                {position = {2.9,0.5}, direction = defines.direction.east},
                {position = {2.9,-0.5}, direction = defines.direction.east},
                
                {position = {-3,0.5}, direction = defines.direction.west},
                {position = {-3,-0.5}, direction = defines.direction.west},
                
                {position = {0.5,2.9}, direction = defines.direction.south},
                {position = {-0.5,2.9}, direction = defines.direction.south}
            }
        },
        picture = {
            filename = sprite('entity_animation.png'),
            width = 960,
            height = 960,
            shift = {0, 0},
            scale = 0.2,
        },
        working_light_picture ={
            filename = sprite('working_light.png'),
            width = 960,
            height = 960,
            shift = {0, 0},
            scale = 0.2,
        },
        light = {
            type = 'basic',
            intensity = 0.4,
            size = 14,
            color = {r=0.1,g=0.5,b=0.75}
        },
        working_sound = { 
            sound = { filename ='__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
})