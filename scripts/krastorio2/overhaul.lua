if settings.startup['overhaul_mode'].value then
-- indent ignored

local function add_to_recipe(recipe, item, item_amount)
    if not data.raw.recipe[recipe] then
        return
    end

    if data.raw.recipe[recipe].ingredients then
        table.insert(data.raw.recipe[recipe].ingredients, {type="item", name=item, amount=item_amount})
    end

    if data.raw.recipe[recipe].normal and data.raw.recipe[recipe].expensive then
        table.insert(data.raw.recipe[recipe].normal.ingredients, {type="item", name=item, amount=item_amount})
        table.insert(data.raw.recipe[recipe].expensive.ingredients, {type="item", name=item, amount=item_amount})
    end
end

local function add_to_recipes(table_in)
    --table structure: {{recipe, item, item_amount}, ... , ...}
    for i,v in pairs(table_in) do 
        add_to_recipe(table_in[i].recipe, table_in[i].item, table_in[i].item_amount)
    end
end

local function change_table_index(table_in, structure)
    
    local indexed_table = {}

    for _,v in ipairs(table_in) do
        local indexed_sub_table = {}
        for i,x in ipairs(v) do
            indexed_sub_table[structure[i]] = x
        end
        table.insert(indexed_table, indexed_sub_table)
    end
    return indexed_table
end

local function add_to_tech(tech, pre_tech)
    if not data.raw.technology[tech] then
        return
    end

    if not data.raw.technology[pre_tech] then
        return
    end

    table.insert(data.raw.technology[tech].prerequisites, pre_tech)
end

local function add_to_techs(table_in)
    --table structure: {{tech, pre_tech}, ... , ...}
    for i,v in pairs(table_in) do 
        add_to_tech(table_in[i].tech, table_in[i].pre_tech)
    end
end

local function remove_tech_card(tech, card)
    if not data.raw.technology[tech] then
        return
    end

    --in data.raw
    --[[
    ingredients = {
        {'automation-science-pack',1},
        {'logistic-science-pack',1},
    }
    ]]

    for i,v in ipairs(data.raw.technology[tech].unit.ingredients) do
        for j,w in ipairs(v) do
            if w == card then
                data.raw.technology[tech].unit.ingredients[i] = nil
            end
        end
    end
end

local function remove_tech_cards(table_in)
    --table structure: {{tech, card}, ... , ...}
    for i,v in pairs(table_in) do 
        remove_tech_card(table_in[i].tech, table_in[i].card)
    end
end

local function remove_pre_tech(tech, pre_tech)
    if not data.raw.technology[tech] then
        return
    end

    for i,v in ipairs(data.raw.technology[tech].prerequisites) do 
        if v == pre_tech then
            data.raw.technology[tech].prerequisites[i] = nil
        end
    end
end

local function remove_pre_techs(table_in)
    --table structure: {{tech, pre_tech}, ... , ...}
    for i,v in pairs(table_in) do 
        remove_pre_tech(table_in[i].tech, table_in[i].pre_tech)
    end
end

local function add_tech_cards(table_in)
    --table structure: {{tech, card}, ... , ...}
    for i,v in pairs(table_in) do 
        add_tech_card(table_in[i].tech, table_in[i].card)
    end
end

local function add_tech_card(tech, card)
    if not data.raw.technology[tech] then 
        return
    end

    if contains_tech_card(data.raw.technology[tech].unit.ingredients, card) then
        return
    end

    table.insert(data.raw.technology[tech].unit.ingredients, {card, 1})
end

function contains_tech_card(table_in, card)
    for i,v in ipairs(table_in) do
        if v[1] == card then
            return true
        end
    end
    return false
end

--[FIND TECHS AFTER GIVEN TECH RECURSIVELY]
--find all techs after given tech in tech tree and elimate doubles from result table


