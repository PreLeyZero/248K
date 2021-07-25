--local gr_gui = require('scripts/gravitation/gui')
--===================================================================================================================
--TODO
--===================================================================================================================

--init global 
--when builded register
--when destroyed unregister

--build gui when base opend
--start button

--spawn, register energy
--check nth tick for stabilizer and other

--calc output, stable
--write in global

--output power, clear inv

--===================================================================================================================
--init
--===================================================================================================================

function gr_black_hole_init()
    global.black_hole =  {}
    global.black_hole.base = {}
    global.black_hole.energy = {}
    global.black_hole.dirty = false
    global.black_hole.counter = 0

    global.black_hole.gui = {}
    global.black_hole.gui.frame = nil
    global.black_hole.gui.id = nil
end

--===================================================================================================================
--on built
--===================================================================================================================

function gr_black_hole_on_built(e)
    if e['entity'] then
        if e['entity'].name == "gr_black_hole_base_entity" then
           make_black_hole(e['entity'])
           --game.print("make")
        end     
    end

    if e['created_entity'] then
        if e['created_entity'].name == "gr_black_hole_base_entity" then
            make_black_hole(e['created_entity'])
        end
    end
end

--===================================================================================================================
--on remove
--===================================================================================================================

function gr_black_hole_on_remove(e)
    if e["entity"] then
        if e["entity"].name == "gr_black_hole_base_entity" then
            if e["player_index"] then
                destroy_black_hole(e["entity"],e["player_index"],nil)
            elseif e["robot"] then
                destroy_black_hole(e["entity"],nil,e["robot"])
            else 
                destroy_black_hole(e["entity"],nil,nil)
            end
        end
    end
end

--===================================================================================================================
--make
--===================================================================================================================

function make_black_hole(entity)
    register_black_hole_base(entity)

    global.black_hole.dirty = true
    --gr_gui.update_main()
end

function make_black_hole_energy(base_entity)
    local slave = create_black_hole_energy(base_entity)
    register_black_hole_energy(slave)
    link_base_energy(base_entity,slave)
    --game.print("from make: "..slave.unit_number)

    global.black_hole.dirty = true
    --gr_gui.update_main()
end
--===================================================================================================================
--destoy
--===================================================================================================================

function destroy_black_hole(entity,player,robot)
    local slave = nil

    if global.black_hole.base then
        if global.black_hole.base[entity.unit_number] then

            if global.black_hole.base[entity.unit_number].energy then
                if global.black_hole.energy[global.black_hole.base[entity.unit_number].energy] then
                    if global.black_hole.energy[global.black_hole.base[entity.unit_number].energy].entity then
                        slave = global.black_hole.energy[global.black_hole.base[entity.unit_number].energy].entity
                    end
                end
            end

            unregister_black_hole(entity)
            if slave then
                destroy_energy(slave)
            end
        end
    end

    

    global.black_hole.dirty = true
    --gr_gui.update_main()
end

--===================================================================================================================
--register
--===================================================================================================================

function register_black_hole_base(entity)
    local unit = entity.unit_number

    global.black_hole.base[unit] = {}
    global.black_hole.base[unit].entity = entity
    global.black_hole.base[unit].energy = nil

    global.black_hole.base[unit].active = false

    --game.print("register base: "..unit)
end

function register_black_hole_energy(entity)
    local unit = entity.unit_number

    global.black_hole.energy[unit] = {}
    global.black_hole.energy[unit].entity = entity
    global.black_hole.energy[unit].base = nil
    global.black_hole.energy[unit].total = 0
    global.black_hole.energy[unit].stabilizers = 100
    global.black_hole.energy[unit].power_gen = 0
    global.black_hole.energy[unit].matter_consumption = 0
    global.black_hole.energy[unit].stable = 0

    --game.print("from erngy make: "..unit)
end

function link_base_energy(base_entity,energy)
    local unit_base = base_entity.unit_number
    local unit_energy = energy.unit_number
    if global.black_hole.base[unit_base] then
        if global.black_hole.energy[unit_energy] then
            global.black_hole.base[unit_base].energy = unit_energy
            global.black_hole.energy[unit_energy].base = unit_base
            global.black_hole.base[unit_base].active = true
        end
    end
end
--===================================================================================================================
--unregister
--===================================================================================================================

function unregister_black_hole(entity)
    local unit = entity.unit_number
    if global.black_hole.base[unit].energy then
        --game.print("unregister base.energy: "..global.black_hole.base[unit].energy)
        unregister_black_hole_energy(nil,global.black_hole.base[unit].energy)
        unregister_black_hole_base(entity,nil)
    else
        --game.print("2")
        unregister_black_hole_base(entity,nil)
    end
end

