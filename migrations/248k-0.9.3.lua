for _, v in pairs(game.surfaces) do
    for _, _v in pairs(v.find_entities_filtered{name = "fu_stelar_reactor_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_stelar_reactor_item"})
        _v.mine()
    end
    for _, _v in pairs(v.find_entities_filtered{name = "fu_tokamak_reactor_entity"}) do
        _v.surface.spill_item_stack(_v.position, {name="fu_tokamak_reactor_item"})
        _v.mine()
    end
end