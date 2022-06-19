--table of entites that need to be fixed
--first arg = entity name, second arg = entity to copy bounfing box from, third arg = entity index in data raw
affected_entities = {
    {"el_solar_entity", "solar-panel", "solar-panel"},
    {"fi_crafter_entity", "assembling-machine-3", "assembling-machine"},
    {"gr_crafter_entity", "assembling-machine-3", "assembling-machine"},
}

local function adjust_bounding_boxes(table_in)
    --loop over all affected entities
    for i,v in ipairs(table_in) do
        --set bounding box to be same as entity to copy from
        data.raw[v[3]][v[1]].collision_box = data.raw[v[3]][v[2]].collision_box
        data.raw[v[3]][v[1]].selection_box = data.raw[v[3]][v[2]].selection_box

        --set fast_replaceable_group 
        if data.raw[v[3]][v[2]].fast_replaceable_group then
            data.raw[v[3]][v[1]].fast_replaceable_group = data.raw[v[3]][v[2]].fast_replaceable_group
        else
            data.raw[v[3]][v[1]].fast_replaceable_group = v[3]
        end

        --collision mask
        data.raw[v[3]][v[1]].collision_mask = data.raw[v[3]][v[2]].collision_mask

        --bounding box
        data.raw[v[3]][v[1]].bounding_box = data.raw[v[3]][v[2]].bounding_box
    end
end

adjust_bounding_boxes(affected_entities)

--set next upgrades
data.raw['assembling-machine']['fi_crafter_entity'].next_upgrade = 'gr_crafter_entity'
data.raw['assembling-machine']['assembling-machine-3'].next_upgrade = 'fi_crafter_entity'
data.raw["solar-panel"]["solar-panel"].next_upgrade = "el_solar_entity"
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
