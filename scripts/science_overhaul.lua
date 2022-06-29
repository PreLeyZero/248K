--===================================================================================================================
--                              util 
--===================================================================================================================

local function sprite(name)
    return '__248k__/ressources/science/'..name..'.png'
end

local function retexture_science(table_in)
    for i,v in ipairs(table_in) do
        data.raw.tool[v[1]].icon_size = 64
        data.raw.tool[v[1]].icon = sprite(v[2])

        data.raw.technology[v[1]].icon_size = 128
        data.raw.technology[v[1]].icon = sprite(v[2].."_tech")
    end
end

--===================================================================================================================
--                              tables 
--===================================================================================================================

retexture_table = {
    {"logistic-science-pack", "green_science"},
    {"chemical-science-pack", "blue_science"},
    {"military-science-pack", "grey_science"},
    {"production-science-pack", "purple_science"},
    {"utility-science-pack", "yellow_science"},
    {"space-science-pack", "white_science"},
}

--===================================================================================================================
--                              structures and adding 
--===================================================================================================================

if settings.startup['retexture_science'].value then
-- indent ignored

    --only retexture if no k2
    if not mods["Krastorio2"] then
        retexture_science(retexture_table)

        data.raw.tool["automation-science-pack"].icon = sprite("red_science")
        data.raw.tool["fu_space_probe_science_item"].icon = sprite("exotic_science")
    end

end --indent ignored

if settings.startup['overhaul_science'].value then
    -- indent ignored
    
    --only overhaul if no k2
    if not mods["Krastorio2"] then
        data.raw.technology["fu_lab_tech"].enabled = true
        data.raw.technology["fu_lab_tech"].hidden = false
        table.insert(data.raw.technology["fu_space_probe_3_tech"].prerequisites, "fu_lab_tech")
    end
    
end --indent ignored
    

