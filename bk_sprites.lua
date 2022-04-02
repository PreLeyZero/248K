local function sprite(name)
    return '__248k__/ressources/booktorio/bk_sprite_'..name
end

data:extend(
{
	{
		type     = "sprite",
		name     = "bk_sprite_1",		
		filename = sprite('1.png'),
		width    = 1245,
		height   = 1122,
		scale    = 0.5 
    },
    {
		type     = "sprite",
		name     = "bk_sprite_2",		
		filename = sprite('2.png'),
		width    = 1044,
		height   = 826,
		scale    = 0.5 
	},
	{
		type     = "sprite",
		name     = "bk_sprite_3",		
		filename = sprite('3.png'),
		width    = 988,
		height   = 696,
		scale    = 0.9 
	},
	{
		type     = "sprite",
		name     = "bk_sprite_4",		
		filename = '__248k__/ressources/fusion/fu_fusor/fu_fusor_entity_animation.png',
		width    = 512*2,
		height   = 512*2,
		scale    = 0.4
	},
	{
		type     = "sprite",
		name     = "bk_sprite_5",		
		filename = '__248k__/ressources/fusion/fu_boiler/fu_boiler_entity_animation.png',
		width    = 512,
		height   = 512,
		scale    = 0.7
	},
	{
		type     = "sprite",
		name     = "bk_sprite_6",		
		filename = sprite('6.png'),
		width    = 1080,
		height   = 1080,
		scale    = 0.7
	},
	{
		type     = "sprite",
		name     = "bk_sprite_7",		
		filename = sprite('7.png'),
		width    = 1292,
		height   = 627,
		scale    = 0.7
	}
})
