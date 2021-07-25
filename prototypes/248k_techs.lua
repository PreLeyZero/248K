--local functions
local function sprite(name)
    return '__248k__/ressources/techs/'..name
end
--techs
data:extend({
    --el
    {
        name = 'el_stage_tech',
        type = 'technology',
        icon = sprite('el_stage_tech.png'),
        icon_size = 128,
        prerequisites = {'electronics'},
        effects = {
            {
                type = 'nothing',
                effect_description = {'description.el_stage_eff'},
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'automation-science-pack',1},
            },
            time = 30,
        },
    },
    --el_engery
    {
        name = 'el_energy_tech',
        type = 'technology',
        icon = sprite('el_energy_tech.png'),
        icon_size = 128,
        prerequisites = {'el_stage_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.el_energy_eff'},
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
            },
            time = 30,
        },
    },
    --solar
    {
        name = 'el_solar_tech',
        type = 'technology',
        icon = sprite('el_solar_tech.png'),
        icon_size = 128,
        prerequisites = {'el_energy_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_solar_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
            },
            time = 30,
        },
    },
    --burner
    {
        name = 'el_burner_tech',
        type = 'technology',
        icon = sprite('el_burner_tech.png'),
        icon_size = 128,
        prerequisites = {'el_energy_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_burner_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_burner_kerosene_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
            },
            time = 30,
        },
    },
    --water generator
    {
        name = 'el_water_generator_tech',
        type = 'technology',
        icon = sprite('el_water_generator_tech.png'),
        icon_size = 128,
        prerequisites = {'el_energy_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_water_generator_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_pressurizer_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_water_pressure_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
            },
            time = 30,
        },
    },
    --aluminum_ore
    --aluminum_item
    {
        name = 'el_aluminum_tech',
        type = 'technology',
        icon = sprite('el_aluminum_tech.png'),
        icon_size = 128,
        prerequisites = {'el_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_aluminum_ore_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_aluminum_item_recipe',
            },
        },
        unit = {
            count = '30',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --lithium_ore
    --lithium_item
    --lithium_basic_battery
    --lithium_battery
    {
        name = 'el_lithium_tech',
        type = 'technology',
        icon = sprite('el_lithium_tech.png'),
        icon_size = 128,
        prerequisites = {'el_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_lithium_ore_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_lithium_item_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_lithium_basic_battery_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_lithium_battery_recipe',
            },
        },
        unit = {
            count = '30',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --el_kerosene
    --el_acidic_water
    --el_desulfurized_kerosene
    {
        name = 'el_kerosene_tech',
        type = 'technology',
        icon = sprite('el_kerosene_tech.png'),
        icon_size = 128,
        prerequisites = {'el_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_kerosene_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_desulfurized_kerosene_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_usage_acidic_water_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_tank_recipe',
            },
            { 
                type = 'nothing',
                effect_description = {'description.el_kerosene_tech_eff'},
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --el_train
    --el_equip
    {
        name = 'el_train_tech',
        type = 'technology',
        icon = sprite('el_train_tech.png'),
        icon_size = 128,
        prerequisites = {'el_kerosene_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_train_fuel_diesel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_train_equipment_accelerator_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_train_equipment_generator_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_diesel_train_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_train_fuel_diesel_energized_recipe',
            },
        },
        unit = {
            count = '350',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --el_crystal
    {
        name = 'el_crystal_tech',
        type = 'technology',
        icon = sprite('el_crystal_tech.png'),
        icon_size = 128,
        prerequisites = {'el_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_energy_crystal_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_train_fuel_diesel_energized_recipe',
            },
        },
        unit = {
            count = '30',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --el_ki
    {
        name = 'el_ki_tech',
        type = 'technology',
        icon = sprite('el_ki_tech.png'),
        icon_size = 128,
        prerequisites = {'el_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_beacon_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_core_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_memory_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_cpu_recipe',
            },
            { 
                type = 'nothing',
                effect_description = {'description.el_ki_tech_eff'},
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_cpu_fluid_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_memory_fluid_recipe',
            }
        },
        unit = {
            count = '350',
            ingredients = {
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    {
        name = 'fi_ki_tech',
        type = 'technology',
        icon = sprite('fi_ki_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_beacon_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_core_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_circuit_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_circuit_fluid_recipe',
            }
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1}
            },
            time = 30,
        },
    },
    {
        name = 'fu_ki_tech',
        type = 'technology',
        icon = sprite('fu_ki_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_ki_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_beacon_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_core_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_circuit_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_circuit_fluid_recipe',
            }
        },
        unit = {
            count = '50',
            ingredients = {
                {'chemical-science-pack',80},
                {'automation-science-pack',80},
                {'logistic-science-pack',80},
                {'production-science-pack',80},
                {'utility-science-pack',80},
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_eff_1_tech',
        type = 'technology',
        icon = sprite('el_ki_eff_1_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_cpu_fluid_recipe_1',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_memory_fluid_recipe_1',
            }
        },
        unit = {
            count = '80',
            ingredients = {
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_eff_2_tech',
        type = 'technology',
        icon = sprite('el_ki_eff_2_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_eff_1_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_cpu_fluid_recipe_2',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_memory_fluid_recipe_2',
            }
        },
        unit = {
            count = '240',
            ingredients = {
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_eff_3_tech',
        type = 'technology',
        icon = sprite('el_ki_eff_3_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_eff_2_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_cpu_fluid_recipe_3',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'el_ki_memory_fluid_recipe_3',
            }
        },
        unit = {
            count = '400',
            ingredients = {
                {'fu_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fi_ki_eff_1_tech',
        type = 'technology',
        icon = sprite('fi_ki_eff_1_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_ki_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_circuit_fluid_recipe_1',
            }
        },
        unit = {
            count = '40',
            ingredients = {
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fi_ki_eff_2_tech',
        type = 'technology',
        icon = sprite('fi_ki_eff_2_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_ki_eff_1_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_circuit_fluid_recipe_2',
            }
        },
        unit = {
            count = '120',
            ingredients = {
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fi_ki_eff_3_tech',
        type = 'technology',
        icon = sprite('fi_ki_eff_3_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_ki_eff_2_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_ki_circuit_fluid_recipe_3',
            }
        },
        unit = {
            count = '200',
            ingredients = {
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fu_ki_eff_1_tech',
        type = 'technology',
        icon = sprite('fu_ki_eff_1_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_ki_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_circuit_fluid_recipe_1',
            }
        },
        unit = {
            count = '40',
            ingredients = {
                {'fu_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fu_ki_eff_2_tech',
        type = 'technology',
        icon = sprite('fu_ki_eff_2_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_ki_eff_1_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_circuit_fluid_recipe_2',
            }
        },
        unit = {
            count = '120',
            ingredients = {
                {'fu_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fu_ki_eff_3_tech',
        type = 'technology',
        icon = sprite('fu_ki_eff_3_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_ki_eff_2_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_ki_circuit_fluid_recipe_3',
            }
        },
        unit = {
            count = '200',
            ingredients = {
                {'fu_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fu_ki_plus_1_tech',
        type = 'technology',
        icon = sprite('fu_ki_plus_1_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_ki_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.x2_ki_tech_eff'},
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',100},
                {'automation-science-pack',100},
                {'logistic-science-pack',100},
                {'production-science-pack',100},
                {'utility-science-pack',100}, 
                {'space-science-pack',100}, 
                {'fu_space_probe_science_item',100},
                {'fi_ki_science',1},
                {'fu_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'fu_ki_plus_2_tech',
        type = 'technology',
        icon = sprite('fu_ki_plus_2_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_ki_plus_1_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.x3_ki_tech_eff'},
            },
        },
        unit = {
            count = '2000',
            ingredients = {
                {'chemical-science-pack',100},
                {'automation-science-pack',100},
                {'logistic-science-pack',100},
                {'production-science-pack',100},
                {'utility-science-pack',100}, 
                {'space-science-pack',100}, 
                {'fu_space_probe_science_item',100},
                {'fi_ki_science',1},
                {'fu_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_sup_1_tech',
        type = 'technology',
        icon = sprite('el_ki_sup_1_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_eff_1_tech','fi_ki_eff_1_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.sup_1_ki_tech_eff'},
            },
        },
        unit = {
            count = '100',
            ingredients = {
                {'fi_ki_science',1} 
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_sup_2_tech',
        type = 'technology',
        icon = sprite('el_ki_sup_2_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_eff_2_tech','fi_ki_eff_2_tech','el_ki_sup_1_tech','fu_ki_eff_1_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.sup_2_ki_tech_eff'},
            },
        },
        unit = {
            count = '300',
            ingredients = {
                {'fi_ki_science',1},
                {'fu_ki_science',1}
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_sup_3_tech',
        type = 'technology',
        icon = sprite('el_ki_sup_3_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_eff_3_tech','fi_ki_eff_3_tech','el_ki_sup_2_tech','fu_ki_eff_2_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.sup_3_ki_tech_eff'},
            },
        },
        unit = {
            count = '600',
            ingredients = {
                {'fi_ki_science',1},
                {'fu_ki_science',1}
            },
            time = 30,
        },
    },
    {
        name = 'el_ki_sup_4_tech',
        type = 'technology',
        icon = sprite('el_ki_sup_4_tech.png'),
        icon_size = 128,
        prerequisites = {'el_ki_sup_3_tech','fu_ki_eff_3_tech','fu_ki_plus_1_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.sup_4_ki_tech_eff'},
            },
        },
        unit = {
            count = '900',
            ingredients = {
                {'fi_ki_science',1},
                {'fu_ki_science',1}
            },
            time = 30,
        },
    },
    
    --============================================================================================================================================================
    --fi
    {
        name = 'fi_stage_tech',
        type = 'technology',
        icon = sprite('fi_stage_tech.png'),
        icon_size = 128,
        prerequisites = {
            'el_aluminum_tech',
            'el_solar_tech',
            'el_burner_tech',
            'el_water_generator_tech',
            'el_train_tech',
            'el_ki_tech',
            'el_lithium_tech'
        },
        effects = {
            {
                type = 'nothing',
                effect_description = {'description.fi_stage_eff'},
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --fi_engery
    {
        name = 'fi_energy_tech',
        type = 'technology',
        icon = sprite('fi_energy_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_stage_tech'},
        effects = {
            { 
                type = 'nothing',
                effect_description = {'description.fi_energy_eff'},
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --fi
    {
        name = 'fi_refining_tech',
        type = 'technology',
        icon = sprite('fi_refining_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_plutonium239_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_uranium233_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_thorium232_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_basic_fuel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_basic_thorium_fuel_recipe',
            },
        },
        unit = {
            count = '250',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --fi_meterails (also crafter)
    {
        name = 'fi_materials_tech',
        type = 'technology',
        icon = sprite('fi_materials_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_compound_material_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crafter_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_low-density-structure_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --fi_miner
    {
        name = 'fi_miner_tech',
        type = 'technology',
        icon = sprite('fi_miner_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_miner_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --fi_train
    {
        name = 'fi_train_tech',
        type = 'technology',
        icon = sprite('fi_train_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_equipment_player_reactor_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_equipment_player_shield_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_train_equipment_generator_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },



    --fi_reactor_solid
    {
        name = 'fi_solid_reactor_tech',
        type = 'technology',
        icon = sprite('fi_solid_reactor_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_energy_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_solid_reactor_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_advanced_fuel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_pure_fuel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_advanced_thorium_fuel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_advanced_fuel_recycle_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_advanced_thorium_fuel_recycle_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_pure_fuel_recycle_recipe',
            },
        },
        unit = {
            count = '500',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },

    --fi crushing 
    {
        name = 'fi_crusher_tech',
        type = 'technology',
        icon = sprite('fi_crusher_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crusher_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crushed_crystal_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crushed_iron_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crushed_copper_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crushed_lithium_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crushed_aluminum_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crushed_coal_recipe',
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --fi crystal 
    {
        name = 'fi_crystal_tech',
        type = 'technology',
        icon = sprite('fi_crystal_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_crusher_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_energy_crystal_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_catalyst_crystal_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_base_crystal_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_crystal_fluid_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_fuel_train_crystal_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --blends 
    {
        name = 'fi_blends_tech',
        type = 'technology',
        icon = sprite('fi_blends_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_materials_tech','fi_crusher_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_materials_industrial_steel_blend_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_materials_industrial_steel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_materials_steel_recipe',
            },
        },
        unit = {
            count = '300',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --robo
    {
        name = 'fi_robo_tech',
        type = 'technology',
        icon = sprite('fi_robo_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_materials_tech','fi_miner_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_robo_port_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_robo_charger_recipe',
            },
        },
        unit = {
            count = '300',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    --modules
    {
        name = 'fi_modules_1_tech',
        type = 'technology',
        icon = sprite('fi_modules_1_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_train_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_base_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_core_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_productivity_1_recipe',
            },
        },
        unit = {
            count = '150',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    {
        name = 'fi_modules_2_tech',
        type = 'technology',
        icon = sprite('fi_modules_2_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_modules_1_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_productivity_2_recipe',
            },
        },
        unit = {
            count = '250',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
            },
            time = 30,
        },
    },
    {
        name = 'fi_modules_3_tech',
        type = 'technology',
        icon = sprite('fi_modules_3_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_modules_2_tech','fu_fusor_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_productivity_3_recipe',
            },
        },
        unit = {
            count = '300',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1,},
                {'utility-science-pack',1}
            },
            time = 30,
        },
    },
    {
        name = 'fi_modules_4_tech',
        type = 'technology',
        icon = sprite('fi_modules_4_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_modules_3_tech','gr_materials_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_productivity_4_recipe',
            },
        },
        unit = {
            count = '2000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'fi_modules_5_tech',
        type = 'technology',
        icon = sprite('fi_modules_5_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_modules_4_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_productivity_5_recipe',
            },
        },
        unit = {
            count = '3000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'fi_modules_6_tech',
        type = 'technology',
        icon = sprite('fi_modules_6_tech.png'),
        icon_size = 128,
        prerequisites = {'fi_modules_5_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_modules_productivity_6_recipe',
            },
        },
        unit = {
            count = '4000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    --============================================================================================================================================================
    --fu
    {
        name = 'fu_stage_tech',
        type = 'technology',
        icon = sprite('fu_stage_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fi_crystal_tech',
            'fi_solid_reactor_tech',
            'fi_blends_tech',
            'fi_robo_tech',
            'fi_refining_tech',
            'fi_train_tech'
        },
        effects = {
            {
                type = 'nothing',
                effect_description = {'description.fu_stage_eff'},
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --fu fusor
    {
        name = 'fu_fusor_tech',
        type = 'technology',
        icon = sprite('fu_fusor_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fu_stage_tech',
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusor_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_2_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_3_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_4_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_5_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_6_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_tech_sign_7_recipe',
            },
            {
                type = 'nothing',
                effect_description = {'description.fu_fusor_eff'},
            },
        },
        unit = {
            count = '400',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --fu basic elemtns
    {
        name = 'fu_basic_elements_tech',
        type = 'technology',
        icon = sprite('fu_basic_elements_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fu_stage_tech',
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_boiler_hydrogen_oxygen_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_boiler_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_burner_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_lithium_6_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_hydrogen_recipe',
            },
            {
                type = 'nothing',
                effect_description = {'description.fu_basic_elements_eff'},
            },
        },
        unit = {
            count = '400',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    {
        name = 'fu_hydrogen_1_tech',
        type = 'technology',
        icon = sprite('fu_hydrogen_1_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fu_basic_elements_tech',
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_boiler_hydrogen_oxygen_1_recipe',
            },
        },
        unit = {
            count = '800',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1},
            },
            time = 45,
        },
    },
    {
        name = 'fu_hydrogen_2_tech',
        type = 'technology',
        icon = sprite('fu_hydrogen_2_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fu_hydrogen_1_tech',
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_boiler_hydrogen_oxygen_2_recipe',
            },
        },
        unit = {
            count = '2000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1},
                {'space-science-pack',1} 
            },
            time = 45,
        },
    },
    {
        name = 'fu_hydrogen_3_tech',
        type = 'technology',
        icon = sprite('fu_hydrogen_3_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fu_hydrogen_2_tech',
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_boiler_hydrogen_oxygen_3_recipe',
            },
        },
        unit = {
            count = '6000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1},
                {'space-science-pack',1} 
            },
            time = 45,
        },
    },
    --fu_engery
    {
        name = 'fu_energy_tech',
        type = 'technology',
        icon = sprite('fu_energy_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_fusor_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_exchanger_item_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_exchanger_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_exchanger_2_recipe',
            },
            { 
                type = 'nothing',
                effect_description = {'description.fu_energy_eff'},
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    {
        name = 'fu_crystal_tech',
        type = 'technology',
        icon = sprite('fu_crystal_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_crystal_from_fluid_recipe',
            }
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --fu_lead
    {
        name = 'fu_lead_tech',
        type = 'technology',
        icon = sprite('fu_lead_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_stage_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_lead_ore_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_lead_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_lead_crushed_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_lead_molten_recipe',
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --fu_reactor
    {
        name = 'fu_reactor_tech',
        type = 'technology',
        icon = sprite('fu_reactor_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_energy_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_stelar_reactor_recipe',
            },
            --{ 
            --    type = 'unlock-recipe',
            --    recipe = 'fu_stelerator_1_recipe',
            --},
            { 
                type = 'unlock-recipe',
                recipe = 'fu_stelerator_2_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_stelerator_3_recipe',
            },
            { 
                type = 'nothing',
                effect_description = {'description.fu_reactor_eff'},
            },
        },
        unit = {
            count = '400',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --robo
    {
        name = 'fu_robo_tech',
        type = 'technology',
        icon = sprite('fu_robo_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_fusor_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_robo_construction_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_robo_logistic_recipe',
            },
        },
        unit = {
            count = '400',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --tokamak
    {
    name = 'fu_tokamak_tech',
    type = 'technology',
    icon = sprite('fu_tokamak_tech.png'),
    icon_size = 128,
    prerequisites = {'fu_energy_tech'},
    effects = {
        { 
            type = 'unlock-recipe',
            recipe = 'fu_tokamak_reactor_recipe',
        },
        { 
            type = 'unlock-recipe',
            recipe = 'fu_tokamak_1_recipe',
        },
        { 
            type = 'unlock-recipe',
            recipe = 'fu_tokamak_2_recipe',
        },
        { 
            type = 'nothing',
            effect_description = {'description.fu_tokamak_eff'},
        },
    },
        unit = {
            count = '400',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
        },
        time = 45,
        },
    },
    --activator
    {
        name = 'fu_activator_tech',
        type = 'technology',
        icon = sprite('fu_activator_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_fusor_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_activator_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_activator_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_activator_2_recipe',
            },
            { 
                type = 'nothing',
                effect_description = {'description.fu_activator_eff'},
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'utility-science-pack',1}
            },
            time = 45,
        },
    },
    --star engine
    {
        name = 'fu_star_engine_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_reactor_tech','fu_tokamak_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_up_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_heater_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_heater_left_recipe',
            },
            { 
                type = 'nothing',
                effect_description = {'description.fu_star_engine_eff'},
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1},
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_star_engine_iron_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_iron_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_star_engine_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_heater_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_caster_1_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_star_engine_copper_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_copper_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_star_engine_iron_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_2_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_2_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_caster_2_recipe',
            },
        },
        unit = {
            count = '2000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_star_engine_sulfur_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_sulfur_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_star_engine_copper_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_3_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_3_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_caster_3_recipe',
            },
        },
        unit = {
            count = '4000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_star_engine_lithium_7_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_lithium_7_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_star_engine_sulfur_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_4_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_4_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_caster_4_recipe',
            },
        },
        unit = {
            count = '6000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_star_engine_uranium_238_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_uranium_238_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_star_engine_lithium_7_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_6_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_6_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_caster_6_recipe',
            },
        },
        unit = {
            count = '8000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_star_engine_uranium_235_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_uranium_235_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_star_engine_uranium_238_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_cooler_5_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_core_5_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_star_engine_caster_5_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    --space probes
    {
        name = 'fu_space_probe_1_tech',
        type = 'technology',
        icon = sprite('fu_space_probe_1_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_energy_tech','fu_robo_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_space_probe_sputnik_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_space_probe_2_tech',
        type = 'technology',
        icon = sprite('fu_space_probe_2_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_space_probe_1_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_space_probe_probe_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_space_probe_data_card_2_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    {
        name = 'fu_space_probe_3_tech',
        type = 'technology',
        icon = sprite('fu_space_probe_3_tech.png'),
        icon_size = 128,
        prerequisites = {'fu_space_probe_2_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_space_probe_deep_probe_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_space_probe_ore_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_space_probe_science_recipe',
            },
            --{ 
            --    type = 'unlock-recipe',
            --    recipe = 'fu_space_probe_science_recipe_1',
            --},
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1} 
            },
            time = 100,
        },
    },
    --============================================================================================================================================================
    --gravitational
    {
        name = 'gr_stage_tech',
        type = 'technology',
        icon = sprite('gr_stage_tech.png'),
        icon_size = 128,
        prerequisites = {
            'fu_space_probe_3_tech',
            'fu_star_engine_uranium_235_tech',
            'fu_hydrogen_3_tech',
            'fu_lead_tech'
        },
        effects = {
            {
                type = 'nothing',
                effect_description = {'description.gr_stage_eff'},
            },
        },
        unit = {
            count = '200',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_compact_fusion_tech',
        type = 'technology',
        icon = sprite('gr_compact_fusion_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_stage_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_materials_fusion_cell_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_materials_charge_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_materials_charge_remote_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_materials_tech',
        type = 'technology',
        icon = sprite('gr_materials_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_stage_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_materials_stack_down_item_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_materials_stack_up_item_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_crafter_tech',
        type = 'technology',
        icon = sprite('gr_crafter_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_compact_fusion_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_crafter_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    --stelar engine 2
    {
        name = 'gr_star_engine_1_tech',
        type = 'technology',
        icon = sprite('gr_wheel_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_compact_fusion_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_wheel_recipe',
            },
        },
        unit = {
            count = '2000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_star_engine_2_tech',
        type = 'technology',
        icon = sprite('gr_steel_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_star_engine_1_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_steel_recipe',
            },
        },
        unit = {
            count = '4000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    --gr trains 
    {
        name = 'gr_train_tech',
        type = 'technology',
        icon = sprite('gr_train_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_compact_fusion_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_magnet_train_pre_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_magnet_wagon_pre_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_magnet_tanker_pre_recipe',
            },
        },
        unit = {
            count = '1000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_train_plus_tech',
        type = 'technology',
        icon = sprite('gr_train_plus_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_train_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_magnet_train_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_magnet_wagon_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_magnet_tanker_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    --gr kovarex
    {
        name = 'gr_kovarex_tech',
        type = 'technology',
        icon = sprite('gr_kovarex_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_compact_fusion_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_kovarex_recipe',
            }
        },
        unit = {
            count = '10000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_cooker_tech',
        type = 'technology',
        icon = sprite('gr_cooker_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_stage_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_cooker_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_cooker_fluid_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_cooked_crystal_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_refined_crystal_recipe',
            },
        },
        unit = {
            count = '400',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_charger_tech',
        type = 'technology',
        icon = sprite('gr_charger_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_stage_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_charger_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_stabilizer_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_crushed_exotic_recipe',
            }
        },
        unit = {
            count = '50000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_black_hole_tech',
        type = 'technology',
        icon = sprite('gr_black_hole_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_charger_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_black_hole_recipe',
            }
        },
        unit = {
            count = '100000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_white_hole_tech',
        type = 'technology',
        icon = sprite('gr_white_hole_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_charger_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_white_hole_recipe',
            }
        },
        unit = {
            count = '100000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_data_tech',
        type = 'technology',
        icon = sprite('gr_data_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_white_hole_tech',
            'gr_black_hole_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_stacked_data_recipe',
            }
        },
        unit = {
            count = '10000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_red_tech',
        type = 'technology',
        icon = sprite('gr_red_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_data_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_red_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_red_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_green_tech',
        type = 'technology',
        icon = sprite('gr_green_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_red_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_green_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_green_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_blue_tech',
        type = 'technology',
        icon = sprite('gr_blue_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_green_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_blue_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_blue_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_purple_tech',
        type = 'technology',
        icon = sprite('gr_purple_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_blue_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_purple_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_purple_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_yellow_tech',
        type = 'technology',
        icon = sprite('gr_yellow_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_purple_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_yellow_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_yellow_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_grey_tech',
        type = 'technology',
        icon = sprite('gr_grey_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_yellow_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_grey_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_grey_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_white_tech',
        type = 'technology',
        icon = sprite('gr_white_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_grey_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_white_data_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_white_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'gr_materials_red_pack_item',1},
                {'gr_materials_green_pack_item',1},
                {'gr_materials_blue_pack_item',1},
                {'gr_materials_purple_pack_item',1},
                {'gr_materials_yellow_pack_item',1}, 
                {'gr_materials_grey_pack_item',1}, 
                {'gr_materials_white_pack_item',1}
            },
            time = 100,
        },
    },
    {
        name = 'gr_lab_tech',
        type = 'technology',
        icon = sprite('gr_lab_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_data_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_lab_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_red_pack_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_green_pack_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_blue_pack_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_purple_pack_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_yellow_pack_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_grey_pack_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_white_pack_recipe',
            },
        },
        unit = {
            count = '10000',
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
                {'fu_space_probe_science_item',1}
            },
            time = 100,
        },
    },
})