data:extend({
    {
        name = 'fu_fusor_tech',
        type = 'technology',
        icon = '__248k__/ressources/techs/fu_fusor_tech.png',
        icon_size = 128,
        prerequisites = {
            'fu_magnet_tech','fu_basic_elements_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusor_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_1_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_2_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_3_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_4_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_5_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_6_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fu_fusion_card_7_recipe',
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
    {
        name = 'fu_fusion_card_3_recipe',
        type = 'recipe',
        category = 'fu_fusor_crafting_category',
        enabled = 'false',
        ingredients = {
            {type="fluid", name="fu_lithium_6", amount=100},
            {type="fluid", name="fu_helium_3", amount=100},
        },
        result = 'fu_materials_fusion_card',
        result_count = 100,
        energy_required = 100,
        always_show_made_in = true,
    },
    {
        name = 'fu_fusion_card_6_recipe',
        type = 'recipe',
        category = 'fu_fusor_crafting_category',
        enabled = 'false',
        ingredients = {
            {type="fluid", name="fu_deuterium", amount=100},
            {type="fluid", name="fu_helium_3", amount=100},
        },
        result = 'fu_materials_fusion_card',
        result_count = 20,
        energy_required = 100,
        always_show_made_in = true,
    },
})