local function sprite(name)
    return '__248k__/ressources/groups/'..name
end

data:extend({
--============================================================================================================================================================
--inventory subgroups
    {
        name = 'el_item_group',
        type = 'item-group',
        icon = sprite('el_group_icon.png'),
        icon_size = 64,
        inventory_order = "f",
        order = "e",
    },
    {
        name = 'fi_item_group',
        type = 'item-group',
        icon = sprite('fi_group_icon.png'),
        icon_size = 64,
        inventory_order = "g",
        order = "e",
    },
    {
        name = 'fu_item_group',
        type = 'item-group',
        icon = sprite('fu_group_icon.png'),
        icon_size = 64,
        inventory_order = "h",
        order = "e",
    },
    {
        name = 'fu_star_engine_group',
        type = 'item-group',
        icon = sprite('fu_group_icon.png'),
        icon_size = 64,
        inventory_order = "k",
        order = "e",
    },
    {
        name = 'gr_item_group',
        type = 'item-group',
        icon = sprite('gr_group_icon.png'),
        icon_size = 64,
        inventory_order = "j",
        order = "e",
    },
    --ores+materials
    {
        name = 'el_item_subgroup_a',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'a',
    },
    {
        name = 'fi_item_subgroup_a',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'a',
    },
    {
        name = 'fi_item_subgroup_a-b',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'a-b',
    },
    {
        name = 'fi_item_subgroup_a-c',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'a-c',
    },
    {
        name = 'fu_item_subgroup_a',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'a',
    },
    {
        name = 'gr_item_subgroup_a',
        type = 'item-subgroup',
        group = 'gr_item_group',
        order = 'a',
    },
    {
        name = 'fu_item_subgroup_a-b',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'a-b',
    },
    --items
    {
        name = 'el_item_subgroup_b',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'b',
    },
    {
        name = 'fi_item_subgroup_b',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'b',
    },
    {
        name = 'fu_item_subgroup_b',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'b',
    },
    {
        name = 'gr_item_subgroup_b',
        type = 'item-subgroup',
        group = 'gr_item_group',
        order = 'b',
    },
    --placeable
    {
        name = 'el_item_subgroup_c',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'c',
    },
    {
        name = 'fi_item_subgroup_c',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'c',
    },
    {
        name = 'fu_item_subgroup_c',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'c',
    },
    {
        name = 'gr_item_subgroup_c',
        type = 'item-subgroup',
        group = 'gr_item_group',
        order = 'c',
    },
    --train and stuff
    {
        name = 'el_item_subgroup_d',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'd',
    },
    {
        name = 'fi_item_subgroup_d',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'd',
    },
    {
        name = 'fu_item_subgroup_d',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'd-a',
    },
    {
        name = 'gr_item_subgroup_d',
        type = 'item-subgroup',
        group = 'gr_item_group',
        order = 'd-a',
    },
    {
        name = 'fu_item_subgroup_d-b',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'd-b',
    },
    --fluids
    {
        name = 'el_item_subgroup_e',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'e',
    },
    {
        name = 'fi_item_subgroup_e',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'e',
    },
    {
        name = 'fu_item_subgroup_e',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'e',
    },
    {
        name = 'gr_item_subgroup_e',
        type = 'item-subgroup',
        group = 'gr_item_group',
        order = 'e',
    },
    --ki stuff
    {
        name = 'el_item_subgroup_f',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'f',
    },
    {
        name = 'fi_item_subgroup_f',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'f',
    },
    {
        name = 'fu_item_subgroup_f',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'f',
    },
    {
        name = 'gr_item_subgroup_f',
        type = 'item-subgroup',
        group = 'gr_item_group',
        order = 'f',
    },
    --j
    {
        name = 'fi_item_subgroup_j',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'j',
    },
    --k
    {
        name = 'el_item_subgroup_k',
        type = 'item-subgroup',
        group = 'el_item_group',
        order = 'k',
    },
    {
        name = 'fi_item_subgroup_k',
        type = 'item-subgroup',
        group = 'fi_item_group',
        order = 'k',
    },
    {
        name = 'fu_item_subgroup_k',
        type = 'item-subgroup',
        group = 'fu_item_group',
        order = 'k',
    },
    --star engine
    {
        name = 'fu_star_engine_subgroup_a',
        type = 'item-subgroup',
        group = 'fu_star_engine_group',
        order = 'a',
    },
    {
        name = 'fu_star_engine_subgroup_b',
        type = 'item-subgroup',
        group = 'fu_star_engine_group',
        order = 'b',
    },
    {
        name = 'fu_star_engine_subgroup_c',
        type = 'item-subgroup',
        group = 'fu_star_engine_group',
        order = 'c',
    },
    {
        name = 'fu_star_engine_subgroup_d',
        type = 'item-subgroup',
        group = 'fu_star_engine_group',
        order = 'd',
    },
    {
        name = 'fu_star_engine_subgroup_e',
        type = 'item-subgroup',
        group = 'fu_star_engine_group',
        order = 'e',
    },
--============================================================================================================================================================

    --ki_crafting
    {
        name = 'el_ki_crafting_category',
        type = 'recipe-category',
    },
    --el_ki_memory
    {
        name = 'el_ki_memory_category',
        type = 'recipe-category',
    },
    --el_ki_cpu
    {
        name = 'el_ki_cpu_category',
        type = 'recipe-category',
    },
    --el_ki_core
    {
        name = 'el_ki_core_category',
        type = 'recipe-category',
    },
    {
        name = 'fi_ki_core_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_ki_core_category',
        type = 'recipe-category',
    },
    {
        name = 'fi_ki_circuit_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_ki_circuit_category',
        type = 'recipe-category',
    },

--============================================================================================================================================================
    --fi_nuclear assembling
    {
        name = 'fi_crafting_category',
        type = 'recipe-category',
    },
    --fi_crushing
    {
        name = 'fi_crushing',
        type = 'recipe-category',
    },
    --fi_modules
    --producticity
    {
        name = '248k_productivity_category',
        type = 'module-category',
    },

--============================================================================================================================================================
    --fu fusor
    {
        name = 'fu_fusor_crafting_category',
        type = 'recipe-category',
    },
    --fu boiler
    {
        name = 'fu_boiler_crafting_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_burner_category',
        type = 'recipe-category',
    },
    --fu_reactors
    {
        name = 'fu_stelar_reactor_crafting_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_tokamak_reactor_crafting_category',
        type = 'recipe-category',
    },
    --fu_exchanger
    {
        name = 'fu_exchanger_crafting_category',
        type = 'recipe-category',
    },
    --fu_activator
    {
        name = 'fu_activator_crafting_category',
        type = 'recipe-category',
    },
    --star engine
    {
        name = 'fu_star_engine_core_crafting_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_star_engine_cooler_crafting_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_star_engine_heater_crafting_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_star_engine_caster_crafting_category',
        type = 'recipe-category',
    },
--============================================================================================================================================================


    --fuel_category
    {
        name = 'el_train_fuel',
        type = 'fuel-category',
    },
    {
        name = 'fi_test_fuel',
        type = 'fuel-category',
    },
    {
        name = 'fi_basic_fuel',
        type = 'fuel-category',
    },
    {
        name = 'fi_advanced_fuel',
        type = 'fuel-category',
    },
    {
        name = 'fi_pure_fuel',
        type = 'fuel-category',
    },
    --train_equip
    {
        name = 'el_train_equipment',
        type = 'equipment-category',
    },
    {
        name = 'fi_train_equipment',
        type = 'equipment-category',
    },

    --recipe
    {
        name = 'el_special_fluid',
        type = 'recipe-category',
    },
    {
        name = 'el_purifier_category',
        type = 'recipe-category',
    },
    {
        name = 'el_arc_furnace_category',
        type = 'recipe-category',
    },
    {
        name = 'el_caster_category',
        type = 'recipe-category',
    },
    {
        name = 'el_grower_category',
        type = 'recipe-category',
    },
    {
        name = 'fi_fiberer_category',
        type = 'recipe-category',
    },
    {
        name = 'fi_castor_category',
        type = 'recipe-category',
    },
    {
        name = 'fi_compound_machine_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_laser_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_plasma_category',
        type = 'recipe-category',
    },
    {
        name = 'fu_magnet_category',
        type = 'recipe-category',
    },
    {
        name = "gr_cooker_fluid",
        type = "recipe-category"
    },
    {
        name = "gr_charger_category",
        type = "recipe-category"
    },
    {
        name = "gr_white_hole_category",
        type = "recipe-category"
    },

    --grids
    {
        name = 'el_train_equipment_grid',
        type = 'equipment-grid',
        width = 6,
        height = 6,
        equipment_categories = {
            'el_train_equipment',
            'fi_train_equipment',
        },
    },
})