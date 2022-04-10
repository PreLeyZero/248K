local util = require("util")
local gui = require('scripts/gui')

--=================================================================================
--init
--=================================================================================

function el_ki_init(e)
    global.ki = {}
    global.ki.dirty = false
    global.ki.total = 0
    global.ki.channel = {}
    global.ki.core = {}
    global.ki.beacon = {}
    global.ki.buffer1 = {}
    global.ki.buffer2 = {}
    global.ki.supported = 100
    global.ki.supported1 = false
    global.ki.supported2 = false
    global.ki.supported3 = false
    global.ki.supported4 = false

    --base channel
    global.ki.channel[0] = {}
    global.ki.channel[0].beacons = {}
    global.ki.channel[0].core = {}
    global.ki.channel[0].buffer1 = {}
    global.ki.channel[0].buffer2 = {}

    global.ki.standardchannel = 0
    global.ki.selectchannel = 0

    --gui stuff
    global.ki.gui = {}
    global.ki.gui.core = {}
    global.ki.gui.main = {}
    global.ki.gui.buffer1 = {}
    global.ki.gui.buffer2 = {}
end


--=================================================================================
--on built
--=================================================================================

function el_ki_on_built(e)
    
    if e['created_entity'] then
        if e['created_entity'].name == 'el_ki_core_entity' then
            make_ki_core(e['created_entity'])
        end
        if e['created_entity'].name == 'el_ki_beacon_entity' then
            make_ki_beacon(e['created_entity'])
        end

        if e['created_entity'].name == 'fi_ki_core_entity' then
            make_ki_buffer1(e['created_entity'])
        end
        if e['created_entity'].name == 'fi_ki_beacon_entity' then
            make_ki_beacon(e['created_entity'])
        end
        
        if e['created_entity'].name == 'fu_ki_core_entity' then
            make_ki_buffer2(e['created_entity'])
        end
        if e['created_entity'].name == 'fu_ki_beacon_entity' then
            make_ki_beacon(e['created_entity'])
        end
    end
    
    if e['entity'] then
        if e['entity'].name == 'el_ki_core_entity' then
            make_ki_core(e['entity'])
        end
        if e['entity'].name == 'el_ki_beacon_entity' then
            make_ki_beacon(e['entity'])
        end
        
        if e['entity'].name == 'fi_ki_core_entity' then
            make_ki_buffer1(e['entity'])
        end
        if e['entity'].name == 'fi_ki_beacon_entity' then
            make_ki_beacon(e['entity'])
        end
        
        if e['entity'].name == 'fu_ki_core_entity' then
            make_ki_buffer2(e['entity'])
        end
        if e['entity'].name == 'fu_ki_beacon_entity' then
            make_ki_beacon(e['entity'])
        end
    end    

    if e['entity'] then
        if e['entity'].name == "entity-ghost" then
            remove_request_ghost(e['entity'])
        end     
    end

    if e['created_entity'] then
        if e['created_entity'].name == "entity-ghost" then
            remove_request_ghost(e['created_entity'])
        end
    end
end

--=================================================================================
--on remove
--=================================================================================

function el_ki_on_remove(e)
    if e["entity"] then
        if e["entity"].name == "el_ki_core_entity" then
            if e["player_index"] then
                destroy_ki_core(e["entity"],e["player_index"],nil)
            elseif e["robot"] then
                destroy_ki_core(e["entity"],nil,e["robot"])
            else 
                destroy_ki_core(e["entity"],nil,nil)
            end
        end

        if e["entity"].name == "fi_ki_core_entity" then
            if e["player_index"] then
                destroy_fi_core(e["entity"],e["player_index"],nil)
            elseif e["robot"] then
                destroy_fi_core(e["entity"],nil,e["robot"])
            else 
                destroy_fi_core(e["entity"],nil,nil)
            end
        end

        if e["entity"].name == "fu_ki_core_entity" then
            if e["player_index"] then
                destroy_fu_core(e["entity"],e["player_index"],nil)
            elseif e["robot"] then
                destroy_fu_core(e["entity"],nil,e["robot"])
            else 
                destroy_fu_core(e["entity"],nil,nil)
            end
        end

        if (e["entity"].name == "el_ki_beacon_entity") or (e["entity"].name == "fi_ki_beacon_entity") or (e["entity"].name == "fu_ki_beacon_entity") then
            destroy_ki_beacon(e["entity"])
        end
    end
