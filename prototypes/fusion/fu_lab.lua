--local functions
local function config(name)
    return settings.startup['fu_fusor_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fusion/fu_lab/fu_lab_'..name..".png"
end

--item
data:extend({
    {
        name = 'fu_lab_item',
        type = 'item',
        icon = sprite('icon'),
        icon_size = 64,
        place_result = 'fu_lab_entity',
        stack_size = 20,
        subgroup = 'fu_item_subgroup_c',
        order = 'a-a',
    },
})

--entity
data:extend({
{
    name = "fu_lab_entity",
    type = "lab",
    icon = sprite("icon"),
    icon_size = 64,
    flags = {"player-creation","placeable-neutral"},
    max_health = 1000,
    corpse = "big-remnants",
    collision_box = {{-5,-5},{5,5}},
    selection_box = {{-5,-5},{5,5}},
    map_color = {r=0, g=0, b=1, a=1},
    minable = {
        mining_time = 1,
        result = "fu_lab_item",
    },
    researching_speed = 10,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_usage = "20MW",
    inputs = {
        "automation-science-pack",
        "chemical-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "production-science-pack",
        "space-science-pack",
        "utility-science-pack",
        "fu_space_probe_science_item",
        "fi_ki_science",
        "fu_ki_science"
    },
    allowed_effects = {"speed", "productivity", "consumption", "pollution"},
    module_specification = {
        module_info_icon_shift = {
            0,
            0.8
        },
        module_slots = 4
    }, 
    off_animation = {
        filename = sprite("off"),
        size = {512*2,512*2},
        scale = 0.41,
        line_length = 1,
        frame_count = 1,
        animation_speed = 1,
        shift = {1.5,-0.4}
    },
    on_animation = {
        layers = {
            {
                filename = sprite("off"),
                size = {512*2,512*2},
                scale = 0.41,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.4,
                shift = {1.5,-0.4},
                repeat_count = 16
            },
            {
                filename = sprite("animation"),
                size = {512*2,512*2},
                scale = 0.41,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
                animation_speed = 0.4,
                shift = {1.5,-0.4}
            }
        }
    },

    working_sound = { 
        sound = { filename = "__base__/sound/lab.ogg"},
        idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
        apparent_volume = 0.7,
    },
},
})