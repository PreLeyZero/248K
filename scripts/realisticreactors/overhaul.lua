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


--===================================================================================================================
--                              248k item/tech integration with Krastorio2
--===================================================================================================================

--[BUILDINGS]

building_table = {
    --{"kr-electrolysis-plant",           "el_materials_ALK", 10},

}

--[ITEMS]

item_table = {
    {"fi_train_equipment_generator_recipe",   "fi_tech_fuel", 10},
    {"fi_equipment_player_reactor_recipe",    "fi_tech_fuel", 10},
    {"fu_tech_sign_recipe",                   "fi_tech_fuel", 1},
    
}

--[TECH]

tech_table = {
    {"fi_energy_tech",            "fi_solid_reactor_tech"},
    {"nuclear-power",             "fi_energy_tech"},
    {"fi_solid_reactor_tech",     "fi_materials_tech"},
    {"fi_train_tech",             "nuclear-power"},
    {"fi_refining_tech",          "fi_energy_tech"},
    {"nuclear-power",             "fi_refining_tech"},
}

--[ADD TECH CARDS]

add_card_table = {
    --{"el_purifier_tech",            "space-science-pack"},
    
}

--[REMOVE TECH CARDS]

remove_card_table = {
    --{"el_purifier_tech",            "logistic-science-pack"},
    
}

--[REMOVE PREREQUISITES]

pre_tech_table = {
    --{"nuclear-power",            "effectivity-module-2"},
    {"nuclear-power",            "uranium-processing"},
    {"fi_energy_tech",           "nuclear-power"},
    {"fi_solid_reactor_tech",    "fi_refining_tech"},
    {"fi_solid_reactor_tech",    "fi_energy_tech"},
    
    
}

--===================================================================================================================
--                              changes in entities and other protypes 
--===================================================================================================================

data.raw.item["uranium-fuel-cell"].localised_name = {"item-name.uranium-fuel-cell-updated"}
data.raw.item["uranium-fuel-cell"].localised_description = {"item-description.uranium-fuel-cell-updated"}

data.raw.technology["nuclear-fuel-reprocessing"].hidden = true

data.raw.reactor["fi_solid_reactor_entity"] = nil
data.raw.reactor["realistic-reactor-breeder"].energy_source.fuel_categories = {"fi_advanced_fuel", "fi_basic_fuel"}
data.raw.reactor["realistic-reactor-normal"].energy_source.fuel_categories = {"fi_advanced_fuel", "fi_basic_fuel"}
data.raw.reactor["realistic-reactor"].energy_source.fuel_categories = {"fi_advanced_fuel", "fi_basic_fuel"}
for i=1, 250 do
    data.raw.reactor["realistic-reactor-"..i].energy_source.fuel_categories = {"fi_advanced_fuel", "fi_basic_fuel"}
end


table.insert(data.raw.technology["nuclear-power"].effects, { 
    type = 'unlock-recipe',
    recipe = 'fi_advanced_fuel_recipe',
})
table.insert(data.raw.technology["nuclear-power"].effects, { 
    type = 'unlock-recipe',
    recipe = 'fi_pure_fuel_recipe',
})
table.insert(data.raw.technology["nuclear-power"].effects, { 
    type = 'unlock-recipe',
    recipe = 'fi_advanced_thorium_fuel_recipe',
})
table.insert(data.raw.technology["nuclear-power"].effects, { 
    type = 'unlock-recipe',
    recipe = 'fi_advanced_fuel_recycle_recipe',
})
table.insert(data.raw.technology["nuclear-power"].effects, { 
    type = 'unlock-recipe',
    recipe = 'fi_advanced_thorium_fuel_recycle_recipe',
})
table.insert(data.raw.technology["nuclear-power"].effects, { 
    type = 'unlock-recipe',
    recipe = 'fi_pure_fuel_recycle_recipe',
})

data.raw.recipe["realistic-reactor"].ingredients = {
    {"fi_solid_reactor_item", 1}, {"fi_tech_fuel", 20}, {"heat-pipe", 20}
}

data.raw.recipe["breeder-reactor"].ingredients = {
    {"fi_solid_reactor_item", 1}, {"fi_tech_fuel", 40}, {"heat-pipe", 20}, {"productivity-module-3", 3}
}

