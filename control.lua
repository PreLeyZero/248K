require('scripts/electronic/el_ki_script')
require('scripts/bk_main')
require('scripts/gravitation/gr_black_hole_script')
local gui = require('scripts/gui')
local gr_gui = require('scripts/gravitation/gui')

--informatron
require('scripts/informatron/inf_main')

--===================================================================================================================

--init

script.on_init(
    function(e)
        el_ki_init(e)
        gr_black_hole_init(e)

        if game.active_mods["Booktorio"] then
            registerThread_248k()
        end

        for i,v in pairs(game.players) do 
            gui.add_top_gui(game.players[i])
        end
    end
)

--===================================================================================================================

--on player creation

script.on_event({
    defines.events.on_player_created
    },
    function(e)
        gui.add_top_gui(game.get_player(e["player_index"]))   
    end 
)

--===================================================================================================================

--on built

script.on_event({
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity,
    defines.events.script_raised_built,
    defines.events.script_raised_revive,
    --defines.events.on_entity_cloned
    },
    function(e)
        el_ki_on_built(e)
        gr_black_hole_on_built(e)
    end
)

--===================================================================================================================

--on remove

script.on_event({
    defines.events.on_entity_died,
	defines.events.on_pre_player_mined_item,
	defines.events.on_robot_pre_mined,
	defines.events.script_raised_destroy
    },
    function(e)
        el_ki_on_remove(e)
        gr_black_hole_on_remove(e)
    end
)

--===================================================================================================================

--on tick

script.on_nth_tick(60, 
    function(e)
    el_ki_buffer1_working()
    el_ki_buffer1_update()

    el_ki_buffer2_working()
    el_ki_buffer2_update()

    el_ki_core_working()
    el_ki_core_update()

    el_ki_supported_adder()

    if global.ki.dirty then
        --game.print("f")
        el_ki_beacon_update()
        gui.update_main()
        global.ki.dirty = false
    end

    if global.black_hole.dirty then
        gr_gui.update_main()
        global.black_hole.dirty = false
    end
    gr_gui.update_main()
    end

)

script.on_nth_tick(30,
    function(e)
        black_hole_base_update()
    end
)
--===================================================================================================================

script.on_event({
    defines.events.on_gui_click,
    defines.events.on_gui_text_changed
    },
    function(e)
        gui.on_change(e)
        gr_gui.on_change(e)
    end
)

script.on_event({
    defines.events.on_player_selected_area
    },
    gui.on_selected
)

script.on_event({
    defines.events.on_gui_opened,
    defines.events.on_gui_closed
    },
    function(e)
        if e["entity"] then
            if e["entity"].name == "el_ki_core_entity" then
                gui.add_core_gui(e,false)
            end

            if e["entity"].name == "fi_ki_core_entity" then
                gui.add_buffer1_gui(e,false)
            end

            if e["entity"].name == "fu_ki_core_entity" then
                gui.add_buffer2_gui(e,false)
            end

            if e["entity"].name == "gr_black_hole_base_entity" then
                gr_gui.add_black_hole_gui(e,false)
            end
        end
    end
)

--===================================================================================================================

--config change

script.on_configuration_changed(
    function()
        if game.active_mods["Booktorio"] then
            registerThread_248k()
        end
    end
)

