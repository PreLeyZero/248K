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

    for i,v in ipairs(data.raw.technology[tech].unit.ingredients) do
        for j,w in ipairs(v) do
            if w == card then
                v = nil
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

--===================================================================================================================
--                              248k items to Krastorio2 recipes 
--===================================================================================================================

--[BUILDINGS]

building_table = {

}

--[ITEMS]

item_table = {
    {"productivity-module-2",   "fi_modules_core_item", 1},
    {"productivity-module-3",   "fi_modules_core_item", 3},
    {"speed-module-2",          "fi_modules_core_item", 1},
    {"speed-module-3",          "fi_modules_core_item", 3},
    {"effectivity-module-2",    "fi_modules_core_item", 1},
    {"effectivity-module-3",    "fi_modules_core_item", 3},
}

--[TECH]

tech_table = {

}

--[REMOVE TECH CARDS]

card_table = {
    {"el_purifier_tech",            "logistic-science-pack"},
    {"el_arc_furnace_tech",         "logistic-science-pack"},
    {"el_caster_tech",              "logistic-science-pack"},
    {"el_ALK_tech",                 "logistic-science-pack"},
}

--===================================================================================================================
--                              structure and adding 
--===================================================================================================================


recipe_structure = {"recipe", "item", "item_amount"}
tech_structure = {"tech", "pre_tech"}
card_structure = {"tech", "card"}

add_to_recipes(change_table_index(building_table, recipe_structure))
add_to_recipes(change_table_index(item_table, recipe_structure))
add_to_techs(change_table_index(tech_table, tech_structure))
remove_tech_cards(change_table_index(card_table, card_structure))