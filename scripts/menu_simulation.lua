local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

main_menu_simulations.solar_power_construction = nil
main_menu_simulations.lab = nil
main_menu_simulations.burner_city = nil
main_menu_simulations.mining_defense = nil
main_menu_simulations.forest_fire = nil
main_menu_simulations.oil_pumpjacks = nil
main_menu_simulations.oil_refinery = nil
main_menu_simulations.early_smelting = nil
main_menu_simulations.train_station = nil
main_menu_simulations.logistic_robots = nil
main_menu_simulations.nuclear_power = nil
main_menu_simulations.train_junction = nil
main_menu_simulations.artillery = nil
main_menu_simulations.biter_base_spidertron = nil
main_menu_simulations.biter_base_artillery = nil
main_menu_simulations.biter_base_laser_defense = nil
main_menu_simulations.biter_base_player_attack = nil
main_menu_simulations.biter_base_steamrolled = nil
main_menu_simulations.chase_player = nil
main_menu_simulations.big_defense = nil
main_menu_simulations.brutal_defeat = nil
main_menu_simulations.spider_ponds = nil

data.raw["utility-constants"]["default"].main_menu_simulations.menu_248k_1 =
{
  checkboard = false,
  save = "__248k__/ressources/menu_simulation/248k_menu_1.zip",
  length = 60*25,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-22tiles", limit = 1}[1]  
    game.camera_position = {logo.position.x, logo.position.y}
    game.camera_zoom = 0.7
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
}

data.raw["utility-constants"]["default"].main_menu_simulations.menu_248k_2 =
{
  checkboard = false,
  save = "__248k__/ressources/menu_simulation/248k_menu_2.zip",
  length = 60*25,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]  
    game.camera_position = {logo.position.x, logo.position.y}
    game.camera_zoom = 0.45
    game.tick_paused = false
  ]],
}

data.raw["utility-constants"]["default"].main_menu_simulations.menu_248k_3 =
{
  checkboard = false,
  save = "__248k__/ressources/menu_simulation/248k_menu_3.zip",
  length = 60*25,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-16tiles", limit = 1}[1]  
    game.camera_position = {logo.position.x, logo.position.y}
    game.camera_zoom = 0.7
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
}

data.raw["utility-constants"]["default"].main_menu_simulations.menu_248k_3 =
{
  checkboard = false,
  save = "__248k__/ressources/menu_simulation/248k_menu_6.zip",
  length = 60*25,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "crash-site-spaceship", limit = 1}[1]  
    game.camera_position = {logo.position.x, logo.position.y}
    game.camera_zoom = 0.7
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
}