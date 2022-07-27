local function config(name)
    return settings.startup['el_ki_beacon_'..name].value
end

--techs
table.insert(data.raw.lab["gr_lab_entity"].inputs, "se-deep-space-science-pack-1")
table.insert(data.raw.lab["gr_lab_entity"].inputs, "se-material-science-pack-2")
table.insert(data.raw.lab["gr_lab_entity"].inputs, "se-rocket-science-pack")
--se-energy-science-pack-1
table.insert(data.raw.technology["fu_energy_tech"].unit.ingredients, {"se-energy-science-pack-1", 1})
table.insert(data.raw.technology["fu_reactor_tech"].unit.ingredients, {"se-energy-science-pack-1", 1})
table.insert(data.raw.technology["fu_tokamak_tech"].unit.ingredients, {"se-energy-science-pack-2", 1})
table.insert(data.raw.technology["fu_star_engine_tech"].unit.ingredients, {"se-energy-science-pack-3", 1})
--se-energy-material-pack-1
table.insert(data.raw.technology["fu_star_engine_copper_tech"].unit.ingredients, {"se-material-science-pack-1", 1})
table.insert(data.raw.technology["fu_star_engine_iron_tech"].unit.ingredients, {"se-material-science-pack-1", 1})
table.insert(data.raw.technology["fu_star_engine_sulfur_tech"].unit.ingredients, {"se-material-science-pack-1", 1})
--ki
table.insert(data.raw.technology["fu_ki_plus_1_tech"].unit.ingredients, {"se-deep-space-science-pack-2", 1})
table.insert(data.raw.technology["fu_ki_plus_2_tech"].unit.ingredients, {"se-deep-space-science-pack-4", 1})
table.insert(data.raw.technology["el_ki_sup_2_tech"].unit.ingredients, {"se-energy-science-pack-1", 1})
table.insert(data.raw.technology["el_ki_sup_3_tech"].unit.ingredients, {"se-energy-science-pack-2", 1})
table.insert(data.raw.technology["el_ki_sup_4_tech"].unit.ingredients, {"se-energy-science-pack-3", 1})

--modules
table.insert(data.raw.technology["fi_modules_4_tech"].unit.ingredients, {"se-deep-space-science-pack-2", 1})
table.insert(data.raw.technology["fi_modules_5_tech"].unit.ingredients, {"se-deep-space-science-pack-3", 1})
table.insert(data.raw.technology["fi_modules_6_tech"].unit.ingredients, {"se-deep-space-science-pack-4", 1})


data.raw.technology["gr_stage_tech"].prerequisites = {
    'fu_space_probe_3_tech',
    'fu_hydrogen_3_tech',
    'fu_lead_tech'
}

for i,v in pairs(data.raw.beacon) do
    if (i == "el_ki_beacon_entity-spaced") or (i == "fi_ki_beacon_entity-spaced") or (i == "fu_ki_beacon_entity-spaced") then
        data.raw.beacon[i] = nil
    end
end

--buff beacons
data.raw.beacon["el_ki_beacon_entity"].module_specification = {
    module_slots = 10,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3,
}
data.raw.beacon["el_ki_beacon_entity"].energy_usage = '2MW'
data.raw.beacon["el_ki_beacon_entity"].supply_area_distance = config('supply_area') + 2

data.raw.beacon["fi_ki_beacon_entity"].module_specification = {
    module_slots = 15,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3,
}
data.raw.beacon["fi_ki_beacon_entity"].energy_usage = '8MW'
data.raw.beacon["fi_ki_beacon_entity"].supply_area_distance = config('supply_area') + 6

data.raw.beacon["fu_ki_beacon_entity"].module_specification = {
    module_slots = 45,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3,
}
data.raw.beacon["fu_ki_beacon_entity"].energy_usage = '80MW'
data.raw.beacon["fu_ki_beacon_entity"].supply_area_distance = config('supply_area') + 15


--buff cores
data.raw.beacon["el_ki_core_slave_entity"].module_specification = {
    module_slots = 5,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3,
}
data.raw.beacon["fi_ki_core_slave_entity"].module_specification = {
    module_slots = 5,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3,
}
data.raw.beacon["fu_ki_core_slave_entity"].module_specification = {
    module_slots = 5,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3,
}


--[[*************************************************************************]]--
--Fixes break in tech tree
data.raw.technology["fu_KFK_tech"].prerequisites = {
	"fi_caster_tech",

}
data.raw.technology["fu_KFK_tech"].unit.ingredients = {

    {"chemical-science-pack",1},
    {"automation-science-pack",1},
    {"logistic-science-pack",1},
}

--Currently SE/K2 labs do not accept KI cubes. The following iterates through the tech tree and replaces red cubes with Production Science
--and Yellow cubes with material science pack 3, which are approximately the same point in the tech tree and cost
for tech_name, technology in pairs(data.raw.technology) do

--[[Flags for the presence of the prod/matter techs arleady present. If it is present, flags for removal at the end. It can't be removed
during the iteration as it has already initilised the ingredient table, so the entire table needs to be replaced]]
	local prod=false
	local matter=false
	
	
	--Iterate over techs and replace the ingredient if not already present
	for tech_ingredient, ingredient in pairs(technology.unit.ingredients) do
		local ingredient_name = ingredient.name or ingredient[1]
		if ingredient_name == "production-science-pack" then
			prod=true
		end
		if ingredient_name == "se-material-science-pack-3" then
			matter=true
		end
		
		if ingredient_name == "fi_ki_science" then
			if prod==true then
				
			else data.raw.technology[tech_name].unit.ingredients[tech_ingredient]={"production-science-pack",1}
			end
		end
		if ingredient_name == "fu_ki_science" then
			if matter==true then
				
			else data.raw.technology[tech_name].unit.ingredients[tech_ingredient]={"se-material-science-pack-3", 1}
			end
		end
	end
	
--Iterate over and construct a new ingredient table without the relevant cube
	if prod or matter then
		local new_ingredients = {}
		for tech_ingredient, ingredient in pairs(technology.unit.ingredients) do
			local ingredient_name = ingredient.name or ingredient[1]
				if ingredient_name == "fi_ki_science" then
				
				elseif ingredient_name == "fu_ki_science" then
				
				else
					table.insert(new_ingredients, ingredient)
				end
		end
		
		data.raw.technology[tech_name].unit.ingredients = new_ingredients
	end
	
end
