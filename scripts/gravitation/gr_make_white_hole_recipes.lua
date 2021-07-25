function gr_make_white_hole_recipe(item)
    local blank = {
        name = 'blank',
        type = 'recipe',
        enabled = 'true',
        hidden = 'true',
        allow_as_intermediate = 'false',
        category = 'gr_white_hole_category',
        ingredients = {
            {'blank',1}
        },
        result = 'blank',
        result_count = 2,
        energy_required = 10,
    }
    blank["name"] = "gr_white_hole_cycle_"..item.."_recipe"
    blank["ingredients"] = {
        {item,1}
    }
    blank["result"] = item

    --table.insert(data.raw.recipe, base)
    data:extend({blank})
end

function gr_white_hole_recipe_generator()
    local items = data.raw.item
    for i,v in pairs(items) do
        if data.raw.item[i].stack_size > 1 then
            gr_make_white_hole_recipe(data.raw.item[i].name)
        end
    end
end


gr_white_hole_recipe_generator()