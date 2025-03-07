dofile_once("data/scripts/lib/mod_settings.lua")
dofile_once("data/scripts/lib/utilities.lua")

function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "tales_of_kupoli"
mod_settings_version = 1 
mod_settings = {
	{
        id = "show_souls",
        ui_name = "Show Souls",
        ui_description = "If you want to see souls around your player in game.",
        value_default = true,
        scope = MOD_SETTING_SCOPE_RUNTIME,
    },
	{
        id = "mina_pearl",
        ui_name = "Mould N Pearl",
        ui_description = "If you want to start with the pearl from Mould N.",
        value_default = false,
        scope = MOD_SETTING_SCOPE_RUNTIME,
    },
	{
		id = "sunbook_unlocked_on_start",
        ui_name = "Start with The Sun & You unlocked",
        ui_description = "",
        value_default = false,
        scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "say_soul",
        ui_name = "Say acquired soul",
        ui_description = "If you want to be told what souls you acquire.",
        value_default = true,
        scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "say_consumed_soul",
        ui_name = "Say consumed soul",
        ui_description = "If you want to be told what souls you consume when using adaptive spells.",
        value_default = true,
        scope = MOD_SETTING_SCOPE_RUNTIME,
	},
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end


function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end