function walk_techs(pos, break_con)
    --one iteration:
    --find all leaves for this tech
    --get their lists and add them to own
    --return own list

    local leaves = find_following_techs(pos, break_con)
    table_out = {}

    if is_table_empty(leaves) then
        --meaning this is at end of tech tree

        table.insert(table_out, pos)
        return table_out
    end

    for i,v in ipairs(leaves) do
        --for every leaf tech, i = index, v = tech_pos

        table.insert(table_out, pos)
        table_out = append_table(table_out, walk_techs(v, break_con))
    end
    
    return table_out
end

function append_table(table_a, table_b)
    for i,v in ipairs(table_b) do table.insert(table_a, v) end return table_a
end

function find_following_techs(tech, break_con)
    --finds all techs with given tech as prerequisite and returns them in table form
    local return_table = {}

    for i,v in pairs(data.raw.technology) do
        --i = techname, v = data.raw.technology[techname]
        if data.raw.technology[i].prerequisites then 
            for j,w in ipairs(data.raw.technology[i].prerequisites) do
                --prerequisites = {'el_energy_tech'}
                --j = index, w = techname
    
                if w == tech then
                    if not (i == break_con) then
                        table.insert(return_table, i)
                    end
                end
            end
        end
    end

    return return_table
end

function is_table_empty(table_in)
    local next_ele = next
    if next_ele(table_in) == nil then 
        return true 
    else
        return false
    end
end

function del_doubles(table_in)
    --table_in is keyed table in form of {start_tech, tech_a, tech_b ....}

    table_out = {}
    for i,v in ipairs(table_in) do 
        --i = index, v = tech

        if not is_in_table(table_out, v) then
            table.insert(table_out, v)
        end
    end

    return table_out
end

function is_in_table(table_in, arg)
    --check if arg is an value of indexed table
    
    for i,v in ipairs(table_in) do
        if v == arg then
            return true
        end
    end

    return false
end

local function add_cards_to_tree(table_in, card)
    for i,v in ipairs(table_in) do
        add_tech_card(v, card)
    end
end

--===================================================================================================================
--                              248k item/tech integration with Krastorio2
--===================================================================================================================

--[BUILDINGS]

building_table = {
    {"kr-electrolysis-plant",           "el_materials_ALK", 10},
    {"kr-filtration-plant",             "el_materials_ALK", 10},
    --{"kr-electrolysis-plant",           "el_materials_ALK", 10},
    --{"kr-electrolysis-plant",           "el_materials_ALK", 10},
    {"kr-fluid-burner",                 "el_materials_ALK", 2},
    {"kr-atmospheric-condensor",        "el_materials_ALK", 6},
    {"el_solar_recipe",                   "solar-panel", 2},
    {"solar-panel",                     "el_materials_ALK", 6},
    {"kr-advanced-solar-panel",         "el_solar_item", 1},
    {"kr-advanced-solar-panel",         "fi_materials_GFK", 2},
    {"kr-fuel-refinery",                "el_materials_ALK", 4},
    {"kr-gas-power-station",            "el_materials_ALK", 10},

    {"buisart-lab",                     "fi_materials_NFK", 10},
    {"kr-electric-mining-drill-mk2",    "fi_materials_GFK", 6},
    {"kr-research-server",              "fi_materials_NFK", 8},
    {"kr-research-server",              "fi_materials_GFK", 8},
    {"kr-air-purifier",                 "fi_materials_NFK", 4},
    {"kr-bio-lab",                      "fi_materials_NFK", 20},
    {"kr-atmospheric-condensor",        "fi_materials_GFK", 4},
    {"kr-fusion-reactor",               "fu_tech_sign_item",200},
    {"fu_tokamak_reactor_recipe",         "kr-fusion-reactor",1},
    {"kr-advanced-steam-turbine",       "fu_materials_KFK", 10},
    --logistics
    {"kr-fast-loader",                  "el_materials_ALK", 4},
    {"kr-express-loader",               "fi_materials_GFK", 4},
    {"kr-advanced-transport-belt",      "fu_materials_KFK", 1},
    {"kr-advanced-splitter",            "fu_materials_KFK", 3},
    {"kr-advanced-loader",              "fu_materials_KFK", 4},
    {"kr-advanced-underground-belt",    "fu_materials_KFK", 8},

    {"kr-advanced-assembling-machine",  "fu_materials_KFK", 6},
    {"kr-advanced-furnace",             "fu_materials_KFK", 6},
    {"kr-advanced-chemical-plant",      "fu_materials_KFK", 6},
    {"kr-matter-plant",                 "fu_materials_KFK", 12},
    {"kr-matter-assembler",             "fu_materials_KFK", 8},
    {"kr-stabilizer-charging-station",  "fu_materials_KFK", 6},
    {"kr-large-roboport",               "fi_robo_port_item", 1},
    {"kr-antimatter-reactor",           "fu_tokamak_reactor_item", 1},
    {"kr-intergalactic-transceiver",    "fu_tokamak_reactor_item", 1},
    {"kr-intergalactic-transceiver",    "gr_materials_magnet", 100},
    {"kr-intergalactic-transceiver",    "gr_materials_fusion_cell_item", 10},


}

