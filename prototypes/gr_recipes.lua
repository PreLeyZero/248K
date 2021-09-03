data:extend({
    --crafter
    {
        name = 'gr_crafter_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'fi_crafter_item',2},
            {'fu_materials_KFK',100},
            {'fu_materials_magnet',10},
            {'gr_materials_fusion_cell_item',1},
            {'gr_materials_circuit',10}
        },
        result = 'gr_crafter_item',
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_materials_fusion_cell_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fi_crafting_category',
        ingredients = {
            {'fu_space_probe_up_matter_item',1},
            {'fu_tech_sign_item',40},
            {'fusion-reactor-equipment',1}
        },
        result = 'gr_materials_fusion_cell_item',
        result_count = 1,
        energy_required = 35,
    },
    {
        name = 'gr_materials_stack_down_item_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'fu_space_probe_down_matter_item',3},
            {'low-density-structure',10},
            {'fu_space_probe_data_card_3_item',2},
        },
        result = 'gr_materials_stack_down_item',
        result_count = 1,
        energy_required = 10,
    },
    {
        name = 'gr_materials_stack_up_item_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'fu_space_probe_up_matter_item',3},
            {'low-density-structure',10},
            {'fu_space_probe_data_card_3_item',2},
        },
        result = 'gr_materials_stack_up_item',
        result_count = 1,
        energy_required = 10,
    },
    {
        name = 'gr_wheel_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="iron-gear-wheel", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_steel_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="steel-plate", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    --train
    {
        name = 'gr_magnet_train_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="gr_materials_fusion_cell_item", amount=4},
            {type="item", name="fu_materials_KFK", amount=100},
            {type="item", name="gr_materials_stack_up_item", amount=4},
            {type="item", name="gr_materials_magnet", amount=20},
            {type="item", name="gr_magnet_train_pre_item", amount=1},
        },
        results = {
            {type="item", name="gr_magnet_train_item", amount=1},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_magnet_wagon_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="gr_materials_fusion_cell_item", amount=2},
            {type="item", name="fu_materials_KFK", amount=100},
            {type="item", name="gr_materials_stack_down_item", amount=2},
            {type="item", name="gr_materials_magnet", amount=20},
            {type="item", name="gr_magnet_wagon_pre_item", amount=1},
        },
        results = {
            {type="item", name="gr_magnet_wagon_item", amount=1},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_magnet_tanker_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="gr_materials_fusion_cell_item", amount=2},
            {type="item", name="fu_materials_KFK", amount=100},
            {type="item", name="gr_materials_stack_down_item", amount=2},
            {type="item", name="gr_materials_magnet", amount=20},
            {type="item", name="gr_magnet_tanker_pre_item", amount=1},
        },
        results = {
            {type="item", name="gr_magnet_tanker_item", amount=1},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_magnet_train_pre_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="fu_materials_KFK", amount=100},
            {type="item", name="fu_materials_TIM", amount=100},
            {type="item", name="fu_materials_magnet", amount=100},
            {type="item", name="fu_materials_energy_crystal", amount=100},
            {type="item", name="el_diesel_train_item", amount=1},
        },
        results = {
            {type="item", name="gr_magnet_train_pre_item", amount=1},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_magnet_wagon_pre_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="fu_materials_KFK", amount=100},
            {type="item", name="fu_materials_TIM", amount=100},
            {type="item", name="fu_materials_magnet", amount=100},
            {type="item", name="fu_materials_energy_crystal", amount=100},
            {type="item", name="cargo-wagon", amount=1},
        },
        results = {
            {type="item", name="gr_magnet_wagon_pre_item", amount=1},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_magnet_tanker_pre_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="fu_materials_KFK", amount=100},
            {type="item", name="fu_materials_TIM", amount=100},
            {type="item", name="fu_materials_magnet", amount=100},
            {type="item", name="fu_materials_energy_crystal", amount=100},
            {type="item", name="fluid-wagon", amount=1},
        },
        results = {
            {type="item", name="gr_magnet_tanker_pre_item", amount=1},
        },
        result_count = 1,
        energy_required = 6,
    },
    --kovarex for matter 
    {
        name = 'gr_kovarex_recipe',
        type = 'recipe',
        category = 'centrifuging',
        enabled = 'false',
        main_product = 'fu_space_probe_up_matter_item',
        ingredients = {
            {type="item", name="fu_space_probe_down_matter_item", amount=10}
        },
        results = {
            {type="item", name="fu_space_probe_down_matter_item", amount=9},
            {type="item", name="fu_space_probe_up_matter_item", amount=1}
        },
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },
    --charger
    {
        name = 'gr_charger_recipe',
        type = 'recipe',
        enabled = 'false',
        main_product = 'gr_charger_item',
        ingredients = {
            {'low-density-structure',100},
            {'fu_materials_KFK',100},
            {'gr_materials_magnet',100},
            {'fu_tech_sign_item',1000},
            {'concrete',500},
            {'lab',10},
            {'gr_materials_circuit',100}
        },
        results = {
            {type="item", name="gr_charger_item", amount=1}
        },
        result_count = 1,
        energy_required = 5
    },
    {
        name = 'gr_stabilizer_recipe',
        type = 'recipe',
        category = 'gr_charger_category',
        enabled = 'false',
        main_product = 'gr_materials_stabilizer_item',
        ingredients = {
            {'gr_materials_crushed_exotic_item',1},
            {'fu_materials_energy_crystal',10},
            {'fu_tech_sign_item',10},
        },
        results = {
            {type="item", name="gr_materials_stabilizer_item", amount=4}
        },
        result_count = 1,
        energy_required = 4,
        always_show_made_in = true
    },
    {
        name = 'gr_crushed_exotic_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fi_crushing',
        ingredients = {
            {'fu_space_probe_ore_item',1},
        },
        result = 'gr_materials_crushed_exotic_item',
        result_count = 2,
        energy_required = 2,
        always_show_made_in = true
    },
    {
        name = 'gr_black_hole_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'fu_star_engine_core_item',1},
            {'fu_star_engine_heater_left_item',1},
            {'fu_star_engine_heater_item',1},
            {'fu_star_engine_cooler_up_item',1},
            {'fu_star_engine_cooler_item',1},
            {'gr_materials_stack_up_item',40},
            {'gr_materials_stack_down_item',40},
            {'gr_materials_magnet',100},
        },
        result = 'gr_black_hole_item',
        result_count = 1,
        energy_required = 200,
    },
    {
        name = 'gr_white_hole_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'fu_star_engine_core_item',1},
            {'fu_star_engine_heater_left_item',1},
            {'fu_star_engine_heater_item',1},
            {'fu_star_engine_cooler_up_item',1},
            {'fu_star_engine_cooler_item',1},
            {'gr_materials_stack_up_item',40},
            {'gr_materials_stack_down_item',40},
            {'gr_materials_magnet',100},
        },
        result = 'gr_white_hole_item',
        result_count = 1,
        energy_required = 200,
    },
    {
        name = 'gr_lab_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'gr_materials_stack_up_item',10},
            {'gr_materials_stack_down_item',10},
            {'lab',40},
            {'fu_materials_KFK',100},
            {'fu_materials_TIM',100},
            {'gr_materials_magnet',100},
        },
        result = 'gr_lab_item',
        result_count = 1,
        energy_required = 20,
    },
    --endgame

    {
        name = 'gr_red_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'automation-science-pack',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_red_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_red_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_red_data_item',36},
        },
        result = 'gr_materials_red_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },


    {
        name = 'gr_green_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'logistic-science-pack',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_green_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_green_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_green_data_item',72},
            {'gr_materials_red_item',2}
        },
        result = 'gr_materials_green_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },


    {
        name = 'gr_blue_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'chemical-science-pack',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_blue_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_blue_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_blue_data_item',155},
            {'gr_materials_green_item',2}
        },
        result = 'gr_materials_blue_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },


    {
        name = 'gr_purple_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'production-science-pack',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_purple_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_purple_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_purple_data_item',310},
            {'gr_materials_blue_item',2}
        },
        result = 'gr_materials_purple_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },
    

    {
        name = 'gr_yellow_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'utility-science-pack',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_yellow_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_yellow_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_yellow_data_item',620},
            {'gr_materials_purple_item',2}
        },
        result = 'gr_materials_yellow_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },



    {
        name = 'gr_grey_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'space-science-pack',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_grey_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_grey_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_grey_data_item',1240},
            {'gr_materials_yellow_item',2}
        },
        result = 'gr_materials_grey_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },


    {
        name = 'gr_white_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'fu_space_probe_science_item',100},
            {'gr_materials_data_item',1}
        },
        result = 'gr_materials_white_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_white_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_white_data_item',2480},
            {'gr_materials_grey_item',2}
        },
        result = 'gr_materials_white_item',
        result_count = 1,
        energy_required = 100,
        always_show_made_in = true
    },


    




    {
        name = 'gr_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_crushed_exotic_item',1},
            {'gr_materials_stabilizer_item',1},
            {'gr_materials_circuit',20},
            {'fi_modules_base_item',10}
        },
        result = 'gr_materials_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_stacked_data_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_fusor_crafting_category',
        ingredients = {
            {'gr_materials_data_item',3},
            {'gr_materials_stack_up_item',1},
            {'gr_materials_stack_down_item',1}
        },
        result = 'gr_materials_stacked_data_item',
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true
    },

    {
        name = 'gr_red_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'automation-science-pack',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_red_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_green_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'logistic-science-pack',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_green_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_blue_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'chemical-science-pack',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_blue_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_purple_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'production-science-pack',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_purple_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_yellow_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'utility-science-pack',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_yellow_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_grey_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'space-science-pack',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_grey_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_white_pack_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'gr_charger_category',
        ingredients = {
            {'fu_space_probe_science_item',100},
            {'gr_materials_stacked_data_item',1}
        },
        result = 'gr_materials_white_pack_item',
        result_count = 100,
        energy_required = 10,
        always_show_made_in = true
    },
    {
        name = 'gr_materials_charge_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'fu_space_probe_science_item',100},
            {'low-density-structure',40},
            {'gr_materials_fusion_cell_item',10},
            {'discharge-defense-equipment',10}
        },
        result = 'gr_materials_charge_item',
        result_count = 1,
        energy_required = 10,
    },
    {
        name = 'gr_materials_charge_remote_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {'gr_materials_fusion_cell_item',1}
        },
        result = 'gr_materials_charge_remote',
        result_count = 1,
        energy_required = 10,
    },

    {
        name = 'gr_circuit_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'crafting-with-fluid',
        main_product = 'gr_materials_circuit',
        ingredients = {
            {type="item", name="gr_materials_gold_wire", amount=10},
            {type="item", name="copper-cable", amount=10},
            {type="item", name="gr_materials_pcb", amount=1},
            {type="fluid", name="fi_strong_acid", amount=50},
        },
        results = {
            {type="fluid", name="water", amount=50},
            {type="item", name="gr_materials_circuit", amount=1},
        },
        energy_required = 1,
        order = 'a-b',
    },
    {
        name = 'gr_gold_wire_recipe',
        type = 'recipe',
        enabled = 'false',
        ingredients = {
            {type="item", name="fi_materials_gold", amount=1},
        },
        results = {
            {type="item", name="gr_materials_gold_wire", amount=2},
        },
        energy_required = 1,
        order = 'a-b',
    },
    {
        name = 'gr_pcb_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'chemistry',
        ingredients = {
            {type="fluid", name="petroleum-gas", amount=30},
            {type="item", name="fi_materials_glass_fiber", amount=1},
            {type="item", name="fu_materials_carbon_fiber", amount=1},
            {type="item", name="processing-unit", amount=5},
            {type="item", name="plastic-bar", amount=4},
        },
        results = {
            {type="item", name="gr_materials_pcb", amount=1},
        },
        energy_required = 2,
        order = 'a-b',
        always_show_made_in = true
    },
    {
        name = 'gr_magnet_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_magnet_category',
        main_product = 'gr_materials_magnet',
        ingredients = {
            {type="fluid", name="fu_lead_fluid", amount=50},
            {type="item", name="gr_materials_plasma_cube", amount=2},
            {type="item", name="fu_materials_magnet", amount=1},
        },
        results = {
            {type="fluid", name="fu_lead_fluid", amount=50, temperature=1500},
            {type="item", name="gr_materials_magnet", amount=1},
        },
        energy_required = 2,
        order = 'a-b',
        always_show_made_in = true
    },
    {
        name = 'gr_plasma_cube_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fu_plasma_category',
        main_product = 'gr_materials_plasma_cube',
        ingredients = {
            {type="fluid", name="fu_lead_fluid", amount=50},
            {type="item", name="fu_materials_KFK", amount=2},
            {type="item", name="fi_materials_gold", amount=1},
        },
        results = {
            {type="fluid", name="fu_lead_fluid", amount=50, temperature=1500},
            {type="item", name="gr_materials_plasma_cube", amount=1},
        },
        energy_required = 2,
        order = 'a-b',
        always_show_made_in = true
    },
})