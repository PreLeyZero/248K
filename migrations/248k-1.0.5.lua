if settings.startup['overhaul_mode'].value == false then
    game.print("You are currently playing 248k on standalone Mode.", {r=0.5, g=0, b=0.5})
    game.print("If you wish to play 248k as an overhaul mod with tech and item integration, especially in Krastorio2 turn on the mod setting", {r=0.5, g=0, b=0.5})
elseif settings.startup['overhaul_mode'].value == true then
    game.print("You are currently playing 248k on overhaul Mode.", {r=0.5, g=0, b=0.5})
    game.print("If you wish to play 248k as an standalone mod without tech and item integration turn off the mod setting", {r=0.5, g=0, b=0.5})
end

for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    force.reset_technology_effects()
end

for _, v in pairs(game.surfaces) do
    for _, _v in pairs(v.find_entities_filtered{name = "fu_star_engine_core_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_star_engine_core_item"})
        _v.mine()
    end
    for _, _v in pairs(v.find_entities_filtered{name = "fu_star_engine_cooler_up_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_star_engine_cooler_up_item"})
        _v.mine()
    end
    for _, _v in pairs(v.find_entities_filtered{name = "fu_star_engine_cooler_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_star_engine_cooler_item"})
        _v.mine()
    end
    for _, _v in pairs(v.find_entities_filtered{name = "fu_star_engine_heater_left_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_star_engine_heater_left_item"})
        _v.mine()
    end
    for _, _v in pairs(v.find_entities_filtered{name = "fu_star_engine_heater_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_star_engine_heater_item"})
        _v.mine()
    end
end