--[ITEMS]

item_table = {
    {"productivity-module-2",   "fi_modules_core_item", 1},
    {"productivity-module-3",   "fi_modules_core_item", 3},
    {"speed-module-2",          "fi_modules_core_item", 1},
    {"speed-module-3",          "fi_modules_core_item", 3},
    {"effectivity-module-2",    "fi_modules_core_item", 1},
    {"effectivity-module-3",    "fi_modules_core_item", 3},
    {"ai-core",                 "fu_materials_energy_crystal", 1},
    {"fusion-reactor-equipment","fu_materials_energy_crystal", 25},
    {"imersium-plate",          "fi_crushed_crystal_item", 4},
    {"lithium-sulfur-battery",  "el_lithium_battery", 1},
    {"empty-dt-fuel",           "fu_materials_KFK", 2},
    {"fu_empty_container_recipe","empty-dt-fuel", 1},
    {"energy-control-unit",     "fu_materials_energy_crystal", 1},
    {"matter-stabilizer",       "fu_materials_empty_container", 1},

    --military
    {"energy-shield-equipment", "el_energy_crystal_item", 5},
    {"energy-shield-mk2-equipment","fi_energy_crystal_item", 5},
    {"energy-shield-mk3-equipment","fu_materials_energy_crystal", 5},
    {"battery-equipment",       "el_lithium_battery", 1},

    --science
    {"chemical-science-pack",        "el_energy_crystal_item",3},
    {"production-science-pack",      "fi_materials_titan",  1},
    {"utility-science-pack",         "fi_materials_neodym", 1},
    {"matter-tech-card",             "fu_tech_sign_item", 5},
    {"singularity-tech-card",        "gr_materials_magnet", 1},
}

--[TECH]

