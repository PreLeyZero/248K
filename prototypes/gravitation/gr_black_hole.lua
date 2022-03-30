--local functions
local function config(name)
    return settings.startup['gr_black_hole_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/gravitation/gr_black_hole/gr_black_hole_'..name
end

--item
data:extend({
    {
        name = 'gr_black_hole_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'gr_black_hole_base_entity',
        stack_size = 1,
        subgroup = 'gr_item_subgroup_c',
        order = 'e-a',
    },
    {
        name = 'gr_black_hole_base_entity',
        type = 'container',
        icon = sprite('item.png'),
        icon_size = 64,
        collision_box = {{-5.8,-3.8},{5.8,5.8}},
        selection_box = {{-6,-4},{6,6}},
        selection_priority = 60,
        picture = {
            filename = sprite('base_animation.png'),
            width = 512*2,
            height = 512*2,
            scale = 0.4,
            shift = {0,0.5}
        },
        inventory_size = 80,
        flags = {"player-creation","placeable-neutral","not-rotatable"},
        max_health = 1500,
        corpse = 'big-remnants',
        map_color = {r=1, g=0, b=0, a=0.5},
        minable = {
            mining_time = 1,
            result = 'gr_black_hole_item',
        },
        integration_patch_render_layer = "higher-object-under"
    },
    {
        name = "gr_black_hole_energy_entity",
        type = "electric-energy-interface",
        energy_source = {
            type = "electric",
            render_no_power_icon = false,
            buffer_capacity = "1TJ",
            usage_priority = "primary-output",
            max_input_flow = "0W",
            max_output_flow = "1TW",
            --drain = "1GW"
        },
        light = {
            type = 'basic',
            intensity = 10,
            size = 20,
            color = {r=0,g=0,b=0.75}
        },
        render_layer = "higher-object-above",
        animation =  {
            filename = sprite('working_animation.png'),
            size = {512*2,512*2},
            scale = 0.4,
            line_length = 4,
            frame_count = 4,
            animation_speed = 0.5,
            shift = {0,0.5}
        },
        continuous_animation = true
    }
})


