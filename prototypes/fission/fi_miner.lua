--local functions
local function config(name)
    return settings.startup['fi_miner_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_miner/fi_miner_'..name
end

--item
data:extend({
    {
        name = 'fi_miner_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'fi_miner_entity',
        stack_size = 20,
        subgroup = 'fi_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'fi_miner_entity',
        type = 'mining-drill',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.7,-1.3},{2.7,1.3}},
        selection_box = {{-3,-1.5},{3,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_miner_item',
        },
        energy_source = {
            type = 'burner',
            fuel_inventory_size = 3,
            burnt_inventory_size = 3,
            effectivity = 0.35,
            emissions_per_minute = 75,
            fuel_category = 'fi_basic_fuel'
        },
        energy_usage = '4MW',
        mining_speed = 4.5,
        resource_categories = {'basic-solid'},
        resource_searching_radius = 6,
        vector_to_place_result = {3.25,0},
        radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
			width = 10,
			height = 10,
        },
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
        }, 
        --animation
        animations = {
            north = {
                filename = sprite('entity_animation_vertikal.png'),
                size = {448*2,550},
                scale = 0.2,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 4,
                animation_speed = 0.5,
                shift = {0,-0.3},
            },
            east = {
                filename = sprite('entity_animation_horizontal.png'),
                size = {480,448*2},
                scale = 0.2,
                line_length = 10,
                frame_count = 4,
                animation_speed = 0.5,
            },
            south = {
                filename = sprite('entity_animation_vertikal.png'),
                size = {448*2,550},
                scale = 0.2,
                line_length = 3,
                lines_per_file = 3,
                frame_count = 4,
                animation_speed = 0.5,
                shift = {0,-0.3},
            },
            west = {
                filename = sprite('entity_animation_horizontal.png'),
                size = {480,448*2},
                scale = 0.2,
                line_length = 10,
                frame_count = 4,
                animation_speed = 0.5,
            },
        },
        working_sound = { 
            sound = { filename ='__base__/sound/electric-mining-drill.ogg'},
            apparent_volume = 3.2,
        },
    },
})