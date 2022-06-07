--local functions
local function config(name)
    return settings.startup['el_solar_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_solar/el_solar_'..name
end

local function solar_output()
    if config("power_output") == "80kW (normal)" then
        return "80KW"
    end

    if config("power_output") == "100kW (high)" then
        return "100KW"
    end

    if config("power_output") == "160kW (very high)" then
        return "160KW"
    end
    
    return "80kW"
end

--item
data:extend({
    {
        name = 'el_solar_item',
        type = 'item',
        icon = sprite('item.png'),
        icon_size = 64,
        place_result = 'el_solar_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_c',
        order = 'a-c',
    },

})

--entity
data:extend({
    --prototype
    {
        name = 'el_solar_entity',
        type = 'solar-panel',
        icon = sprite('entity_icon.png'),
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        --minable
        minable = {
            mining_time = 1,
            result = 'el_solar_item',
        },
        max_health = 150,
        corpse = 'small-remnants',
        collision_box = data.raw['solar-panel']['solar-panel'].collision_box,
        selection_box = data.raw['solar-panel']['solar-panel'].selection_box,
        squeak_behaviour = false,
        --energy
        energy_source = {
            type = 'electric',
            usage_priority = 'solar',
            input_flow_limit = '0W',
        },
        --fast_replaceable_group = 'solar-panel',
        production = solar_output(),
        --picture
        picture = {
            filename = sprite('entity_picture_1.png'),
            width = 386,
            height = 448,
            scale = 0.25,
        },
        map_color = {r=1.7,g=1.7,b=1.7},
    },
})