tech_table = {
    {"kr-fluids-chemistry",         "el_materials_ALK"},
    {"kr-advanced-solar-panel",     "el_solar_tech"},
    {"kr-fluids-chemistry",         "el_materials_ALK"},
    {"kr-fluid-excess-handling",    "el_burner_tech"},
    {"kr-advanced-lab",             "fi_materials_tech"},
    {"kr-electric-mining-drill-mk2","fi_materials_tech"},
    {"kr-kr-research-server",       "fi_materials_tech"},
    {"kr-air-purification",         "fi_materials_tech"},
    {"kr-bio-processing",           "fi_materials_tech"},
    {"kr-logistic-4",               "fu_KFK_tech"},
    {"logistics-2",                 "el_materials_ALK"},
    {"fi_robo_tech",                "construction-robotics"},
    {"fi_robo_tech",                "logistic-robotics"},
    {"fu_energy_tech",              "kr-fusion-energy"},
    {"kr-fusion-energy",            "fu_KFK_tech"},
    {"kr-ai-core",                  "fu_crystal_tech"},
    {"fusion-reactor-equipment",    "fu_crystal_tech"},
    {"kr-imersium-processing",      "fu_crystal_tech"},
    {"kr-lithium-sulfur-battery",   "el_lithium_tech"},
    {"kr-matter-tech-card",         "fu_energy_tech"},
    {"kr-singularity-tech-card",    "gr_magnet_tech"},
    {"kr-energy-control-unit",      "fu_crystal_tech"},
    {"kr-advanced-assembling-machine","fu_KFK_tech"},
    {"kr-advanced-furnace",         "fu_KFK_tech"},
    {"kr-advanced-chemical-plant",  "fu_KFK_tech"},
    {"kr-advanced-roboports",       "fi_robo_tech"},
    {"kr-matter-processing",        "fu_KFK_tech"},
    {"fu_star_engine_tech",         "kr-matter-coal-processing"},
    {"fu_star_engine_tech",         "kr-matter-copper-processing"},
    {"fu_star_engine_tech",         "kr-matter-iron-processing"},
    {"fu_star_engine_tech",         "kr-matter-minerals-processing"},
    {"fu_star_engine_tech",         "kr-matter-oil-processing"},
    {"fu_star_engine_tech",         "kr-matter-rare-materials-processing"},
    {"fu_star_engine_tech",         "kr-matter-stone-processing"},
    {"fu_star_engine_tech",         "kr-matter-uranium-processing"},
    {"fu_star_engine_tech",         "kr-matter-water-processing"},
    {"gr_stage_tech",               "kr-advanced-tech-card"},
    {"gr_charger_tech",             "kr-singularity-tech-card"},
    {"gr_compact_fusion_tech",      "kr-singularity-tech-card"},
    {"kr-intergalactic-transceiver","gr_magnet_tech"},
    {"kr-intergalactic-transceiver","gr_compact_fusion_tech"},
    {"el_lithium_tech",             "logistic-science-pack"},
    {"energy-shield-equipment",     "el_gower_tech"},
    {"energy-shield-equipment",     "el_energy_tech"},
    {"energy-shield-mk2-equipment", "fi_energy_tech"},
    {"energy-shield-mk2-equipment", "fi_crystal_tech"},
    {"kr-energy-shield-mk3-equipment", "fu_energy_tech"},
    {"kr-energy-shield-mk3-equipment", "fu_crystal_tech"},
    {"solar-panel-equipment",       "el_energy_tech"},
    {"battery-equipment",           "el_energy_tech"},
    {"kr-imersite-solar-panel-equipment","fu_energy_tech"},
    {"kr-tesla-coil",               "fi_energy_tech"},
    {"kr-portable-generator",       "fi_energy_tech"},
    {"battery-mk2-equipment",       "fi_energy_tech"},

    --energy tech
    {"kr-fuel",                     "el_energy_tech"},
    {"kr-gas-power-station",        "el_energy_tech"},
    {"kr-nuclear-reactor-equipment","fi_energy_tech"},
    {"nuclear-fuel-reprocessing",   "fi_energy_tech"},
    {"kr-nuclear-locomative",       "fi_energy_tech"},
    

}

--[ADD TECH CARDS]

add_card_table = {
    --{"el_purifier_tech",            "space-science-pack"},
    
}

--[REMOVE TECH CARDS]

remove_card_table = {
    {"el_purifier_tech",            "logistic-science-pack"},
    {"el_arc_furnace_tech",         "logistic-science-pack"},
    {"el_caster_tech",              "logistic-science-pack"},
    {"el_ALK_tech",                 "logistic-science-pack"},
}

--[REMOVE PREREQUISITES]

pre_tech_table = {
    {"el_purifier_tech",            "logistic-science-pack"},
}

--===================================================================================================================
--                              changes in entities and other protypes 
--===================================================================================================================

data.raw["solar-panel"]["el_solar_entity"].production = "220kW"
data.raw["solar-panel"]["kr-advanced-solar-panel"].production = "480kW"
data.raw.item["el_materials_ALK"].stack_size = 200
data.raw.recipe["dt-fuel"].ingredients = {
    {type="item", name="empty-dt-fuel", amount=1}, 
    {type="fluid", name="fu_deuterium", amount=6}, 
    {type="fluid", name="fu_tritium", amount=6}
}

