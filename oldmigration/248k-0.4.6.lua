require('scripts/electronic/el_ki_script')
local gui = require('scripts/gui')


for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    force.reset_technology_effects()
end


if game.active_mods["Booktorio"] then
    registerThread_248k()
end

for i,v in pairs(game.players) do 
    gui.add_top_gui(game.players[i])
end

if not global.ki then
    el_ki_init(e)
end

if global.el_ki_stats then
    for i,v in pairs(global.el_ki_stats) do
        local slave = global.el_ki_stats[i].slave
        slave.destroy()
        local container = global.el_ki_stats[i].container
        container.destroy()
        make_ki_core(global.el_ki_stats[i].entity)
        global.el_ki_stats[i] = nil
    end
    global.el_ki_stats = nil
end
if global.fi_ki_stats then
    for i,v in pairs(global.fi_ki_stats) do
        local slave = global.fi_ki_stats[i].slave
        slave.destroy()
        local container = global.fi_ki_stats[i].container
        container.destroy()
        local container2 = global.fi_ki_stats[i].container2
        container2.destroy()
        make_ki_buffer1(global.fi_ki_stats[i].entity)
        global.fi_ki_stats[i] = nil
    end
    global.fi_ki_stats = nil
end
if global.fu_ki_stats then
    for i,v in pairs(global.fu_ki_stats) do
        local slave = global.fu_ki_stats[i].slave
        slave.destroy()
        local container = global.fu_ki_stats[i].container
        container.destroy()
        local container2 = global.fu_ki_stats[i].container2
        container2.destroy()
        make_ki_buffer2(global.fu_ki_stats[i].entity)
        global.fu_ki_stats[i] = nil
    end
    global.fu_ki_stats = nil
end
if global.el_ki_beacons then
    for i,v in pairs(global.el_ki_beacons) do
        local slave = global.el_ki_beacons[i].slave
        slave.destroy()
        make_ki_beacon(global.el_ki_beacons[i].entity)
        global.el_ki_beacons[i] = nil
    end
    global.el_ki_beacons = nil
end