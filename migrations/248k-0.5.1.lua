require('scripts/electronic/el_ki_script')
require('scripts/gravitation/gr_black_hole_script')
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

gr_black_hole_init(e)






