local function config(name)
    return settings.startup['override_'..name].value
end

data:extend({
    {
        type = "recipe",
        name = "fi_lithium_to_k2",
        energy_required = 30,
        enabled = false,
        always_show_made_in = true,
        ingredients =
        {
            {"fi_crushed_lithium_item", 10},
            {type="fluid", name="mineral-water", amount=100}
        },
        result = "lithium-chloride",
        result_count = 10,
        category = "chemistry"
    },
    {
        name = 'fu_boiler_hydrogen_oxygen_3_recipe',
        type = 'recipe',
        category = 'fu_boiler_crafting_category',
        main_product = 'hydrogen',
        enabled = false,
        ingredients = {
            {type="fluid", name="water", amount=1100},
        },
        results = {
            {type="fluid", name="hydrogen", amount=1000, temperature=40},
        },
        result_count = 1,
        energy_required = 1,
        subgroup = 'fu_item_subgroup_e',
        order = 'a-a',
    },
    {
        name = 'fu_boiler_hydrogen_oxygen_recipe',
        type = 'recipe',
        category = 'fu_boiler_crafting_category',
        main_product = 'hydrogen',
        enabled = false,
        ingredients = {
            {type="fluid", name="water", amount=150},
        },
        results = {
            {type="fluid", name="hydrogen", amount=100, temperature=40},
            {type="fluid", name="oxygen", amount=50, temperature=40}
        },
        result_count = 1,
        energy_required = 1,
        subgroup = 'fu_item_subgroup_e',
        order = 'a-a',
    },
    {
        name = 'fu_boiler_hydrogen_oxygen_1_recipe',
        type = 'recipe',
        category = 'fu_boiler_crafting_category',
        main_product = 'hydrogen',
        enabled = false,
        ingredients = {
            {type="fluid", name="water", amount=300},
        },
        results = {
            {type="fluid", name="hydrogen", amount=200, temperature=40},
            {type="fluid", name="oxygen", amount=100, temperature=40}
        },
        result_count = 1,
        energy_required = 1,
        subgroup = 'fu_item_subgroup_e',
        order = 'a-a',
    },
    {
        name = 'fu_boiler_hydrogen_oxygen_2_recipe',
        type = 'recipe',
        category = 'fu_boiler_crafting_category',
        main_product = 'hydrogen',
        enabled = false,
        ingredients = {
            {type="fluid", name="water", amount=650},
        },
        results = {
            {type="fluid", name="hydrogen", amount=500, temperature=40},
            {type="fluid", name="oxygen", amount=150, temperature=40},
        },
        result_count = 1,
        energy_required = 1,
        subgroup = 'fu_item_subgroup_e',
        order = 'a-a',
    },
    {
        name = 'fu_hydrogen_recipe',
        type = 'recipe',
        category = 'oil-processing',
        main_product = 'fu_protium',
        enabled = false,
        ingredients = {
            {type="fluid", name="hydrogen", amount=100000},
        },
        results = {
            {type="fluid", name="fu_protium", amount=99998},
            {type="fluid", name="fu_deuterium", amount=10},
            {type="fluid", name="fu_tritium", amount=1}
        },
        result_count = '0.5',
        energy_required = 100,
    },
    {
        name = 'fu_exchanger_1_recipe',
        type = 'recipe',
        category = 'fu_exchanger_crafting_category',
        main_product = 'steam',
        enabled = 'false',
        ingredients = {
            {type="fluid", name="fu_lead_fluid_hot", amount=50},
            {type="fluid", name="water", amount=1000/2},
        },
        results = {
            {type="fluid", name="fu_lead_fluid_cold", amount=50},
            {type="fluid", name="steam", amount=1000/2, temperature=415},
        },
        result_count = 1,
        energy_required = 1,
        subgroup = 'fu_item_subgroup_e',
        order = 'b-a',
        always_show_made_in = true,
    },
    {
        name = 'fu_exchanger_2_recipe',
        type = 'recipe',
        category = 'fu_exchanger_crafting_category',
        main_product = 'steam',
        enabled = 'false',
        ingredients = {
            {type="fluid", name="fu_lead_fluid_hot", amount=100},
            {type="fluid", name="water", amount=1000/4},
        },
        results = {
            {type="fluid", name="fu_lead_fluid_cold", amount=100},
            {type="fluid", name="steam", amount=1000/4, temperature=975},
        },
        result_count = 1,
        energy_required = 1,
        subgroup = 'fu_item_subgroup_e',
        order = 'b-a',
        always_show_made_in = true,
    },
    {
        name = 'fu_star_engine_cooler_7_recipe',
        type = 'recipe',
        category = 'fu_star_engine_cooler_crafting_category',
        enabled = 'false',
        subgroup = 'fu_star_engine_subgroup_c',
        ingredients = {
            {type="fluid", name="fu_iron_heated", amount=500},
        },
        results = {
            {type="fluid", name="matter", amount=500},
        },
        result_count = 1,
        energy_required = 1,
    },
    {
        name = 'fu_activator_3_recipe',
        type = 'recipe',
        category = 'chemistry',
        main_product = 'fu_deuterium',
        enabled = 'false',
        ingredients = {
            {type="fluid", name="heavy-water", amount=10},
        },
        results = {
            {type="fluid", name="fu_deuterium", amount=4},
        },
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true,
    },
    {
        name = 'fu_activator_4_recipe',
        type = 'recipe',
        category = 'chemistry',
        main_product = 'fu_tritium',
        enabled = 'false',
        ingredients = {
            {type="item", name="tritium", amount=1},
        },
        results = {
            {type="fluid", name="fu_tritium", amount=10},
        },
        result_count = 1,
        energy_required = 10,
        always_show_made_in = true,
    },
    {
        name = 'fu_ki_core_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'crafting',
        ingredients = {
            {type="item", name="steel-plate", amount=100},
            {type="item", name="concrete", amount=500},
            {type="item", name="electronic-circuit", amount=100},
            {type="item", name="advanced-circuit", amount=100},
            {type="item", name="processing-unit", amount=100},
            {type="item", name="fu_space_probe_down_matter_item", amount=10},
            {type="item", name="fu_space_probe_up_matter_item", amount=10},
            {type="item", name="fu_exchanger_item", amount=10},
            {type="item", name="fu_tech_sign_item", amount=100},
            {type="item", name="fu_boiler_item", amount=10},
            --{type="item", name="fu_burner_item", amount=10},
        },
        results = {
            {type="item", name="fu_ki_core_item", amount=1},
        },
        result_count = 1,
        energy_required = 60,
    },
})