data:extend({
    {
        name = 'fi_test_fuel',
        type = 'item',
        icon = '__248k__/ressources/fission/fi_fuel/fi_fuel_test_item.png',
        icon_size = 64,
        stack_size = 20,
        subgroup = 'fi_item_subgroup_b',
        fuel_category = 'fi_test_fuel',
        fuel_value = '50MJ',
        fuel_glow_color = {r=0.1,g=0.74,b=0.39,a=0.5},
        order = 'x-a',
        burnt_result = 'fi_test_used_fuel',
    },
    {
        name = 'fi_test_used_fuel',
        type = 'item',
        icon = '__248k__/ressources/fission/fi_fuel/fi_fuel_test_used_item.png',
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_b',
        order = 'x-b',
    },
    {
        name = 'fi_tech_fuel',
        type = 'item',
        icon = '__248k__/ressources/fission/fi_fuel/fi_fuel_tech_item.png',
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_b',
        order = 'x-c',
    },
    {
        name = 'fi_test_fuel_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'crafting',
        ingredients = {
            {'uranium-238',2},
            {'el_materials_ALK',5},
        },
        result = 'fi_test_fuel',
        result_count = 1,
        energy_required = 2,
        order = 'b-b',
    },
    {
        name = 'fi_tech_fuel_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'crafting',
        ingredients = {
            {'fi_test_used_fuel', 1},
            {'chemical-science-pack', 2},
            {'uranium-238', 2},
        },
        result = 'fi_tech_fuel',
        result_count = 1,
        energy_required = 1,
        order = 'b-b',
    },
    {
        name = 'fi_use_tech_fuel_recipe',
        type = 'recipe',
        enabled = 'false',
        category = 'fi_test_fuel_crafting_category',
        ingredients = {
            {'fi_test_fuel', 1}
        },
        result = 'fi_test_used_fuel',
        result_count = 1,
        energy_required = 5,
        order = 'b-b',
        hidden = true,
    },
    {
        name = 'fi_solid_reactor_tech',
        type = 'technology',
        icon = '__248k__/ressources/techs/fi_solid_reactor_tech.png',
        icon_size = 128,
        prerequisites = {'fi_energy_tech','fi_refining_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'fi_solid_reactor_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_tech_fuel_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'fi_test_fuel_recipe',
            }
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
    {
        name = 'fi_solid_reactor_entity',
        type = 'assembling-machine',
        icon = '__248k__/ressources/fission/fi_solid_reactor/fi_solid_reactor_entity_icon.png',
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = 'big-remnants',
        collision_box = {{-2.7,-2.7},{2.7,2.7}},
        selection_box = {{-3.0,-3.0},{3.0,3.0}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = 'fi_solid_reactor_item',
        },
        fixed_recipe = 'fi_use_tech_fuel_recipe',
        crafting_categories = {"fi_test_fuel_crafting_category"},
        crafting_speed = 1,
        energy_source = {
            type = 'void',
        },
        energy_usage = "1W",
        animation = {
            filename = '__248k__/ressources/fission/fi_solid_reactor/fi_solid_reactor_entity_animation.png',
            width = 960,
            height = 960,
            shift = {0, 0},
            scale = 0.2,
          },
          working_visualisations = {
            {
                animation = {
                    filename = '__248k__/ressources/fission/fi_solid_reactor/fi_solid_reactor_entity_animation_2.png',
                    width = 960,
                    height = 960,
                    shift = {0, 0},
                    scale = 0.2,
                    line_length = 4,
                    lines_per_file = 1,
                    frame_count = 4,
                    animation_speed = 0.1, 
                }
            }
        },
        working_sound = { 
            sound = { filename ='__base__/sound/nuclear-reactor-1.ogg'},
            apparent_volume = 2.5,
        },
    },
    {
        name = 'fi_test_fuel_crafting_category',
        type = 'recipe-category',
    },
})



--===================================================================================================================
--                              structures and adding 
--===================================================================================================================

recipe_structure = {"recipe", "item", "item_amount"}
tech_structure = {"tech", "pre_tech"}
card_structure = {"tech", "card"}

add_to_recipes(change_table_index(building_table, recipe_structure))
add_to_recipes(change_table_index(item_table, recipe_structure))
add_to_techs(change_table_index(tech_table, tech_structure))
add_tech_cards(change_table_index(add_card_table, tech_structure))
remove_pre_techs(change_table_index(pre_tech_table, tech_structure))
remove_tech_cards(change_table_index(remove_card_table, card_structure))

