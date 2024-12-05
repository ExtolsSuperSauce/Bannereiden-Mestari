-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 2
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/biome_modifiers.lua")
dofile( "data/scripts/items/generate_shop_item.lua" )

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff55AF4B, "load_altar" )
RegisterSpawnFunction( 0xff23B9C3, "spawn_altar_torch" ) 
RegisterSpawnFunction( 0xff55AF8C, "spawn_skulls" ) 



------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
total_prob = 0,
}


------------ BIG ENEMIES ------------------------------------------------------

g_big_enemies =
{
total_prob = 0,
}


---------- UNIQUE ENCOUNTERS ---------------

g_scavenger_party =
{
total_prob = 0,
}


g_unique_enemy =
{
total_prob = 0,
}

g_unique_enemy2 =
{
total_prob = 0,
}

------------ ITEMS ------------------------------------------------------------

g_items =
{
total_prob = 0,
}

g_pixel_scene_01 =
{
total_prob = 0,
}

g_pixel_scene_01_alt =
{
total_prob = 0,
}

g_pixel_scene_02 =
{
total_prob = 0,
}

g_pixel_scene_03 =
{
total_prob = 0,
}

g_acidtank_right =
{
total_prob = 0,
}

g_acidtank_left =
{
total_prob = 0,
}

g_pixel_scene_04 =
{
total_prob = 0,
}

g_puzzle_capsule =
{
total_prob = 0,
}

g_puzzle_capsule_b =
{
total_prob = 0,
}

g_lamp =
{
total_prob = 0,
}

g_props =
{
total_prob = 0,
}

g_skulls =
{
	total_prob = 0,
	{
		prob   		= 1.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_skull_01.xml"
	},
	{
		prob   		= 1.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_skull_02.xml"
	},
	{
		prob   		= 1.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_skull_03.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_bone_01.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_bone_02.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_bone_03.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_bone_04.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_bone_05.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/physics_bone_06.xml"
	},
}

g_stones =
{
total_prob = 0,
}

g_ghostlamp =
{
total_prob = 0,
}

g_candles =
{
total_prob = 0,
}

g_fish =
{
total_prob = 0,
}

function safe( x, y )
	local result = true
	
	if ( x >= 125 ) and ( x <= 249 ) and ( y >= 3070 ) and ( y <= 3187 ) then
		result = false
	end
	
	return result
end

-- actual functions that get called from the wang generator

function init(x, y, w, h)

end

function spawn_small_enemies(x, y)
	if safe( x, y ) then
		spawn(g_small_enemies,x,y)
	end
end

function spawn_big_enemies(x, y)
	if safe( x, y ) then
		spawn(g_big_enemies,x,y)
	end
end

function spawn_unique_enemy(x, y)
	if safe( x, y ) then
		spawn(g_unique_enemy,x,y)
	end
end

function spawn_unique_enemy2(x, y)
	if safe( x, y ) then
		spawn(g_unique_enemy2,x,y)
	end
end

function spawn_scavenger_party(x,y)
	if safe( x, y ) then
		spawn(g_scavenger_party, x, y)
	end
end

function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r < 0.45) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-15, y-17, "", true )
	end
end

function spawn_lamp(x, y)
	if safe( x, y ) then
		spawn(g_lamp,x+5,y+10,0,0)
	end
end

function spawn_props(x, y)
	if safe( x, y ) then
		local r = ProceduralRandom( x-11.231, y+10.2157 )
		
		if (r < 0.9) then
			spawn(g_props,x,y-3,0,0)
		else
			LoadPixelScene( "data/biome_impl/snowperson.png", "data/biome_impl/snowperson_visual.png", x-12, y-38, "", true )
		end
	end
end

function spawn_skulls(x, y)
	spawn(g_skulls,x,y,0,0)
end

function spawn_stones(x, y)
	spawn(g_stones,x,y,0,0)
end

function load_pixel_scene( x, y )
	load_random_pixel_scene( g_pixel_scene_01, x, y )
end

function load_pixel_scene_alt( x, y )
	load_random_pixel_scene( g_pixel_scene_01_alt, x, y )
end

function load_pixel_scene2( x, y )
	load_random_pixel_scene( g_pixel_scene_02, x, y )
end

function load_pixel_scene3( x, y )
	load_random_pixel_scene( g_pixel_scene_03, x, y )
end

function load_pixel_scene4( x, y )
	load_random_pixel_scene( g_pixel_scene_04, x, y )
end

function load_puzzle_capsule( x, y )
	--print("puzzle capsule spawned at " .. x .. ", " .. y)
	load_random_pixel_scene( g_puzzle_capsule, x, y )
end

function load_puzzle_capsule_b( x, y )
	--print("puzzle capsule spawned at " .. x .. ", " .. y)
	load_random_pixel_scene( g_puzzle_capsule_b, x-50, y-230 )
end

function spawn_altar_torch(x, y)
	EntityLoad( "data/entities/props/altar_torch.xml", x-7, y-36 )
end

function spawn_acid(x, y)
	if safe( x, y ) then
		EntityLoad( "data/entities/props/dripping_acid_gas.xml", x, y )
	end
end

function load_altar( x, y )
	LoadPixelScene( "data/biome_impl/altar.png", "data/biome_impl/altar_visual.png", x-92, y-96, "", true )
	EntityLoad( "data/entities/buildings/altar.xml", x, y-32 )
end

function load_acidtank_right( x, y )
	if safe( x, y ) then
		load_random_pixel_scene( g_acidtank_right, x-12, y-12 )
	end
end

function load_acidtank_left( x, y )
	if safe( x, y ) then
		load_random_pixel_scene( g_acidtank_left, x-252, y-12 )
	end
end

function spawn_shopitem( x, y )
	generate_shop_item( x, y, false, 3 )
end

function spawn_vines(x, y)
	spawn(g_vines,x+5,y+5)
end

function spawn_electricity_trap(x, y)
	EntityLoad("data/entities/props/physics_trap_electricity_enabled.xml", x, y)
end

function spawn_burning_barrel(x, y)
	if safe( x, y ) then
		EntityLoad( "data/entities/props/physics_barrel_burning.xml", x, y )
	end
end

function spawn_fish(x, y)
	spawn(g_fish,x,y)
end

function spawn_buried_eye_teleporter(x, y)
	EntityLoad("data/entities/buildings/teleport_snowcave_buried_eye.xml", x, y)
end

function spawn_statue_hand(x, y)
	EntityLoad("data/entities/buildings/statue_hand_1.xml", x, y)
end

function spawn_receptacle( x, y )
	EntityLoad( "data/entities/buildings/receptacle_water.xml", x, y )
end
