dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	EntityLoad( "data/entities/items/pickup/heart.xml", pos_x - 16, pos_y )
	EntityLoad( "data/entities/items/wand_unshuffle_06.xml", pos_x + 16, pos_y )
	
	AddFlagPersistent( "miniboss_dragon" )
	AddFlagPersistent( "card_unlocked_dragon" )
	
	local pw = check_parallel_pos( pos_x )
	SetRandomSeed( pw, 540 )
	
	local flag_status = HasFlagPersistent( "card_unlocked_dragon" )
	local opts = { "ORBIT_DISCS", "ORBIT_FIREBALLS", "ORBIT_NUKES", "ORBIT_LASERS", "ORBIT_LARPA" }
	local count = 3
	
	if flag_status then
		opts = { "ORBIT_DISCS", "ORBIT_FIREBALLS", "ORBIT_LASERS", "ORBIT_LARPA" }
		count = 1
	end

	local spawntablet = math.random(1, 3)
	if spawntablet == 1 then
		EntityLoad( "mods/tales_of_kupoli/files/entities/revived/_tablets/dragon.xml", x, y)
	end
	
	for i=1,count do
		local rnd = Random( 1, #opts )
		CreateItemActionEntity( opts[rnd], pos_x - 8 * count + (i-0.5) * 16, pos_y )
		table.remove( opts, rnd )
	end
	
end