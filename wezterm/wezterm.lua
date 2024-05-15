local wezterm = require("wezterm")

local colors = require("lua/rose-pine").colors()
local window_frame = require("lua/rose-pine").window_frame()

local config = wezterm.config_builder()

config.colors = colors
config.window_frame = window_frame
config.font = wezterm.font("Menlo", { weight = "Regular" })
config.font_size = 13.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.bold_brightens_ansi_colors = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 26,
	bottom = 0,
}
config.audible_bell = "Disabled"

config.send_composed_key_when_left_alt_is_pressed = true

config.keys = {
	{
		key = "Return",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