end

--=================================================================================
--make
--=================================================================================

function make_ki_core(entity)
    register_ki_core(entity)
    make_slave_ki_core(entity)
    global.ki.dirty = true
    --gui.update_main()
end

function make_ki_buffer1(entity)
    register_ki_buffer1(entity)
    make_slave_ki_buffer1(entity)
    --make_container_ki_buffer1(entity)
    global.ki.dirty = true
    --gui.update_main()
end

function make_ki_buffer2(entity)
    register_ki_buffer2(entity)
    make_slave_ki_buffer2(entity)
    --make_container_ki_buffer2(entity)
    global.ki.dirty = true
    --gui.update_main()
end

function make_ki_beacon(entity)
    register_ki_beacon(entity)
    el_ki_single_beacon_update(entity.unit_number)
    gui.update_main()

    make_beacon_text(entity)
    --el_ki_beacon_make_text(entity)
end

function destroy_ki_core(entity,player_index,robot) 
    if not global.ki.core[entity.unit_number] then
        return
    end
    if not global.ki.core[entity.unit_number].slave then
        return
    end
    destroy_slave_ki_core(entity,global.ki.core[entity.unit_number].slave,player_index,robot)
    unregister_ki_core(entity)
    global.ki.dirty = true
    --gui.update_main()
end

function destroy_fi_core(entity,player_index,robot)
    if not global.ki.buffer1[entity.unit_number] then
        return
    end
    if not global.ki.buffer1[entity.unit_number].slave then
        return
    end
    destroy_slave_ki_core(entity,global.ki.buffer1[entity.unit_number].slave,player_index,robot)

    if global.ki.buffer1[entity.unit_number].container then 
        destroy_slave_ki_core(entity,global.ki.buffer1[entity.unit_number].container,player_index,robot)
    end
    unregister_ki_buffer1(entity)
    global.ki.dirty = true
    --gui.update_main()
end

function destroy_fu_core(entity,player_index,robot)
    if not global.ki.buffer2[entity.unit_number] then
        return
    end
    if not global.ki.buffer2[entity.unit_number].slave then
        return
    end
    destroy_slave_ki_core(entity,global.ki.buffer2[entity.unit_number].slave,player_index,robot)

    if global.ki.buffer2[entity.unit_number].container then 
        destroy_slave_ki_core(entity,global.ki.buffer2[entity.unit_number].container,player_index,robot)
    end
    unregister_ki_buffer2(entity)
    global.ki.dirty = true
    --gui.update_main()
end

function destroy_ki_beacon(entity)
    clear_ki_beacon(entity)
    unregister_ki_beacon(entity)
    count_total_beacons()

    if is_beacon_supported() then
        global.ki.dirty = true
    end

    gui.update_main()
end

--=================================================================================
--register
--=================================================================================

function register_ki_core(entity)
    local unit = entity.unit_number
    local channel = make_channel(unit)

    global.ki.core[unit] = {}
    global.ki.core[unit].entity = entity
    global.ki.core[unit].channel = channel
    global.ki.core[unit].modules = {}
    global.ki.core[unit].oldmodules = {}
    global.ki.core[unit].active = false

    if global.ki.standardchannel == 0 then
        global.ki.standardchannel = channel
    end
end

function register_ki_buffer1(entity) 
    local unit = entity.unit_number
    local standardchannel = global.ki.standardchannel

    global.ki.buffer1[unit] = {}
    global.ki.buffer1[unit].entity = entity
    global.ki.buffer1[unit].channel = 0
    global.ki.buffer1[unit].modules = {}
    global.ki.buffer1[unit].oldmodules = {}
    global.ki.buffer1[unit].active = false

    if not (standardchannel == 0) then
        if not global.ki.channel[standardchannel].buffer1 then
            global.ki.channel[standardchannel].buffer1 = unit
            global.ki.buffer1[unit].channel = standardchannel
        end
    end
end

