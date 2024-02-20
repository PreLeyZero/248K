local mod_gui = require("mod-gui")
local gui = {}


--=================================================================================
--add
--=================================================================================

function gui.add_top_gui(player)
    local button_flow = mod_gui.get_button_flow(player)
    if not button_flow.top248kbutton then
        local button = button_flow.add({
            type = "sprite-button",
            name = "top248kbutton",
            sprite = "sprite_248kmainbutton",
            style = mod_gui.button_style
        })
    end
end

function gui.add_core_gui(e,update)
    local player = nil
    local id = nil

    if update then
        player = e
        id = global.ki.gui.core.id
    else
        player = game.get_player(e["player_index"])
        id = e["entity"].unit_number
    end

    --====================================
    --destroy and clear
    --====================================

    if player.gui.left["main248kcoreframe"] then
        player.gui.left["main248kcoreframe"].destroy()
        global.ki.gui.core = {}
        return
    end

    if global.ki then
        if global.ki.core then
            if not global.ki.core[id] then
                if player.gui.left["main248kcoreframe"] then
                    player.gui.left["main248kcoreframe"].destroy()
                    global.ki.gui.core = {}
                    return
                else
                    return
                end
            end
        end
    end


    local channel = global.ki.core[id].channel
    local linked = #global.ki.channel[channel].beacons

    local main248kcoreframe = player.gui.left.add({
        type = "frame",
        name = "main248kcoreframe",
        caption = {"gui.ki_1_core"}
    })
    main248kcoreframe.style.minimal_height = 10
    main248kcoreframe.style.minimal_width = 10
    main248kcoreframe.style.maximal_width = 320

    local main248kcorecontentframe = main248kcoreframe.add({
        type = "frame",
        name = "main248kcorecontentframe",
        direction = "vertical",
        style = "inside_shallow_frame_with_padding"
    })

    local main248kcorechannelframe = main248kcorecontentframe.add({
        type = "frame",
        name = "main248kcorechannelframe",
        caption = {"gui.core channel"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kcorechannelslider = main248kcorechannelframe.add({
        type = "slider",
        name = "main248kcorechannelslider",
        value = channel,
        minimun_value = 1,
        maximum_value = #global.ki.channel + 1,
        style = "notched_slider"
    })

    local main248kcorechanneltextfield = main248kcorechannelframe.add({
        type = "textfield",
        name = "main248kcorechanneltextfield",
        numeric = "true",
        text = channel
    })
    main248kcorechanneltextfield.style.maximal_width = 30

    local main248kcorechannelbutton = main248kcorechannelframe.add({
        type = "button",
        name = "main248kcorechannelbutton",
        caption = {"gui.Apply"},
        style = mod_gui.button_style
    })

    local main248klinkedframe = main248kcorecontentframe.add({
        type = "frame",
        name = "main248kkinkedframe",
        caption = {"gui.linked beacons"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248klinkedlabel = main248klinkedframe.add({
        type = "label",
        name = "main248klinkedlabel",
        caption = linked
    })

    global.ki.gui.core.frame = main248kcoreframe
    global.ki.gui.core.id = id
end

function gui.add_main_gui(player)
    if player.gui.left["main248kframe"] then
        player.gui.left["main248kframe"].destroy()
        global.ki.gui.main = {}
    end

    local main248kframe = player.gui.left.add({
        type = "frame",
        name = "main248kframe",
        caption = {"gui.248k_ki_overview"}
    })
    main248kframe.style.minimal_height = 10
    main248kframe.style.minimal_width = 10
    main248kframe.style.maximal_width = 320

    local main248kcontentframe = main248kframe.add({
        type = "frame",
        name = "main248kcontentframe",
        direction = "vertical",
        style = "inside_shallow_frame_with_padding"
    })

    local main248kprefchannelframe = main248kcontentframe.add({
        type = "frame",
        name = "main248kprefchannelframe",
        caption = {"gui.standard_channel"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kprefchannelslider = main248kprefchannelframe.add({
        type = "slider",
        name = "main248kprefchannelslider",
        value = global.ki.standardchannel,
        minimun_value = 0,
        maximum_value = #global.ki.channel + 1,
        style = "notched_slider"
    })

    local main248kprefchanneltextfield = main248kprefchannelframe.add({
        type = "textfield",
        name = "main248kprefchanneltextfield",
        numeric = "true",
        text = global.ki.standardchannel
    })
    main248kprefchanneltextfield.style.maximal_width = 30

    local main248kprefchannelbutton = main248kprefchannelframe.add({
        type = "button",
        name = "main248kprefchannelbutton",
        caption = {"gui.Apply"},
        style = mod_gui.button_style
    })

    local main248ksupportedframe = main248kcontentframe.add({
        type = "frame",
        name = "main248ksupportedframe",
        caption = {"gui.max_supported_beacons"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248ksupportedlabel = main248ksupportedframe.add({
        type = "label",
        name = "main248ksupportedlabel",
        caption = global.ki.supported
    })

    local main248ktotalframe = main248kcontentframe.add({
        type = "frame",
        name = "main248ktotalframe",
        caption = {"gui.total beacons"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248ktotallabel = main248ktotalframe.add({
        type = "label",
        name = "main248ktotallabel",
        caption = global.ki.total
    })

    local main248kselectchannelframe = main248kcontentframe.add({
        type = "frame",
        name = "main248kselectchannelframe",
        caption = {"gui.change beacon channel"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kselectchannelslider = main248kselectchannelframe.add({
        type = "slider",
        name = "main248kselectchannelslider",
        value = global.ki.selectchannel,
        minimun_value = 0,
        maximum_value = #global.ki.channel + 1,
        style = "notched_slider"
    })

    local main248kselectchanneltextfield = main248kselectchannelframe.add({
        type = "textfield",
        name = "main248kselectchanneltextfield",
        numeric = "true",
        text = global.ki.selectchannel
    })
    main248kselectchanneltextfield.style.maximal_width = 30

    local main248kselectchannelbutton = main248kselectchannelframe.add({
        type = "button",
        name = "main248kselectchannelbutton",
        caption = {"gui.Apply"},
        style = mod_gui.button_style
    })

    global.ki.gui.main.frame = main248kframe
end

function gui.add_buffer1_gui(e,update)
    local player = nil
    local id = nil

    if update then
        player = e
        id = global.ki.gui.buffer1.id
    else
        player = game.get_player(e["player_index"])
        id = e["entity"].unit_number
    end

    --====================================
    --destroy and clear
    --====================================

    if player.gui.left["main248kbuffer1frame"] then
        player.gui.left["main248kbuffer1frame"].destroy()
        global.ki.gui.buffer1 = {}
        return
    end

    if global.ki then
        if global.ki.buffer1 then
            if not global.ki.buffer1[id] then
                if player.gui.left["main248kbuffer1frame"] then
                    player.gui.left["main248kbuffer1frame"].destroy()
                    global.ki.gui.buffer1 = {}
                    return
                else
                    return
                end
            end
        end
    end

    local channel = global.ki.buffer1[id].channel

    local main248kbuffer1frame = player.gui.left.add({
        type = "frame",
        name = "main248kbuffer1frame",
        caption = {"gui.ki_2_amplifier"}
    })
    main248kbuffer1frame.style.minimal_height = 10
    main248kbuffer1frame.style.minimal_width = 10
    main248kbuffer1frame.style.maximal_width = 320

    local main248kbuffer1contentframe = main248kbuffer1frame.add({
        type = "frame",
        name = "main248kbuffer1contentframe",
        direction = "vertical",
        style = "inside_shallow_frame_with_padding"
    })

    local main248kbuffer1channelframe = main248kbuffer1contentframe.add({
        type = "frame",
        name = "main248kbuffer1channelframe",
        caption = {"gui.amplifier channel"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kbuffer1channelslider = main248kbuffer1channelframe.add({
        type = "slider",
        name = "main248kbuffer1channelslider",
        value = channel,
        minimun_value = 1,
        maximum_value = #global.ki.channel + 1,
        style = "notched_slider"
    })

    local main248kbuffer1channeltextfield = main248kbuffer1channelframe.add({
        type = "textfield",
        name = "main248kbuffer1channeltextfield",
        numeric = "true",
        text = channel
    })
    main248kbuffer1channeltextfield.style.maximal_width = 30

    local main248kbuffer1channelbutton = main248kbuffer1channelframe.add({
        type = "button",
        name = "main248kbuffer1channelbutton",
        caption = {"gui.Apply"},
        style = mod_gui.button_style
    })

    global.ki.gui.buffer1.frame = main248kbuffer1frame
    global.ki.gui.buffer1.id = id
end

function gui.add_buffer2_gui(e,update)
    local player = nil
    local id = nil

    if update then
        player = e
        id = global.ki.gui.buffer2.id
    else
        player = game.get_player(e["player_index"])
        id = e["entity"].unit_number
    end

    --====================================
    --destroy and clear
    --====================================

    if player.gui.left["main248kbuffer2frame"] then
        player.gui.left["main248kbuffer2frame"].destroy()
        global.ki.gui.buffer2 = {}
        return
    end

    if global.ki then
        if global.ki.buffer2 then
            if not global.ki.buffer2[id] then
                if player.gui.left["main248kbuffer2frame"] then
                    player.gui.left["main248kbuffer2frame"].destroy()
                    global.ki.gui.buffer2 = {}
                    return
                else
                    return
                end
            end
        end
    end

    local channel = global.ki.buffer2[id].channel

    local main248kbuffer2frame = player.gui.left.add({
        type = "frame",
        name = "main248kbuffer2frame",
        caption = {"gui.ki_3_amplifier"}
    })
    main248kbuffer2frame.style.minimal_height = 10
    main248kbuffer2frame.style.minimal_width = 10
    main248kbuffer2frame.style.maximal_width = 320

    local main248kbuffer2contentframe = main248kbuffer2frame.add({
        type = "frame",
        name = "main248kbuffer2contentframe",
        direction = "vertical",
        style = "inside_shallow_frame_with_padding"
    })

    local main248kbuffer2channelframe = main248kbuffer2contentframe.add({
        type = "frame",
        name = "main248kbuffer2channelframe",
        caption = {"gui.amplifier channel"},
        direction = "horizontal",
        style = "bordered_frame"
    })

    local main248kbuffer2channelslider = main248kbuffer2channelframe.add({
        type = "slider",
        name = "main248kbuffer2channelslider",
        value = channel,
        minimun_value = 1,
        maximum_value = #global.ki.channel + 1,
        style = "notched_slider"
    })

    local main248kbuffer2channeltextfield = main248kbuffer2channelframe.add({
        type = "textfield",
        name = "main248kbuffer2channeltextfield",
        numeric = "true",
        text = channel
    })
    main248kbuffer2channeltextfield.style.maximal_width = 30

    local main248kbuffer2channelbutton = main248kbuffer2channelframe.add({
        type = "button",
        name = "main248kbuffer2channelbutton",
        caption = {"gui.Apply"},
        style = mod_gui.button_style
    })

    global.ki.gui.buffer2.frame = main248kbuffer2frame
    global.ki.gui.buffer2.id = id
end

--=================================================================================
--on click
--=================================================================================

function gui.on_change(e)
    local player = game.get_player(e["player_index"])

    if e["element"] then
        if e["element"].valid then
            local element = e["element"].name

            if element == "top248kbutton" then
                if player.gui.left["main248kframe"] then
                    player.gui.left["main248kframe"].destroy()
                else
                    gui.add_main_gui(player)
                end
            end

            if element == "main248kselectchannelbutton" then
                if player.cursor_stack.can_set_stack({name = "el_ki_selection_tool"}) then
                    player.cursor_stack.set_stack({name = "el_ki_selection_tool"})

                    if global.ki.gui.main then
                        if global.ki.gui.main.frame then
                            local main248kframe = global.ki.gui.main.frame -- this global value(gui element) need to be defined per player
                            --Quick and dirty remedy for crash that can cause in multiplay
                            if not (
                                main248kframe.valid
                                and main248kframe.main248kcontentframe.valid
                                and main248kframe.main248kcontentframe.main248kselectchannelframe.valid
                                and main248kframe.main248kcontentframe.main248kselectchannelframe.main248kselectchannelslider.valid
                            ) then
                                game.print("248k:gui_error")
                                return
                            end
                            if not (
                                main248kframe.main248kcontentframe.main248kselectchannelframe.valid
                                and main248kframe.main248kcontentframe.main248kselectchannelframe.main248kselectchanneltextfield.valid
                            ) then
                                game.print("248k:gui_error")
                                return
                            end
                            --remedy end
                            local slider_channel = main248kframe.main248kcontentframe.main248kselectchannelframe.main248kselectchannelslider.slider_value
                            local text_channel = tonumber(main248kframe.main248kcontentframe.main248kselectchannelframe.main248kselectchanneltextfield.text)

                            change_valid_selectchannel(slider_channel,text_channel)
                        end
                    end

                end
            end

            if element == "main248kcorechannelbutton" then
                if global.ki.gui.core then
                    if (global.ki.gui.core.frame and global.ki.gui.core.id) then

                        local main248kcoreframe = global.ki.gui.core.frame
                        local id = global.ki.gui.core.id -- this global value(gui element) need to be defined per player
                        --Quick and dirty remedy for crash that can cause in multiplay
                        if not (
                            main248kcoreframe.valid
                            and main248kcoreframe.main248kcorecontentframe.valid
                            and main248kcoreframe.main248kcorecontentframe.main248kcorechannelframe.valid
                            and main248kcoreframe.main248kcorecontentframe.main248kcorechannelframe.main248kcorechannelslider.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        if not (main248kcoreframe.main248kcorecontentframe.main248kcorechannelframe.main248kcorechanneltextfield.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        --remedy end
                        local slider_channel = main248kcoreframe.main248kcorecontentframe.main248kcorechannelframe.main248kcorechannelslider.slider_value
                        local text_channel = tonumber(main248kcoreframe.main248kcorecontentframe.main248kcorechannelframe.main248kcorechanneltextfield.text)

                        change_valid_channel(slider_channel,text_channel,id)
                    end
                end
            end

            if element == "main248kbuffer1channelbutton" then
                if global.ki.gui.buffer1 then
                    if (global.ki.gui.buffer1.frame and global.ki.gui.buffer1.id) then

                        local main248kbuffer1frame = global.ki.gui.buffer1.frame
                        local id = global.ki.gui.buffer1.id -- this global value(gui element) need to be defined per player
                        --Quick and dirty remedy for crash that can cause in multiplay
                        if not (
                            main248kbuffer1frame.valid
                            and main248kbuffer1frame.main248kbuffer1contentframe.valid
                            and main248kbuffer1frame.main248kbuffer1contentframe.main248kbuffer1channelframe.valid
                            and main248kbuffer1frame.main248kbuffer1contentframe.main248kbuffer1channelframe.main248kbuffer1channelslider.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        if not (main248kbuffer1frame.main248kbuffer1contentframe.main248kbuffer1channelframe.main248kbuffer1channeltextfield.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        --remedy end
                        local slider_channel = main248kbuffer1frame.main248kbuffer1contentframe.main248kbuffer1channelframe.main248kbuffer1channelslider.slider_value
                        local text_channel = tonumber(main248kbuffer1frame.main248kbuffer1contentframe.main248kbuffer1channelframe.main248kbuffer1channeltextfield.text)

                        change_valid_bufferchannel(slider_channel,text_channel,id,"buffer1")
                    end
                end
            end

            if element == "main248kbuffer2channelbutton" then
                if global.ki.gui.buffer2 then
                    if (global.ki.gui.buffer2.frame and global.ki.gui.buffer2.id) then

                        local main248kbuffer2frame = global.ki.gui.buffer2.frame
                        local id = global.ki.gui.buffer2.id -- this global value(gui element) need to be defined per player
                        --Quick and dirty remedy for crash that can cause in multiplay
                        if not (
                            main248kbuffer2frame.valid
                            and main248kbuffer2frame.main248kbuffer2contentframe.valid
                            and main248kbuffer2frame.main248kbuffer2contentframe.main248kbuffer2channelframe.valid
                            and main248kbuffer2frame.main248kbuffer2contentframe.main248kbuffer2channelframe.main248kbuffer2channelslider.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        if not (main248kbuffer2frame.main248kbuffer2contentframe.main248kbuffer2channelframe.main248kbuffer2channeltextfield.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        --remedy end
                        local slider_channel = main248kbuffer2frame.main248kbuffer2contentframe.main248kbuffer2channelframe.main248kbuffer2channelslider.slider_value
                        local text_channel = tonumber(main248kbuffer2frame.main248kbuffer2contentframe.main248kbuffer2channelframe.main248kbuffer2channeltextfield.text)

                        change_valid_bufferchannel(slider_channel,text_channel,id,"buffer2")
                    end
                end
            end

            if element == "main248kprefchannelbutton" then
                if global.ki.gui.main then
                    if global.ki.gui.main.frame then
                        local main248kframe = global.ki.gui.main.frame -- this global value(gui element) need to be defined per player
                        --Quick and dirty remedy for crash that can cause in multiplay
                        if not (
                            main248kframe.valid
                            and main248kframe.main248kcontentframe.valid
                            and main248kframe.main248kcontentframe.main248kprefchannelframe.valid
                            and main248kframe.main248kcontentframe.main248kprefchannelframe.main248kprefchannelslider.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        if not (main248kframe.main248kcontentframe.main248kprefchannelframe.main248kprefchanneltextfield.valid
                        ) then
                            game.print("248k:gui_error")
                            return
                        end
                        --remedy end
                        local slider_channel = main248kframe.main248kcontentframe.main248kprefchannelframe.main248kprefchannelslider.slider_value
                        local text_channel = tonumber(main248kframe.main248kcontentframe.main248kprefchannelframe.main248kprefchanneltextfield.text)

                        change_valid_standardchannel(slider_channel,text_channel)
                    end
                end
            end

            if element == "main248kcorechannelslider" then
                gui.update_main()
            end

            if element == "main248kcorechanneltextfield" then
                gui.update_main()
            end
        end
    end

    local parent_gui = e.element.tags.parent_gui
    local action = e.element.tags.action
    if parent_gui == "248k_migration_notice" then
        if action == "close-gui" then
            player.gui.screen["248k_migration_notice"].destroy()
        end
    end

end

function gui.on_selected(e)
    if e["item"] then
        if e["player_index"] then
            local player = game.get_player(e["player_index"])
            if player.cursor_stack then
                if player.cursor_stack.valid_for_read then
                    if player.cursor_stack.name == "el_ki_selection_tool" then

                        for i,v in pairs(e["entities"]) do
                            if (v.name == 'el_ki_beacon_entity') or (v.name == 'fi_ki_beacon_entity') or (v.name == 'fu_ki_beacon_entity') then
                                local id = v.unit_number
                                local oldchannel = global.ki.beacon[id].channel

                                for x,f in pairs(global.ki.channel[oldchannel].beacons) do
                                    if f == id then
                                        table.remove(global.ki.channel[oldchannel].beacons, x)
                                        break
                                    end
                                end

                                global.ki.beacon[id].channel = global.ki.selectchannel
                                table.insert(global.ki.channel[global.ki.selectchannel].beacons, id)

                                player.create_local_flying_text({text="CH "..tostring(global.ki.selectchannel), position=v.position})
                            end
                        end

                        global.ki.dirty = true
                        gui.update_main()
                    end
                end
            end
        end
    end
end
--=================================================================================
--update
--=================================================================================

function gui.update_main()
    for i,v in pairs(game.players) do
        if game.players[i].gui.left["main248kframe"] then
            game.players[i].gui.left["main248kframe"].destroy()
            gui.add_main_gui(game.players[i])
        end

        if game.players[i].gui.left["main248kcoreframe"] then
            game.players[i].gui.left["main248kcoreframe"].destroy()
            gui.add_core_gui(game.players[i],true)
        end

        if game.players[i].gui.left["main248kbuffer1frame"] then
            game.players[i].gui.left["main248kbuffer1frame"].destroy()
            gui.add_buffer1_gui(game.players[i],true)
        end

        if game.players[i].gui.left["main248kbuffer2frame"] then
            game.players[i].gui.left["main248kbuffer2frame"].destroy()
            gui.add_buffer2_gui(game.players[i],true)
        end
    end
end

--=================================================================================
--util
--=================================================================================

function change_valid_channel(slider_channel,text_channel,id)

    if slider_channel == text_channel then
        if is_valid_channel(slider_channel,"core") then
            change_channel(id,slider_channel,"core")
        end
        gui.update_main()
        return
    end

    if not (slider_channel ==  global.ki.core[id].channel) then
        if is_valid_channel(slider_channel,"core") then
            change_channel(id,slider_channel,"core")
        end
        gui.update_main()
        return
    end

    if not (text_channel ==  global.ki.core[id].channel) then
        if is_valid_channel(text_channel,"core") then
            change_channel(id,text_channel,"core")
        end
        gui.update_main()
        return
    end
end

function change_valid_bufferchannel(slider_channel,text_channel,id,object)

    if slider_channel == text_channel then
        if is_valid_channel(slider_channel,object) then
            change_channel(id,slider_channel,object)
        end
        gui.update_main()
        return
    end

    if not (slider_channel ==  global.ki[object][id].channel) then
        if is_valid_channel(slider_channel,object) then
            change_channel(id,slider_channel,object)
        end
        gui.update_main()
        return
    end

    if not (text_channel ==  global.ki[object][id].channel) then
        if is_valid_channel(text_channel,object) then
            change_channel(id,slider_channel,object)
        end
        gui.update_main()
        return
    end
end

function change_valid_standardchannel(slider_channel,text_channel)
    if slider_channel == text_channel then
        if is_valid_standardchannel(slider_channel) then
            global.ki.standardchannel = slider_channel
        end
        gui.update_main()
        return
    end

    if not (slider_channel ==  global.ki.standardchannel) then
        if is_valid_standardchannel(slider_channel) then
            global.ki.standardchannel = slider_channel
        end
        gui.update_main()
        return
    end

    if not (text_channel ==  global.ki.standardchannel) then
        if is_valid_standardchannel(text_channel) then
            global.ki.standardchannel = text_channel
        end
        gui.update_main()
        return
    end
end

function change_valid_selectchannel(slider_channel,text_channel)
    if slider_channel == text_channel then
        if is_valid_standardchannel(slider_channel) then
            global.ki.selectchannel = slider_channel
        end
        gui.update_main()
        return
    end

    if not (slider_channel ==  global.ki.selectchannel) then
        if is_valid_standardchannel(slider_channel) then
            global.ki.selectchannel = slider_channel
        end
        gui.update_main()
        return
    end

    if not (text_channel ==  global.ki.selectchannel) then
        if is_valid_standardchannel(text_channel) then
            global.ki.selectchannel = text_channel
        end
        gui.update_main()
        return
    end
end

function is_valid_channel(channel,object)
    if #global.ki.channel >= channel then
        if not global.ki.channel[channel][object] then
            return true
        end
    end
    return false
end

function is_valid_standardchannel(channel)
    if #global.ki.channel >= channel then
        return true
    end
    return false
end

function change_channel(id,new_channel,type)
    global.ki.channel[global.ki[type][id].channel][type] = nil
    global.ki[type][id].channel = new_channel
    global.ki.channel[new_channel][type] = id
    global.ki.dirty = true
end

return gui







