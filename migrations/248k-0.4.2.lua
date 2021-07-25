for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    force.reset_technology_effects()
end


if (not global.fi_ki_module) then
    global.fi_ki_module = {}
end

if (not global.el_ki_stats) then
    global.el_ki_stats = {}
end

if (not global.fi_ki_stats) then
    global.fi_ki_stats = {}
end

if (not global.fu_ki_module) then
    global.fu_ki_module = {}
end

if (not global.fu_ki_stats) then
    global.fu_ki_stats = {}
end

for i,v in pairs(global.el_ki_stats) do 
    if (not global.el_ki_stats[i]['filink']) then
        global.el_ki_stats[i]['filink'] = 0
    end
    
    if (not global.el_ki_stats[i]['fulink']) then
        global.el_ki_stats[i]['fulink'] = 0
    end
end


