dofile("mods/tales_of_kupoli/files/utils.lua")

local souls = dofile("mods/tales_of_kupoli/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = GetRandomSoul()


if soul == nil then
	GamePrint("You have no souls.")

	local projcomp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

	ComponentSetValue2( projcomp, "on_death_explode", false )
	ComponentSetValue2( projcomp, "on_lifetime_out_explode", false )
	ComponentSetValue2( projcomp, "collide_with_entities", false )
	ComponentSetValue2( projcomp, "collide_with_world", false )
	ComponentSetValue2( projcomp, "lifetime", 0 )

    EntityKill(entity_id)
end

GamePrint(soul)

RemoveSouls(1)