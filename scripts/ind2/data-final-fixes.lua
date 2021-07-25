local function sprite(name)
    return '__248k__/ressources/techs/'..name
end

data.raw["assembling-machine"]["oil-refinery"].fixed_recipe = nil
data.raw["recipe"]["fi_materials_steel_recipe"].result = "steel-ingot"
data.raw["recipe"]["fi_materials_steel_recipe"].result_count = 16
data.raw["recipe"]["fu_robo_logistic_recipe"].ingredients = {
    {type="item", name="logistic-robot", amount=2},
    {type="item", name="fu_tech_sign_item", amount=2},
    {type="item", name="fi_energy_crystal_item", amount=3},
    {type="item", name="low-density-structure", amount=20},
    {type="item", name="el_lithium_battery", amount=10},
    {type="item", name="gyroscope", amount=8},
}
data.raw["recipe"]["fu_robo_construction_recipe"].ingredients = {
    {type="item", name="logistic-robot", amount=2},
    {type="item", name="fu_tech_sign_item", amount=2},
    {type="item", name="fi_energy_crystal_item", amount=3},
    {type="item", name="low-density-structure", amount=20},
    {type="item", name="el_lithium_battery", amount=10},
    {type="item", name="gyroscope", amount=8},
}
data.raw["recipe"]["fu_star_engine_caster_1_recipe"].results = {{type="item", name="iron-ingot", amount=500}}
data.raw["recipe"]["fu_star_engine_caster_2_recipe"].results = {{type="item", name="copper-ingot", amount=500}}
data.raw["recipe"]["gr_steel_recipe"].results = {{type="item", name="steel-ingot", amount=500}}
data:extend({
    {
        name = 'gr_stainless_steel_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="stainless-ingot", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_invar_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="invar-ingot", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_nickel_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="cupronickel-ingot", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_chrome_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="chromium-ingot", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_gold_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="gold-ingot", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_tellerium_recipe',
        type = 'recipe',
        category = 'crafting-with-fluid',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_e',
        ingredients = {
            {type="fluid", name="fu_iron", amount=500},
        },
        results = {
            {type="item", name="tellurium-ingot", amount=500},
        },
        result_count = 1,
        energy_required = 6,
    },
    {
        name = 'gr_ind2_tech',
        type = 'technology',
        icon = sprite('fu_star_engine_tech.png'),
        icon_size = 128,
        prerequisites = {
            'gr_star_engine_2_tech'
        },
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'gr_stainless_steel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_invar_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_nickel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_chrome_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_gold_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'gr_tellerium_recipe',
            }
        },
        unit = {
            count = '8000',
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