data.raw["assembling-machine"]["fu_star_engine_core_entity"].energy_usage = "2GW"
data.raw["assembling-machine"]["fu_star_engine_cooler_up_entity"].energy_usage = "1GW"
data.raw["assembling-machine"]["fu_star_engine_cooler_entity"].energy_usage = "1GW"
data.raw["assembling-machine"]["fu_star_engine_heater_left_entity"].energy_usage = "1GW"
data.raw["assembling-machine"]["fu_star_engine_heater_entity"].energy_usage = "1GW"

table.insert(data.raw.technology["fu_star_engine_iron_tech"].effects, {type ="unlock-recipe", recipe ="fu_star_engine_cooler_7_recipe"})

data:extend({
    {
        name = 'fi_arc_glass_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'el_arc_furnace_category',
        ingredients = {
            {type="item", name="glass", amount=3},
            {type="item", name="quartz", amount=1},
            {type="item", name="coke", amount=1}
        },
        results = {
            {type="fluid", name="fi_arc_glass", amount=300},
        },
        energy_required = 1,
        order = 'a-b',
        always_show_made_in = true
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
            {type="fluid", name="fu_tritium", amount=3},
        },
        result_count = 1,
        energy_required = 1,
        always_show_made_in = true,
    },
    {
        name = 'fu_activator_3_recipe',
        type = 'recipe',
        category = 'chemistry',
        main_product = 'fu_deuterium',
        enabled = 'false',
        ingredients = {
            {type="fluid", name="heavy-water", amount=10},
            {type="item", name="improved-pollution-filter", amount=1},
        },
        results = {
            {type="fluid", name="fu_deuterium", amount=3},
        },
        result_count = 1,
        energy_required = 10,
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
            {type="fluid", name="matter", amount=100},
        },
        result_count = 1,
        energy_required = 1,
    },
})

--===================================================================================================================
--                              structures and adding 
--===================================================================================================================

recipe_structure = {"recipe", "item", "item_amount"}
tech_structure = {"tech", "pre_tech"}
card_structure = {"tech", "card"}
break_con = "gr_red_tech"

add_to_recipes(change_table_index(building_table, recipe_structure))
add_to_recipes(change_table_index(item_table, recipe_structure))
add_to_techs(change_table_index(tech_table, tech_structure))
add_tech_cards(change_table_index(add_card_table, tech_structure))
remove_pre_techs(change_table_index(pre_tech_table, tech_structure))
remove_tech_cards(change_table_index(remove_card_table, card_structure))

add_cards_to_tree(del_doubles(walk_techs("fu_star_engine_tech", break_con)), "matter-tech-card")
add_cards_to_tree(del_doubles(walk_techs("gr_stage_tech", break_con)), "advanced-tech-card")
add_cards_to_tree(del_doubles(walk_techs("gr_charger_tech", break_con)), "singularity-tech-card")
add_cards_to_tree(del_doubles(walk_techs("gr_compact_fusion_tech", break_con)), "singularity-tech-card")
add_cards_to_tree(del_doubles(walk_techs("kr-singularity-tech-card", break_con)), "fu_space_probe_science_item")

if mods["RealisticFusionPower"] then
    
    data.raw.recipe["fu_tokamak_reactor_recipe"].ingredients = {
        {'fu_materials_magnet',200},
        {'fu_materials_TIM',400},
        {'fu_materials_KFK',400},
        {'concrete',500},
        {'fu_materials_energy_crystal',200},
        {'pump',80},
        {'processing-unit',500},
        {'fu_tech_sign_item',2000},
    }

    data.raw.recipe["fu_empty_container_recipe"].ingredients = {
        {type="item", name="fu_materials_magnet", amount=2},
        {type="item", name="fu_materials_KFK", amount=6},
        {type="item", name="fu_materials_energy_crystal", amount=2},
        {type="item", name="fu_tech_sign_item", amount=10},
    }

end

end --indent ignored

--===================================================================================================================
--                              math and meta 
--===================================================================================================================

