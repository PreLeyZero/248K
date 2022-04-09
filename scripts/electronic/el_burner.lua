function make_burner_recipe(item)
    local blank = {
        name = 'fu_burn_oxygen_recipe',
        type = 'recipe',
        category = 'fu_burner_category',
        icon = '__248k__/ressources/elements/fu_oxygen.png',
        icon_size = 64,
        enabled = true,
        hidden = true,
        ingredients = {
            {type="item", name="blank", amount=1},
        },
        results = {},
        result_count = 1,
        energy_required = 0.1,
        always_show_made_in = true,
        subgroup = 'fu_item_subgroup_f',
    }
    blank["name"] = "fu_burn_"..item.."_recipe"
    blank["ingredients"] = {
        {item,1}
    }
    if data.raw.item[item].icon then 
        blank["icon"] = data.raw.item[item].icon
        blank["icon_size"] = data.raw.item[item].icon_size
    end
    --table.insert(data.raw.recipe, base)
    data:extend({blank})
end

function burner_recipe_generator()
    local items = data.raw.item
    for i,v in pairs(items) do
        if not (data.raw.item[i].name == "fi_materials_waste") then
            make_burner_recipe(data.raw.item[i].name)
        end
    end
end


burner_recipe_generator()