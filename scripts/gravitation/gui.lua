require('scripts/gravitation/gr_black_hole_script')
local mod_gui = require("mod-gui")
local gr_gui = {}

function gr_gui.add_black_hole_gui(e,update)
    local player = nil
    local id = nil
    local active = true
    local total = nil
    local stabilizer = nil

    local power_gen = 0
    local matter_consumption = 0
    local stable = 0
    local totalmatter = 0

    if update then
        player = e
        id = global.black_hole.gui.id
        if global.black_hole.base[id] then
            active = global.black_hole.base[id].active
            local entity = global.black_hole.base[id].entity
            local inv = entity.get_inventory(defines.inventory.chest)
            total = inv.get_item_count() - inv.get_item_count("gr_materials_stabilizer_item")
            stabilizer = inv.get_item_count("gr_materials_stabilizer_item")

            if global.black_hole.base[id].energy then
                local energy = global.black_hole.base[id].energy
                power_gen = global.black_hole.energy[energy].power_gen 
                matter_consumption = global.black_hole.energy[energy].matter_consumption
                stable = global.black_hole.energy[energy].stable 
                totalmatter = global.black_hole.energy[energy].total
            end
        end
    else
        player = game.get_player(e["player_index"])
        id = e["entity"].unit_number
        if global.black_hole.base[id] then
            active = global.black_hole.base[id].active
            local entity = global.black_hole.base[id].entity
            local inv = entity.get_inventory(defines.inventory.chest)
            total = inv.get_item_count() - inv.get_item_count("gr_materials_stabilizer_item")
            stabilizer = inv.get_item_count("gr_materials_stabilizer_item")

            if global.black_hole.base[id].energy then
                local energy = global.black_hole.base[id].energy
                power_gen = global.black_hole.energy[energy].power_gen 
                matter_consumption = global.black_hole.energy[energy].matter_consumption
                stable = global.black_hole.energy[energy].stable
                totalmatter = global.black_hole.energy[energy].total
            end
        end
    end

    --====================================
    --destroy and clear
    --====================================    

    if player.gui.left["main248kblackholeframe"] then
        player.gui.left["main248kblackholeframe"].destroy()
        global.black_hole.gui = {}
        return
    end

    if global.black_hole then
        if global.black_hole.base then
            if not global.black_hole.base[id] then
                if player.gui.left["main248kblackholeframe"] then
                    player.gui.left["main248kblackholeframe"].destroy()
                    global.black_hole.gui = {}
                    return
                else
                    return
                end
            end
        end
    end
    
    local main248kblackholeframe = player.gui.left.add({
        type = "frame",
        name = "main248kblackholeframe",
        caption = "Black hole generator: "
    })
    main248kblackholeframe.style.minimal_height = 10
    main248kblackholeframe.style.minimal_width = 10
    main248kblackholeframe.style.maximal_width = 320

    local main248kblackholecontentframe = main248kblackholeframe.add({
        type = "frame",
        name = "main248kblackholecontentframe",
        direction = "vertical",
        style = "inside_shallow_frame_with_padding"
    })

    local main248kblackholeonframe = main248kblackholecontentframe.add({
        type = "frame",
        name = "main248kblackholeonframe",
        caption = "Status ",
        direction = "horizontal",
        style = "bordered_frame"
    })

    
    --local main248kblackholeontextfield = main248kblackholeonframe.add({
    --    type = "textfield",
    --    name = "main248kblackholeontextfield",
    --    numeric = "true",
    --    text = channel 
    --})
    --main248kblackholeontextfield.style.maximal_width = 30
    
    local main248kblackholeonbutton = nil
    if active == false then
        main248kblackholeonbutton = main248kblackholeonframe.add({
            type = "button",
            name = "main248kblackholeonbutton",
            caption = "Start",
            style = "confirm_button"
        })
    else
        main248kblackholeonbutton = main248kblackholeonframe.add({
            type = "button",
            name = "main248kblackholeonbutton",
            caption = "Stop",
            style = "red_confirm_button"
        })
    end
    
    local main248kblackholestabilizerframe = main248kblackholecontentframe.add({
        type = "frame",
        name = "main248kblackholestabilizerframe",
        caption = "Core stabilizers: ",
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kblackholestabilizerbar = main248kblackholestabilizerframe.add({
        type = "progressbar",
        name = "main248kblackholestatstabilizerbar",
        --caption = "Core stabilizers: ",
        value =  stabilizer/100,
        direction = "horizontal",
        style = "electric_satisfaction_in_description_progressbar"
    })

    local main248kblackholetotalframe = main248kblackholecontentframe.add({
        type = "frame",
        name = "main248kblackholetotalframe",
        caption = "Consumable matter: ",
        direction = "horizontal",
        style = "bordered_frame"
    })
    local main248kblackholetotalbar = nil
    if active == false then
        main248kblackholetotalbar = main248kblackholetotalframe.add({
            type = "progressbar",
            name = "main248kblackholetotalbar",
            --caption = "Consumable matter: ", 
            value =  total/1000,
            direction = "horizontal",
            style = "electric_satisfaction_in_description_progressbar"
        })
    else
        main248kblackholetotalbar = main248kblackholetotalframe.add({
            type = "progressbar",
            name = "main248kblackholetotalbar",
            --caption = "Consumable matter: ", 
            value =  totalmatter/10000,
            direction = "horizontal",
            style = "electric_satisfaction_in_description_progressbar"
        })
    end

    local main248kblackholestableframe = main248kblackholecontentframe.add({
        type = "frame",
        name = "main248kblackholestableframe",
        caption = "Reactor stability: ",
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kblackholestablebar = main248kblackholestableframe.add({
        type = "progressbar",
        name = "main248kblackholestablebar",
        --caption = "Consumable matter: ", 
        value =  stable/100,
        direction = "horizontal",
        style = "electric_satisfaction_statistics_progressbar"
    })

    local main248kblackholeconsumptionframe = main248kblackholecontentframe.add({
        type = "frame",
        name = "main248kblackholeconsumptionframe",
        caption = "Matter consumption: ",
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kblackholeconsumptionbar = main248kblackholeconsumptionframe.add({
        type = "progressbar",
        name = "main248kblackholeconsumptionbar",
        --caption = "Consumable matter: ", 
        value =  matter_consumption/100,
        direction = "horizontal",
        style = "production_progressbar"
    })

    local main248kblackholepowerframe = main248kblackholecontentframe.add({
        type = "frame",
        name = "main248kblackholepowerframe",
        caption = "Power gen. rate: ",
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kblackholepowerbar = main248kblackholepowerframe.add({
        type = "progressbar",
        name = "main248kblackholepowerbar",
        --caption = "Consumable matter: ", 
        value =  power_gen/19000000000,
        direction = "horizontal",
        style = "production_progressbar"
    })

    global.black_hole.gui.frame = main248kblackholeframe
    global.black_hole.gui.id = id
    global.black_hole.gui.active = active
end

--=================================================================================
--on click
--=================================================================================

function gr_gui.on_change(e)
    local player = game.get_player(e["player_index"])
    if e["element"] then
        if e["element"].valid then
            local element = e["element"].name

            if element == "main248kblackholeonbutton" then
                if global.black_hole then
                    if global.black_hole.gui then
                        if not global.black_hole.gui.active then
                            if global.black_hole.gui.id then
                                local id = global.black_hole.gui.id
                            
                                if global.black_hole.base then
                                    if global.black_hole.base[id] then
                                        if global.black_hole.base[id].entity then
                                            if can_make_black_hole_energy(global.black_hole.base[id].entity) then
                                                make_black_hole_energy(global.black_hole.base[id].entity)
                                                gr_gui.update_main()
                                                return
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if global.black_hole.gui.active then
                            if global.black_hole.gui.id then
                                local id = global.black_hole.gui.id
                            
                                if global.black_hole.base then
                                    if global.black_hole.base[id] then
                                        if global.black_hole.base[id].entity then
                                            if global.black_hole.base[id].active then
                                                if global.black_hole.base[id].energy then
                                                    local energy_unit = global.black_hole.base[id].energy
                                                    local energy_entity = global.black_hole.energy[energy_unit].entity
                                                    unregister_black_hole_energy(energy_entity)
                                                    energy_entity.destroy()
                                                    global.black_hole.counter = 0
                                                    gr_gui.update_main()
                                                    return
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

--=================================================================================
--update
--=================================================================================

function gr_gui.update_main()
    for i,v in pairs(game.players) do
        if game.players[i].gui.left["main248kblackholeframe"] then
            game.players[i].gui.left["main248kblackholeframe"].destroy()
            gr_gui.add_black_hole_gui(game.players[i],true)
        end
    end 
end


return gr_gui