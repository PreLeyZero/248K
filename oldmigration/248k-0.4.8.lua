require('scripts/electronic/el_ki_script')
local gui = require('scripts/gui')

local function register_ki_entity(entity,type)
    if entity then
        if entity.valid then
            if global.ki then
                if global.ki[type] then
                    local unit = entity.unit_number
                    if not global.ki[type][unit] then
                        if type == "core" then
                            make_ki_core(entity)
                        end
                    
                        if type == "buffer1" then
                            make_ki_buffer1(entity)
                        end
                    
                        if type == "buffer2" then
                            make_ki_buffer2(entity)
                        end
                    
                        if type == "beacon" then
                            make_ki_beacon(entity)
                        end
                    end
                end
            end
        end
    end
end

local function remove_new_slaves(tablein,type,slave)
    local table = tablein
    for i,v in pairs(table) do 
        for x,f in pairs(global.ki[type]) do 
            if global.ki[type][x][slave] then
                if global.ki[type][x][slave].valid then
                    if table[i] then
                        if table[i].valid then
                            if global.ki[type][x][slave].unit_number == table[i].unit_number then
                                table[i] = nil
                            end
                        end
                    end
                end
            end
        end
    end
    return table
end

local function kill_old_slaves(table,type,slave)
    local old_slaves = remove_new_slaves(table,type,slave)
    if old_slaves then
        for i,v in pairs(old_slaves) do
            if old_slaves[i] then
                if old_slaves[i].valid then
                    local slave = old_slaves[i]
                    slave.destroy()
                end
            end
        end
    end
end




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

--if not global.ki then
    el_ki_init(e)
--end

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

for i,v in pairs(game.surfaces) do 
    local el_cores = game.surfaces[i].find_entities_filtered({name="el_ki_core_entity"})
    local fi_cores = game.surfaces[i].find_entities_filtered({name="fi_ki_core_entity"})
    local fu_cores = game.surfaces[i].find_entities_filtered({name="fu_ki_core_entity"})
    local el_beacons = game.surfaces[i].find_entities_filtered({name="el_ki_beacon_entity"})
    local fi_beacons = game.surfaces[i].find_entities_filtered({name="fi_ki_beacon_entity"})
    local fu_beacons = game.surfaces[i].find_entities_filtered({name="fu_ki_beacon_entity"})

    for x,f in pairs(el_cores) do 
        register_ki_entity(el_cores[i],"core")
    end
    for x,f in pairs(fi_cores) do 
        register_ki_entity(fi_cores[i],"buffer1")
    end
    for x,f in pairs(fu_cores) do 
        register_ki_entity(fu_cores[i],"buffer2")
    end

    for x,f in pairs(el_beacons) do 
        register_ki_entity(el_beacons[i],"beacon")
    end
    for x,f in pairs(fi_beacons) do 
        register_ki_entity(fi_beacons[i],"beacon")
    end
    for x,f in pairs(fu_beacons) do 
        register_ki_entity(fu_beacons[i],"beacon")
    end

    local slave_ki_cores = game.surfaces[i].find_entities_filtered({name="el_ki_core_slave_entity"})
    local slave_fi_cores = game.surfaces[i].find_entities_filtered({name="fi_ki_core_slave_entity"})
    local slave_fu_cores = game.surfaces[i].find_entities_filtered({name="fu_ki_core_slave_entity"})
    local container_fi_cores = game.surfaces[i].find_entities_filtered({name="fi_ki_core_slave_container_entity"})
    local container_fu_cores = game.surfaces[i].find_entities_filtered({name="fu_ki_core_slave_container_entity"})

    kill_old_slaves(slave_ki_cores,"core","slave")
    kill_old_slaves(slave_fi_cores,"buffer1","slave")
    kill_old_slaves(slave_fu_cores,"buffer2","slave")
    kill_old_slaves(container_fi_cores,"buffer1","container")
    kill_old_slaves(container_fu_cores,"buffer2","container")

end