function register_ki_buffer2(entity) 
    local unit = entity.unit_number
    local standardchannel = global.ki.standardchannel

    global.ki.buffer2[unit] = {}
    global.ki.buffer2[unit].entity = entity
    global.ki.buffer2[unit].channel = 0
    global.ki.buffer2[unit].modules = {}
    global.ki.buffer2[unit].oldmodules = {}
    global.ki.buffer2[unit].totalmodules = {}
    global.ki.buffer2[unit].active = false

    if not (standardchannel == 0) then
        if not global.ki.channel[standardchannel].buffer2 then
            global.ki.channel[standardchannel].buffer2 = unit
            global.ki.buffer2[unit].channel = standardchannel
        end
    end
end

function register_ki_beacon(entity)
    local unit = entity.unit_number

    global.ki.beacon[unit] = {}
    global.ki.beacon[unit].entity = entity
    global.ki.beacon[unit].channel = global.ki.standardchannel

    add_to_channel(unit)
    global.ki.beacon[unit].supported = is_beacon_supported()

    entity.operable = false
end

--=================================================================================
--unregister
--=================================================================================

function unregister_ki_core(entity)
    local id = entity.unit_number

    if not global.ki then
        return
    end
    if not global.ki.core then
        return
    end
    if not global.ki.core[id] then
        return
    end
    if not global.ki.core[id].channel then
        return
    end

    local channel = global.ki.core[id].channel

    global.ki.core[id] = nil
    global.ki.channel[channel].core = nil
end

function unregister_ki_buffer1(entity)
    local id = entity.unit_number

    if not global.ki then
        return
    end
    if not global.ki.buffer1 then
        return
    end
    if not global.ki.buffer1[id] then
        return
    end
    if not global.ki.buffer1[id].channel then
        return
    end

    local channel = global.ki.buffer1[id].channel

    global.ki.buffer1[id] = nil
    global.ki.channel[channel].buffer1 = nil
end

function unregister_ki_buffer2(entity)
    local id = entity.unit_number

    if not global.ki then
        return
    end
    if not global.ki.buffer2 then
        return
    end
    if not global.ki.buffer2[id] then
        return
    end
    if not global.ki.buffer2[id].channel then
        return
    end

    local channel = global.ki.buffer2[id].channel

    global.ki.buffer2[id] = nil
    global.ki.channel[channel].buffer2 = nil
end

function unregister_ki_beacon(entity)
    local id = entity.unit_number

    if not global.ki then
        return
    end
    if not global.ki.beacon then
        return
    end
    if not global.ki.beacon[id] then
        return
    end
    if not global.ki.beacon[id].channel then
        return
    end

    local channel = global.ki.beacon[id].channel

    global.ki.beacon[id] = nil
    for i,v in pairs(global.ki.channel[channel].beacons) do
        if v == id then
            table.remove(global.ki.channel[channel].beacons, i)
            break
        end
    end
end

--=================================================================================
--update
--=================================================================================
function el_ki_core_working() 
    for i in pairs(global.ki.core) do
        if global.ki.core[i].entity.valid then
            local oldactive = global.ki.core[i].active
            global.ki.core[i].active = global.ki.core[i].entity.is_crafting()

            if not oldactive == global.ki.core[i].active then
                global.ki.dirty = true
            end
        end
    end
end

function el_ki_buffer1_working() 
    for i in pairs(global.ki.buffer1) do
        if global.ki.buffer1[i].entity.valid then
            local oldactive = global.ki.buffer1[i].active
            global.ki.buffer1[i].active = global.ki.buffer1[i].entity.is_crafting()

            if not oldactive == global.ki.buffer1[i].active then
                global.ki.dirty = true
            end

            --if global.ki.buffer1[i].entity.products_finished >= 3 then
            --    if global.ki.buffer1[i].container then
            --        local container = global.ki.buffer1[i].container
            --        local container_inv = container.get_inventory(defines.inventory.chest)

            --        if container_inv.can_insert({name='fi_ki_science', count=1}) then
            --            container_inv.insert({name='fi_ki_science', count=1})
            --            global.ki.buffer1[i].entity.products_finished = 0
            --        end
            --    end
            --end
        end
    end
end

