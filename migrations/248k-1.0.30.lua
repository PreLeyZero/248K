for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    force.reset_technology_effects()
end

function open_gui(player)

    local root = player.gui.screen.add{
        type = "frame",
        name = "248k_migration_notice",
        direction = "vertical",
    } --[[@as LuaGuiElement]]
    root.force_auto_center()

    do -- Titlebar
        local titlebar = root.add{type = "flow", direction = "horizontal"}  --[[@as LuaGuiElement]]
        titlebar.drag_target = root
        titlebar.add{
            type = "label",
            caption = {"248k.migration-gui-title"},
            style = "frame_title",
            ignored_by_interaction = true
        }
        titlebar.add{
            type = "empty-widget",
            style = "ei_titlebar_draggable_spacer",
            ignored_by_interaction = true
        }
        titlebar.add{
            type = "sprite-button",
            name = "close_button",
            style = "close_button",
            sprite = "utility/close_white",
            hovered_sprite = "utility/close_black",
            clicked_sprite = "utility/close_black",
            tags = {
                parent_gui = "248k_migration_notice",
                action = "close-gui"
            }
        }
    end

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame"
    } --[[@as LuaGuiElement]]

    do -- info on 248k
        main_container.add{ -- Console subheader
            type = "frame",
            style = "ei_subheader_frame"
        }.add{
            type = "label",
            caption = {"248k.migration-gui-info-title"},
            style = "subheader_caption_label"
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-info-text"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-info-text-2"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-info-text-3"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-info-text-4"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-info-text-5"},
        }
    end

    do -- info on 248k
        main_container.add{ -- Console subheader
            type = "frame",
            style = "ei_subheader_frame"
        }.add{
            type = "label",
            caption = {"248k.migration-gui-ei-title"},
            style = "subheader_caption_label"
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-text"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-text-2"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-text-3"},
        }
    end

    do -- info on 248k
        main_container.add{ -- Console subheader
            type = "frame",
            style = "ei_subheader_frame"
        }.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-title"},
            style = "subheader_caption_label"
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-2"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-3"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-4"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-5"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-6"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-7"},
        }
        main_container.add{
            type = "label",
            caption = {"248k.migration-gui-ei-sub-text-8"},
        }
    end



end

-- Open the GUI for all players
for _, player in pairs(game.players) do
    open_gui(player)
end