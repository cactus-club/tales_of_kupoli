dofile_once("mods/tales_of_kupoli/files/scripts/utils.lua")
dofile_once("data/scripts/gun/procedural/gun_action_utils.lua")

local weapon = GetUpdatedEntityID()

weapon_rngstats(weapon, 2)
AddGunAction( weapon, "MOLETHING_HIISI_SHOTGUN" )