--local functions
local function config(name)
    return settings.startup['fi_modules_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/fission/fi_modules/fi_modules_'..name
end

local limitation_list = {
    'el_train_fuel_diesel_recipe',
    'el_grow_energy_crystal_recipe',
    'el_cast_pure_iron_recipe',
    'el_cast_pure_steel_recipe',
    'el_cast_pure_copper_recipe',
    'el_cast_pure_aluminum_recipe',
    'fi_cast_neodym_recipe',
    'fi_cast_glass_recipe',
    'fi_cast_gold_recipe',
    'fi_cast_titan_recipe',
    'el_arc_pure_iron_recipe',
    'el_arc_pure_copper_recipe',
    'el_arc_pure_aluminum_recipe',
    'fi_arc_glass_recipe',
    'fi_arc_pure_gold_recipe',
    'fi_arc_pure_titan_recipe',
    'fi_arc_pure_neodym_recipe',
    'fi_compound_material_recipe',
    'fi_materials_industrial_steel_recipe',
    'fi_GFK_recipe',
    'fi_NFK_recipe',
    'fu_KFK_recipe',
    'fu_TIM_recipe',
    'fu_lead_ore_recipe',
    'fi_base_crystal_recipe',
    'fi_catalyst_crystal_recipe',
    'fi_energy_crystal_recipe',
    'fi_glass_fiber_recipe',
    'fi_natural_fiber_recipe',
    'fu_carbon_fiber_recipe',
    'fu_tech_sign_recipe',
    'gr_pcb_recipe',
    'gr_gold_wire_recipe',
    'gr_circuit_recipe',
    'gr_materials_stack_up_item_recipe',
    'gr_materials_stack_down_item_recipe',
    'fi_rich_powder_recipe',
    'fi_strong_acid_recipe',
    'fi_refinery_basic_recipe',
    'fi_refinery_coal_recipe',
    'fi_refinery_sulfur_recipe'
}

--item
data:extend({
    {
        name = 'fi_modules_productivity_1_item',
        type = 'module',
        icon = sprite('productivity_1.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_j',
        category = '248k_productivity_category',
        tier = 1,
        order = 'a-a',
        effect = {
            consumption = {bonus = 0.9},
            speed = {bonus = -0.2},
            productivity = {bonus = 0.06},
            pollution = {bonus = 0.3}
        },
        limitation = limitation_list,
        limitation_message_key = 'limitation_message',
    },
    {
        name = 'fi_modules_productivity_2_item',
        type = 'module',
        icon = sprite('productivity_2.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_j',
        category = '248k_productivity_category',
        tier = 2,
        order = 'a-a',
        effect = {
            consumption = {bonus = 1.4},
            speed = {bonus = -0.35},
            productivity = {bonus = 0.10},
            pollution = {bonus = 0.6}
        },
        limitation = limitation_list,
        limitation_message_key = 'limitation_message',
    },
    {
        name = 'fi_modules_productivity_3_item',
        type = 'module',
        icon = sprite('productivity_3.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_j',
        category = '248k_productivity_category',
        tier = 3,
        order = 'a-a',
        effect = {
            consumption = {bonus = 2.6},
            speed = {bonus = -0.6},
            productivity = {bonus = 0.12},
            pollution = {bonus = 0.9}
        },
        limitation = limitation_list,
        limitation_message_key = 'limitation_message',
    },
    {
        name = 'fi_modules_productivity_4_item',
        type = 'module',
        icon = sprite('productivity_4.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_d',
        category = '248k_productivity_category',
        tier = 4,
        order = 'a-a',
        effect = {
            consumption = {bonus = 2},
            speed = {bonus = -0.5},
            productivity = {bonus = 0.05},
            pollution = {bonus = 1}
        },
    },
    {
        name = 'fi_modules_productivity_5_item',
        type = 'module',
        icon = sprite('productivity_5.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_d',
        category = '248k_productivity_category',
        tier = 5,
        order = 'a-b',
        effect = {
            consumption = {bonus = 3},
            speed = {bonus = -0.7},
            productivity = {bonus = 0.1},
            pollution = {bonus = 1}
        },
    },
    {
        name = 'fi_modules_productivity_6_item',
        type = 'module',
        icon = sprite('productivity_6.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_d',
        category = '248k_productivity_category',
        tier = 6,
        order = 'a-c',
        effect = {
            consumption = {bonus = 6},
            speed = {bonus = -0.9},
            productivity = {bonus = 0.25},
            pollution = {bonus = 1}
        },
    },
    {
        name = 'fi_modules_base_item',
        type = 'item',
        icon = sprite('base.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_e',
        order = 'b-k',
    },
    {
        name = 'fi_modules_core_item',
        type = 'item',
        icon = sprite('core.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'fi_item_subgroup_e',
        order = 'b-x',
    },
    

})