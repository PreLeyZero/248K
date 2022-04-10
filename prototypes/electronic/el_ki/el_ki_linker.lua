--local functions
local function config(name)
    return settings.startup['el_ki_linker_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/electronic/el_ki/el_ki_linker/el_ki_'..name
end

data:extend({
    {
        name = 'el_ki_linker',
        type = 'item-with-tags',
        icon = sprite('linker_entity_icon.png'),
        icon_size = 64,
        stack_size = 1,
        subgroup = 'el_item_subgroup_b',
        order = 'a-b',
    },
    {
        name = 'fi_ki_science',
        type = 'tool',
        icon = sprite('science_blue_data.png'),
        durability = 1,
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'fi_item_subgroup_k',
        order = 'f-a',
    },
    {
        name = 'fu_ki_science',
        type = 'tool',
        icon = sprite('science_red_data.png'),
        durability = 1,
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'fu_item_subgroup_k',
        order = 'f-a',
    },
    {
        name = "el_ki_selection_tool",
        type = "selection-tool",
        stack_size = 1,
        icon_size = 64,
        icon = sprite('selection_tool.png'),
        flags = {"hidden","mod-openable","only-in-cursor"},
        selection_color = {r=0.79, g=0.4, b=0, a=0.5 },
        selection_mode = {"any-entity"},
        selection_cursor_box_type = "entity",
        alt_selection_color = {r=1, g=0, b=0, a=0.5 },
        alt_selection_cursor_box_type = "entity",
        alt_selection_mode = {"any-entity"},
        entity_filters = {"el_ki_beacon_entity","fi_ki_beacon_entity","fu_ki_beacon_entity"},
        alt_entity_filters = {"el_ki_beacon_entity","fi_ki_beacon_entity","fu_ki_beacon_entity"}
    },
    {
		type     = "sprite",
		name     = "el_ki_not_operable_icon",		
		filename = "__248k__/ressources/electronic/el_ki/el_ki_linker/el_ki_not_operable_icon.png",
		width    = 64,
		height   = 64,
		scale    = 1
	}
})