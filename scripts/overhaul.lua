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
--===================================================================================================================
--                              248k items to vanilla recipes 
--===================================================================================================================

--[BUILDINGS]

building_table = {
    {"assembling-machine-2",    "el_materials_ALK", 5},
    --
    --{"fast-inserter",           "el_aluminum_item", 2},
    --{"long-handed-inserter",    "el_aluminum_item", 2},
    --
    {"engine-unit",             "el_materials_ALK", 5},
    {"fast-transport-belt",     "el_materials_ALK", 1},
    {"fast-splitter",           "el_materials_ALK", 3},
    {"fast-underground-belt",   "el_materials_ALK", 8},
    {"chemical-plant",          "el_materials_ALK", 10},
    {"oil-refinery",            "el_materials_ALK", 10},
    {"medium-electric-pole",    "el_materials_ALK", 4},
    {"big-electric-pole",       "el_materials_ALK", 8},

    {"stack-inserter",          "el_energy_crystal_item", 2},

    {"express-splitter",        "fi_materials_GFK", 3},
    {"express-transport-belt",  "fi_materials_GFK", 1},
    {"express-underground-belt","fi_materials_GFK", 8},
    {"electric-furnace",        "fi_materials_GFK", 12},
    {"centrifuge",              "fi_materials_GFK", 25},
    {"steam-turbine",           "fi_materials_GFK", 20},
    {"heat-exchanger",          "fi_materials_GFK", 10},
    {"heat-pipe",               "fi_materials_titan",2},

    {"rocket-silo",             "fu_materials_KFK", 40},

    {"beacon",                  "fi_materials_titan",   12},
    {"substation",              "fi_materials_titan",   6},
    {"assembling-machine-3",    "fi_materials_titan",   6},
}

--[ITEMS]

item_table = {
    {"advanced-circuit",        "el_materials_ceramic", 5},
    {"processing-unit",         "fi_materials_gold",    3},
    {"electric-engine-unit",    "fi_materials_gold",    3},
    {"flying-robot-frame",      "fi_materials_neodym",  6},
    {"productivity-module-2",   "fi_modules_core_item", 1},
    {"productivity-module-3",   "fi_modules_core_item", 3},
    {"speed-module-2",          "fi_modules_core_item", 1},
    {"speed-module-3",          "fi_modules_core_item", 3},
    {"effectivity-module-2",    "fi_modules_core_item", 1},
    {"effectivity-module-3",    "fi_modules_core_item", 3},
    {"satellite",               "fu_materials_KFK",     10},

    --{"automation-science-pack",    "fi_modules_core_item",  3},
    --{"logistic-science-pack",      "fi_modules_core_item",  3},
    {"chemical-science-pack",        "el_energy_crystal_item",3},
    {"production-science-pack",      "fi_materials_titan",  1},
    {"utility-science-pack",         "fi_materials_neodym", 1},
    
}

--[TECHS]

tech_table = {
    {"el_grower_tech",          "el_kerosene_tech"},
    {"automation-2",            "el_ALK_tech"},
    {"chemical-science-pack",   "el_grower_tech"},
    {"engine",                  "el_ALK_tech"},
    {"oil-processing",          "el_ALK_tech"},
    {"electric-energy-distribution-1",  "el_ALK_tech"},
    {"el_energy_tech",          "solar-energy"},
    {"stack-inserter",          "el_grower_tech"},
    {"electric-engine",         "fi_caster_tech"},
    {"robotics",                "fi_caster_tech"},
    {"production-science-pack", "fi_caster_tech"},
    {"utility-science-pack",    "fi_caster_tech"},
    {"electric-energy-distribution-2",  "fi_caster_tech"},
    {"uranium-processing",      "fi_materials_tech"},
    {"advanced-electronics-2",  "fi_materials_tech"},
    {"fi_energy_tech",          "nuclear-power"},
    {"nuclear-power",           "fi_materials_tech"},
    {"effect-transmission",     "fi_materials_tech"},
    {"automation-3",            "fi_materials_tech"},
    {"logistics-3",             "fi_materials_tech"},
    {"effectivity-module-2",    "fi_modules_1_tech"},
    {"speed-module-2",          "fi_modules_1_tech"},
    {"productivity-module-2",   "fi_modules_1_tech"},
    {"kovarex-enrichment-process",   "el_ki_eff_1_tech"},
    {"kovarex-enrichment-process",   "fi_ki_eff_1_tech"},
    {"rocket-silo",             "fu_KFK_tech"},
    {"space-science-pack",      "fu_KFK_tech"},
    {"el_train_tech",           "railway"},
    {"el_kerosene_tech",        "oil-processing"},
    {"fi_refining_tech",        "uranium-processing"},
    {"fi_crafter_tech",         "fi_refining_tech"},
    {"el_solar_tech",           "concrete"},
    {"fusion-reactor-equipment","fu_energy_tech"},

    --add science packs
    {"fi_stage_tech",           "chemical-science-pack"},
    {"fu_stage_tech",           "utility-science-pack"},
    {"el_purifier_tech",        "logistic-science-pack"},
    {"fu_tokamak_tech",         "production-science-pack"},
    {"fu_space_probe_1_tech",   "production-science-pack"},
    {"fu_space_probe_1_tech",   "space-science-pack"},
    {"fu_star_engine_tech",     "space-science-pack"},
    {"fu_hydrogen_1_tech",      "production-science-pack"},
    {"fu_hydrogen_2_tech",      "space-science-pack"},
}

--===================================================================================================================
--                              structures and adding 
--===================================================================================================================

recipe_structure = {"recipe", "item", "item_amount"}
tech_structure = {"tech", "pre_tech"}

add_to_recipes(change_table_index(building_table, recipe_structure))
add_to_recipes(change_table_index(item_table, recipe_structure))
add_to_techs(change_table_index(tech_table, tech_structure))