local function sprite(name)
    return "__248k__/ressources/pipe_covers/"..name..".png"
end

empty_sprite = {
    filename = sprite("64_empty"),
    priority = "high",
    width = 64,
    height =64
}

assembler_pipe_picture = {
    north = {
        filename = sprite("north_covers"),
		priority = "high",
		width = 71,
        height = 38,
        shift = util.by_pixel(2.25, 13.5),
        scale = 0.5
    },
    south = {
        filename = sprite("south_covers"),
		priority = "high",
		width = 88,
        height = 61,
        shift = util.by_pixel(0, -31.25),
        scale = 0.5
    },
    west = {
        filename = sprite("west_covers"),
		priority = "high",
		width = 39,
        height = 73,
        shift = util.by_pixel(25.75, 1.25),
        scale = 0.5
    },
    east = {
        filename = sprite("east_covers"),
		priority = "high",
		width = 42,
        height = 76,
        shift = util.by_pixel(-24.5, 1),
        scale = 0.5
    }
}

basic_pipe_picture = {
    north = {
        filename = sprite("north_covers"),
		priority = "high",
		width = 71,
        height = 38,
        shift = util.by_pixel(2.25, 13.5),
        scale = 0.5
    },
    south = {
        filename = sprite("south_covers"),
		priority = "high",
		width = 88,
        height = 61,
        shift = util.by_pixel(0, -31.25),
        scale = 0.5
    },
    west = {
        filename = sprite("west_covers"),
		priority = "high",
		width = 39,
        height = 73,
        shift = util.by_pixel(25.75, 1.25),
        scale = 0.5
    },
    east = {
        filename = sprite("east_covers"),
		priority = "high",
		width = 42,
        height = 76,
        shift = util.by_pixel(-24.5, 1),
        scale = 0.5
    }
}

south_pipe_picture = {
    north = empty_sprite,
    south = {
        filename = sprite("south_covers"),
		priority = "high",
		width = 88,
        height = 61,
        shift = util.by_pixel(0, -31.25),
        scale = 0.5
    },
    west = empty_sprite,
    east = empty_sprite
}

grey_south_pipe_picture = {
    north = empty_sprite,
    south = {
        filename = sprite("south_covers_grey"),
		priority = "high",
		width = 88,
        height = 61,
        shift = util.by_pixel(0, -31.25),
        scale = 0.5
    },
    west = empty_sprite,
    east = empty_sprite
}

north_south_basic_pipe_picture = {
    north = empty_sprite,
    south = {
        filename = sprite("south_basic_covers"),
		priority = "high",
		width = 55,
        height = 50,
        shift = {0.01, -0.58},
        scale = 0.5
    },
    west = empty_sprite,
    east = empty_sprite
}