--[FUSION CALC]
--[[
    1 D/s = 1 Neutron Fluid
    1 T/s = 2 Neutron Fluid

    TOKAMAK:
        D2 Fusion:
        110.000 cold lead + 200 D | 100s = 110.000 hot lead
        -> 1.100 hot lead/s
            A: (415 dec steam) 1 hot lead = 10 steam
                -> 11.000 hot steam/s | 50 (415 dec steam)/s = 10MW
                    == 2.200 MW

            B: (975 dec steam) 1 hot lead = 2.5 steam
                -> 2.750 hot steam/s | 100 (975 dec steam)/s = 100MW
                    == 2.750 MW

        DT Fusion:
        180.000 cold lead + 100 D + 100 T | 100s = 180.000 hot lead
        -> 1.800 hot lead/s
            A: (415 dec steam) 1 hot lead = 10 steam
                -> 18.000 hot steam/s | 50 (415 dec steam)/s = 10MW
                    == 3.600 MW

            B: (975 dec steam) 1 hot lead = 2.5 steam
                -> 4.500 hot steam/s | 100 (975 dec steam)/s = 100MW
                    == 4.500 MW
    STELLARATOR:
        DT Fusion:
        1.000 cold lead + 1 D + 1 T | 1s = 1.000 hot lead
        -> 1.000 hot lead/s
            A: (415 dec steam) 1 hot lead = 10 steam
                -> 10.000 hot steam/s | 50 (415 dec steam)/s = 10MW
                    == 2.000 MW

            B: (975 dec steam) 1 hot lead = 2.5 steam
                -> 2.500 hot steam/s | 100 (975 dec steam)/s = 100MW
                    == 2.500 MW

        PL Fusion:
        1.000 cold lead + 15 P + 15 L | 1s = 1.000 hot lead
        -> 1.000 hot lead/s
            A: (415 dec steam) 1 hot lead = 10 steam
                -> 10.000 hot steam/s | 50 (415 dec steam)/s = 10MW
                    == 2.000 MW

            B: (975 dec steam) 1 hot lead = 2.5 steam
                -> 2.500 hot steam/s | 100 (975 dec steam)/s = 100MW
                    == 2.500 MW

        DT Breeder Fusion:
        300 cold lead + 1 D + 1 T | 1s = 300 hot lead
        -> 300 hot lead/s
            A: (415 dec steam) 1 hot lead = 10 steam
                -> 3.000 hot steam/s | 50 (415 dec steam)/s = 10MW
                    == 600 MW

            B: (975 dec steam) 1 hot lead = 2.5 steam
                -> 750 hot steam/s | 100 (975 dec steam)/s = 100MW
                    == 750 MW

        PL Breeder Fusion:
        300 cold lead + 15 P + 15 L | 1s = 300 hot lead
        -> 300 hot lead/s
            A: (415 dec steam) 1 hot lead = 10 steam
                -> 3.000 hot steam/s | 50 (415 dec steam)/s = 10MW
                    == 600 MW

            B: (975 dec steam) 1 hot lead = 2.5 steam
                -> 750 hot steam/s | 100 (975 dec steam)/s = 100MW
                    == 750 MW

    KRASTORIO 2:
        DT Fusion:
        1 T(K2) + 10 HW(K2) | 1s = 2.000 (975 dec steam)
        -> 2.000 hot steam/s | 100 (975 dec steam)/s = 100MW
            == 2.000 MW
]]

--===================================================================================================================
--                              sumarize 
--===================================================================================================================

--[[
    
    Recipe              Input/s             Output (415 dec)        Output (975 dec)
    TOKAMAK:
    D2                  2 D                 2.200 MW                2.750 MW
    DT                  1 D + 1 T           3.600 MW                4.500 MW
    STELLARATOR:
    DT                  1 D + 1 T           2.000 MW                2.500 MW
    PL                  15 P + 15 L         2.000 MW                2.500 MW
    DT + NF             1 D + 1 T           600 MW                  750 MW
    PL + NF             15 P + 15 L         600 MW                  750 MW
    KRASTORIO 2:
    DT Cell             1/5 T(K2) + 2 HW(K2) -                       2.000 MW
    
]]