function el_ki_buffer2_working() 
    for i in pairs(global.ki.buffer2) do
        if global.ki.buffer2[i].entity.valid then
            local oldactive = global.ki.buffer2[i].active
            global.ki.buffer2[i].active = global.ki.buffer2[i].entity.is_crafting()

            if not oldactive == global.ki.buffer2[i].active then
                global.ki.dirty = true
            end

            --if global.ki.buffer2[i].entity.products_finished >= 3 then
            --    if global.ki.buffer2[i].container then
            --        local container = global.ki.buffer2[i].container
            --        local container_inv = container.get_inventory(defines.inventory.chest)

            --        if container_inv.can_insert({name='fu_ki_science', count=1}) then
            --            container_inv.insert({name='fu_ki_science', count=1})
            --            global.ki.buffer2[i].entity.products_finished = 0
            --        end
            --    end
            --end
        end
    end
end

function el_ki_core_update()
    for i in pairs(global.ki.core) do

        global.ki.core[i].oldmodules = util.table.deepcopy(global.ki.core[i].modules)

        if global.ki.core[i].slave then
            if global.ki.core[i].slave.valid then
                local slaveinv = global.ki.core[i].slave.get_module_inventory()
                local slavemodules = slaveinv.get_contents()
                global.ki.core[i].modules = {}
            
                for x,v in pairs(slavemodules) do 
                    for f=1,v,1 do 
                        table.insert(global.ki.core[i].modules,x)
                    end
                end
            end
        end

        if not (#global.ki.core[i].modules == #global.ki.core[i].oldmodules) then
            global.ki.dirty = true
        else
            for x,v in pairs(global.ki.core[i].modules) do
                if not v == global.ki.core[i].oldmodules[x] then
                    global.ki.dirty = true
                    break
                end
            end
        end
    end 
end

function el_ki_buffer1_update()
    for i in pairs(global.ki.buffer1) do

        global.ki.buffer1[i].oldmodules = util.table.deepcopy(global.ki.buffer1[i].modules)

        if global.ki.buffer1[i].slave then
            if global.ki.buffer1[i].slave.valid then
                local slaveinv = global.ki.buffer1[i].slave.get_module_inventory()
                local slavemodules = slaveinv.get_contents()
                global.ki.buffer1[i].modules = {}
                
                for x,v in pairs(slavemodules) do 
                    for f=1,v,1 do 
                        table.insert(global.ki.buffer1[i].modules,x)
                    end
                end
            end
        end

        if not (#global.ki.buffer1[i].modules == #global.ki.buffer1[i].oldmodules) then
            global.ki.dirty = true
        else
            for x,v in pairs(global.ki.buffer1[i].modules) do
                if not v == global.ki.buffer1[i].oldmodules[x] then
                    global.ki.dirty = true
                    break
                end
            end
        end
    end
end

function el_ki_buffer2_update()
    for i in pairs(global.ki.buffer2) do

        global.ki.buffer2[i].oldmodules = util.table.deepcopy(global.ki.buffer2[i].modules)

        if global.ki.buffer2[i].slave then
            if global.ki.buffer2[i].slave.valid then
                local slaveinv = global.ki.buffer2[i].slave.get_module_inventory()
                local slavemodules = slaveinv.get_contents()
                global.ki.buffer2[i].modules = {}
                
                for x,v in pairs(slavemodules) do 
                    for f=1,v,1 do 
                        table.insert(global.ki.buffer2[i].modules,x)
                    end
                end
            end
        end

        if not (#global.ki.buffer2[i].modules == #global.ki.buffer2[i].oldmodules) then
            global.ki.dirty = true
        else
            for x,v in pairs(global.ki.buffer2[i].modules) do
                if not v == global.ki.buffer2[i].oldmodules[x] then
                    global.ki.dirty = true
                    break
                end
            end
        end
    end
end

function el_ki_beacon_update()
    el_ki_buffer1_adder()

    --if now less beacons then support max 
    if is_beacon_supported() then
        local dif = global.ki.supported - count_total_beacons()

        local unsupported = get_unsupported_beacons()
        for i,v in ipairs(unsupported) do
            global.ki.beacon[v].supported = true
            dif = dif - 1
            if dif == 0 then 
                break 
            end
        end
    end

    for i,v in pairs(global.ki.beacon) do 
      el_ki_single_beacon_update(i)  
    end
end

function el_ki_single_beacon_update(id)
    if global.ki.beacon[id].supported then
        if global.ki.beacon[id].entity.valid then
            local beacon_entity = global.ki.beacon[id].entity
            local beacon_inv = beacon_entity.get_module_inventory()
            local channel = global.ki.beacon[id].channel

            beacon_inv.clear()

            if global.ki.beacon[id].icon then
                rendering.destroy(global.ki.beacon[id].icon)
                global.ki.beacon[id].icon = nil
            end

            if global.ki.channel[channel].core then
                local coreunit = global.ki.channel[channel].core
                if global.ki.core[coreunit] then
                    if global.ki.core[coreunit].active then
                        for i,v in pairs(global.ki.core[coreunit].totalmodules) do
                            if beacon_inv.can_insert({name=global.ki.core[coreunit].totalmodules[i], count=1}) then
                                beacon_inv.insert({name=global.ki.core[coreunit].totalmodules[i], count=1})
                            end
                        end
                    end
                end
            end
        end
    end

    if not global.ki.beacon[id].supported then
        if not global.ki.beacon[id].icon then
            if global.ki.beacon[id].entity.valid then
                global.ki.beacon[id].icon = make_not_operable_icon(global.ki.beacon[id].entity)
            end
        end
    end
end

--=================================================================================
--util
--=================================================================================

function get_unsupported_beacons()
    local unsupported = {}
    for i,v in pairs(global.ki.beacon) do
        if not v.supported then
            table.insert(unsupported,i)
        end
    end
    return unsupported
end

function make_beacon_text(entity)
    entity.surface.create_entity({name="flying-text", position=entity.position, text="CH: "..global.ki.beacon[entity.unit_number].channel, color={r=1, g=1, b=1}})
end

function remove_request_ghost(entity)
    if (entity.ghost_name == "el_ki_beacon_entity") or (entity.ghost_name == "fi_ki_beacon_entity") or (entity.ghost_name == "fu_ki_beacon_entity") then
       if entity.item_requests then 
            entity.item_requests = {}
       end
    end
end

function make_not_operable_icon(entity)
    local sprite = rendering.draw_sprite({sprite="el_ki_not_operable_icon", target=entity, x_scale=0.5, y_scale=0.5, surface=entity.surface, render_layer=200})
    return sprite
end

function el_ki_buffer1_adder() 
    for i,v in pairs(global.ki.channel) do
        if not (i == 0) then
            if global.ki.channel[i].core then
                
                local coreid = global.ki.channel[i].core
                global.ki.core[coreid].totalmodules = {}
                
                
                for x,f in pairs(global.ki.core[coreid].modules) do
                    table.insert(global.ki.core[coreid].totalmodules,f)
                end
                

                if global.ki.channel[i].buffer1 then
                    local buffer1id = global.ki.channel[i].buffer1
                    if global.ki.buffer1[buffer1id].active == true then
                        for x,f in pairs(global.ki.buffer1[buffer1id].modules) do
                            table.insert(global.ki.core[coreid].totalmodules,f)
                        end
                    end
                end

                if global.ki.channel[i].buffer2 then  
                    local buffer2id = global.ki.channel[i].buffer2
                    if global.ki.buffer2[buffer2id].active == true then
                        for x,f in pairs(global.ki.buffer2[buffer2id].modules) do
                            table.insert(global.ki.core[coreid].totalmodules,f)
                        end
                    end
                end

                if game.forces[1] then
                    if game.forces[1].technologies['fu_ki_plus_2_tech'].researched then
                        local moduletable = {}
                        for _,v in pairs(global.ki.core[coreid].totalmodules) do 
                            table.insert(moduletable, v)
                            table.insert(moduletable, v)
                            table.insert(moduletable, v)
                        end
                    
                        global.ki.core[coreid].totalmodules = moduletable
                    elseif game.forces[1].technologies['fu_ki_plus_1_tech'].researched then
                        local moduletable = {}
                        for _,v in pairs(global.ki.core[coreid].totalmodules) do 
                            table.insert(moduletable, v)
                            table.insert(moduletable, v)
                        end
                    
                        global.ki.core[coreid].totalmodules = moduletable
                    end
                end
            end
        end
    end


end

function make_channel(unit)
    if global.ki.channel then
        local max = #global.ki.channel + 1

        global.ki.channel[max] = {} 
        global.ki.channel[max].core = unit
        global.ki.channel[max].buffer1 = nil
        global.ki.channel[max].buffer2 = nil
        global.ki.channel[max].beacons = {}

        return max
    end
end

function count_total_beacons() 
    local count = 0
    for i,v in pairs(global.ki.channel) do
        --if not (i == 0) then
            if #global.ki.channel[i].beacons then
                count = count + #global.ki.channel[i].beacons
            end
        --end
    end
    global.ki.total = count
    return count
end

function is_beacon_supported()
    if global.ki.supported >= count_total_beacons() then
        return true
    end
    return false
end

function add_to_channel(id)
    local channel = global.ki.beacon[id].channel
    table.insert(global.ki.channel[channel].beacons, id)
end

function el_ki_supported_adder()
    if global.ki.supported1 == false then
        if game.forces[1] then
            if game.forces[1].technologies['el_ki_sup_1_tech'].researched then
                global.ki.supported1 = true
                global.ki.supported = global.ki.supported + 150
                gui.update_main()
            end
        end
    end

    if global.ki.supported2 == false then
        if game.forces[1] then
            if game.forces[1].technologies['el_ki_sup_2_tech'].researched then
                global.ki.supported2 = true
                global.ki.supported = global.ki.supported + 250
                gui.update_main()
            end
        end
    end

    if global.ki.supported3 == false then
        if game.forces[1] then
            if game.forces[1].technologies['el_ki_sup_3_tech'].researched then
                global.ki.supported3 = true
                global.ki.supported = global.ki.supported + 500
                gui.update_main()
            end
        end
    end

    if global.ki.supported4 == false then
        if game.forces[1] then
            if game.forces[1].technologies['el_ki_sup_4_tech'].researched then
                global.ki.supported4 = true
                --global.ki.supported = 65535
                global.ki.supported = 10
                gui.update_main()
            end
        end
    end
end

--=================================================================================
--slaves
--=================================================================================

function make_slave_ki_core(entity)
    local pos = entity.position
    local slave = entity.surface.create_entity{
        name = 'el_ki_core_slave_entity',
        position = pos,
        force = entity.force
    }
    slave.destructible = false
    global.ki.core[entity.unit_number]["slave"] = slave
end

function make_slave_ki_buffer1(entity)
    local pos = entity.position
    local slave = entity.surface.create_entity{
        name = 'fi_ki_core_slave_entity',
        position = pos,
        force = entity.force
    }
    slave.destructible = false
    global.ki.buffer1[entity.unit_number]["slave"] = slave
end

function make_container_ki_buffer1(entity)
    local pos = {entity.position.x, entity.position.y + 2}
    local container = entity.surface.create_entity{
        name = 'fi_ki_core_slave_container_entity',
        position = pos,
        force = entity.force
    }
    container.destructible = false
    global.ki.buffer1[entity.unit_number]["container"] = container
end

function make_slave_ki_buffer2(entity)
    local pos = entity.position
    local slave = entity.surface.create_entity{
        name = 'fu_ki_core_slave_entity',
        position = pos,
        force = entity.force
    }
    slave.destructible = false
    global.ki.buffer2[entity.unit_number]["slave"] = slave
end

function make_container_ki_buffer2(entity)
    local pos = {entity.position.x, entity.position.y + 2}
    local container = entity.surface.create_entity{
        name = 'fu_ki_core_slave_container_entity',
        position = pos,
        force = entity.force
    }
    container.destructible = false
    global.ki.buffer2[entity.unit_number]["container"] = container
end

function destroy_slave_ki_core(entity,slave,plyer_index,robot)
    local id = entity.unit_number
    local success = false
    
    if player_index then
        if game.get_player(player_index).character then
            if game.get_player(player_index).character.get_main_inventory() then
                success = slave.mine({inventory=game.get_player(player_index).character.get_main_inventory()})
            end
        end
    end

    if robot then
        if robot.get_inventory(defines.inventory.robot_cargo) then
            success = slave.mine({inventory=robot.get_inventory(defines.inventory.robot_cargo)})
        end
    end

    if not success then
        slave.get_inventory(defines.inventory.chest).clear()
        slave.destroy()
    end
end

function clear_ki_beacon(entity)
    entity.get_module_inventory().clear()
end