function unregister_black_hole_base(entity,unitin)
    local unit = nil
    if entity then
        unit = entity.unit_number
    else
        unit = unitin
    end
    global.black_hole.base[unit] = nil

    --game.print(unit)

    if global.black_hole.energy then
        for i,v in pairs(global.black_hole.energy) do 
            if global.black_hole.energy[i].base == unit then
                global.black_hole.energy[i].base = nil
            end
        end
    end
end

function unregister_black_hole_energy(entity,unitin)
    local unit = nil
    if entity then
        unit = entity.unit_number
        --game.print("entity")
    else
        unit = unitin
        --game.print("unitin")
    end
    global.black_hole.energy[unit] = nil

    if global.black_hole.base then
        for i,v in pairs(global.black_hole.base) do
            if global.black_hole.base[i].energy == unit then
                global.black_hole.base[i].energy = nil
                global.black_hole.base[i].active = false
            end
        end
    end
end

--===================================================================================================================
--slaves
--===================================================================================================================

function create_black_hole_energy(base_entity)
    local pos = base_entity.position
    local slave = base_entity.surface.create_entity{
        name = 'gr_black_hole_energy_entity',
        position = pos,
        force = base_entity.force
    }
    slave.destructible = false
    return slave
end

function destroy_energy(entity)
    entity.destroy()
end


--===================================================================================================================
--update
--===================================================================================================================

function black_hole_base_update()
    if global.black_hole then
        if global.black_hole.base then
            for i,v in pairs(global.black_hole.base) do 
                if global.black_hole.base[i].entity then
                    if global.black_hole.base[i].entity.valid then
                        if global.black_hole.base[i].energy then
                            local energy = global.black_hole.base[i].energy
                            local entity = global.black_hole.base[i].entity
                            local inv = entity.get_inventory(defines.inventory.chest)
                            
                            local total = global.black_hole.energy[energy].total
                            local stable = global.black_hole.energy[energy].stable
                            local power_gen, matter_consumption = calc_black_hole_stats(stable)

                            
                            local new_matter = inv.get_item_count() - inv.get_item_count("gr_materials_stabilizer_item")
                            local new_stabilizer = inv.get_item_count("gr_materials_stabilizer_item")

                            stable = stable - 1
                            if total then
                                if stabilizer then
                                    stable = stable + new_stabilizer
                                end
                            end
                            if stable >= 100 then
                                stable = 100
                            end

                            total = total - matter_consumption + new_matter

                            global.black_hole.energy[energy].power_gen = power_gen
                            global.black_hole.energy[energy].matter_consumption = matter_consumption
                            global.black_hole.energy[energy].stable = stable
                            global.black_hole.energy[energy].total = total

                            --game.print(stable.." "..power_gen.." "..total)

                            black_hole_make_energy(energy, power_gen)

                            inv.clear()

                            if (total <= 0) or (stable <= 0) then
                                global.black_hole.counter = global.black_hole.counter + 1
                                if global.black_hole.counter == 10 then
                                    local energy_entity = global.black_hole.energy[energy].entity
                                    unregister_black_hole_energy(energy_entity)
                                    energy_entity.destroy()
                                    global.black_hole.counter = 0
                                end
                            end
                            global.black_hole.dirty = true
                        end
                    end
                end
            end
        end
    end
end

--===================================================================================================================
--util
--===================================================================================================================

function can_make_black_hole_energy(entity)
    if entity.valid then
        inv = entity.get_inventory(defines.inventory.chest)
        total = inv.get_item_count() - inv.get_item_count("gr_materials_stabilizer_item")
        stabilizer = inv.get_item_count("gr_materials_stabilizer_item")
        if (stabilizer >= 100) and (total >= 1000) then
            return true
        else
            return false
        end
    end
end

function calc_black_hole_stats(stable)
    -- power_gen: Power gen/s in MW
    -- matter_consumption: matter consumed/s
    -- stable: max 100, each stabilizer put in will add 1 stable regardless
    -- every 10 ticks - 1

    local matter_consumption_rate = black_hole_stable_function(stable)
    local power_gen = black_hole_energy_function(matter_consumption_rate)
    return power_gen, matter_consumption_rate
end

function black_hole_stable_function(stable)
    --stable from 0 to 100
    if stable <= 0 then
        return 0
    end
    return stable
end

function black_hole_energy_function(matter_consumption_rate)
    if matter_consumption_rate <= 0 then
        return 0
    end
    return (matter_consumption_rate * matter_consumption_rate * matter_consumption_rate) * 64 * 1000 * 0.3
end

function black_hole_make_energy(energy, power_gen)
    if global.black_hole.energy[energy].entity then
        if global.black_hole.energy[energy].entity.valid then
            --game.print("spawn energy: "..power_gen.."W")
            local entity = global.black_hole.energy[energy].entity
            entity.power_production = power_gen
        end
    end
end

--TODO

--k2 fix
--KI tech description