--techs
table.insert(data.raw.technology["kr-lithium-processing"].effects, {type ="unlock-recipe", recipe ="fi_lithium_to_k2"})
--table.insert(data.raw.technology["kr-matter-processing"].effects, {type ="unlock-recipe", recipe ="fu_star_engine_cooler_7_recipe"})
if (not mods["RealisticFusionPower"]) then
    table.insert(data.raw.technology["kr-fusion-energy"].effects, {type ="unlock-recipe", recipe ="fu_activator_4_recipe"})
    table.insert(data.raw.technology["kr-fusion-energy"].effects, {type ="unlock-recipe", recipe ="fu_activator_3_recipe"})
end
data.raw.recipe["fu_burner_recipe"].hidden = true

--[[
table.insert(data.raw.technology["gr_stage_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_train_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_train_plus_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_star_engine_1_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_star_engine_2_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_crafter_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_materials_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_compact_fusion_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_charger_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_kovarex_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["gr_black_hole_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["fi_modules_4_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["fi_modules_5_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})
table.insert(data.raw.technology["fi_modules_6_tech"].unit.ingredients, {"fu_space_probe_science_item", 1})

table.insert(data.raw.technology["fu_ki_plus_1_tech"].unit.ingredients, {"fi_ki_science", 1})
table.insert(data.raw.technology["fu_ki_plus_1_tech"].unit.ingredients, {"fu_ki_science", 1})
table.insert(data.raw.technology["fu_ki_plus_2_tech"].unit.ingredients, {"fi_ki_science", 1})
table.insert(data.raw.technology["fu_ki_plus_2_tech"].unit.ingredients, {"fu_ki_science", 1})
--]]

table.insert(data.raw["generator-equipment"]["fi_train_equipment_generator_item"].categories,"vehicle-equipment")

if (config("krastorio_endgame")) then
    table.insert(data.raw.recipe["kr-intergalactic-transceiver"].ingredients ,{type="item", name="gr_materials_stack_down_item", amount=40}) 
    table.insert(data.raw.recipe["kr-intergalactic-transceiver"].ingredients ,{type="item", name="gr_materials_stack_up_item", amount=40}) 
    table.insert(data.raw.recipe["kr-antimatter-reactor"].ingredients ,{type="item", name="gr_materials_stack_down_item", amount=5}) 
    table.insert(data.raw.recipe["kr-antimatter-reactor"].ingredients ,{type="item", name="gr_materials_stack_up_item", amount=5}) 
end
table.insert(data.raw.lab['kr-singularity-lab'].inputs, 'fu_space_probe_science_item')
table.insert(data.raw.lab['kr-singularity-lab'].inputs, 'fi_ki_science')
table.insert(data.raw.lab['kr-singularity-lab'].inputs, 'fu_ki_science')

table.insert(data.raw.lab['biusart-lab'].inputs, 'fu_space_probe_science_item')
table.insert(data.raw.lab['biusart-lab'].inputs, 'fi_ki_science')
table.insert(data.raw.lab['biusart-lab'].inputs, 'fu_ki_science')

data.raw.tool["fu_space_probe_science_item"].icon = "__248k__/ressources/fusion/fu_space_probe/fu_space_probe_science_item_krastorio.png"