dofile_once("mods/tales_of_kupoli/files/scripts/utils.lua")

local a = {
	{
		id          = "REAPING_SHOT",
		name 		= "Reaping Shot",
		description = "Causes enemies to drop their souls on death. \nMana Cost x 1.1",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reaping_shot.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/reaping_shot/reaping_shot.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5",
		spawn_probability                 = "0.5,0.5,0.5,0.5",
		price = 120,
		mana = 20,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/reaping_shot/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 5
			--ce.mana_multiplier = ce.mana_multiplier * 1.1 -- wonderful testing
			draw_actions( 1, true )
		end,
	},
	{
		id          = "REAPING_FIELD", 
		name 		= "Circle of Reaping",
		description = "Causes enemies in a large field to drop their souls on death.",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reaping_field.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/reaping_field/reaping_field.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5,6",
		spawn_probability                 = "0.1,0.1,0.2,0.5,0.4",
		price = 200,
		mana = 70,
		max_uses = 5,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/reaping_field/reaping_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
		end,
	},
	{
		id          = "SOULS_TO_POWER", 
		name 		= "Souls to Power",
		description = "Consumes a portion of your souls to increase a projectile's damage.",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/souls_to_power.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/souls_to_power/souls_to_power.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "5,6,10",
		spawn_probability                 = "0.9,0.9,0.8",
		price = 120,
		mana = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/souls_to_power/souls_to_power.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
	--[[{
		id          = "SOLAR_GLUTTONY", 
		name 		= "Solar Gluttony",
		description = "Eat the Sun.",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/solar_gluttony.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/solar_gluttony/solar_gluttony.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "",
		spawn_probability                 = "",
		price = 0,
		mana = 275,
		max_uses = 30,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/solar_gluttony/solar_gluttony.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
		end,
	},]]--
	{
		id          = "REAPING_HALO", -- may need to be rebalanced
		name 		= "Reaping Halo",
		description = "Fires a halo of energy that homes and causes enemies to drop their souls.",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reaping_halo.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/reaping_halo/projectile.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "4,5,6,10", 
		spawn_probability                 = "0.1,0.3,0.7,0.5", 
		price = 160,
		mana = 120,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/reaping_halo/projectile.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "SOUL_EXPLOSION",
		name 		= "Soul Detonation",
		description = "Detonates a soul to produce an explosion.",
		sprite 		= "mods/moles_souls/files/spell_icons/soul_detonation.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/soul_detonation/soul_detonation.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5",
		spawn_probability                 = "2,3,4,5",
		price = 120,
		mana = 10,
		--max_uses = 30,
		custom_xml_file = "mods/moles_souls/files/entities/misc/soul_detonation.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/soul_detonation.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.screenshake = c.screenshake + 0.5
		end,
	},
	{
		id = "HIISI_SHOTGUN", -- MOULD N
		name = "Hiisi Shotgun Shell",
		description = "Fires 3 projectiles.",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_shotgun.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml", 3},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70, -- does this even need to be set?
		mana = 30, -- make this the same as buckshot + 25%
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml")
			c.spread_degrees = c.spread_degrees + 13.0
		end,
	},
	{
		id = "HIISI_SNIPER", -- MOULD N
		name = "Hiisi Sniper Shot",
		description = "Fires a single powerful projectile.",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_sniper.png", -- wip
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisisniper/projectile.xml"},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70,
		mana = 70,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisisniper/projectile.xml")
		end,
	},
	{
		id = "HIISI_PISTOL", -- MOULD N
		name = "Hiisi Pistol Shot",
		description = "Fires a single projectile.",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_pistol.png", -- wip
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisipistol/projectile.xml"},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70,
		mana = 50,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisipistol/projectile.xml")
		end,
	},
}

for i,v in ipairs(a) do
	v.id = "MOLETHING_" .. v.id
    table.insert(actions, v)
end

--print(#a .. " actions successfully added!")