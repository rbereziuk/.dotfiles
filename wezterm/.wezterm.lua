-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.keys = {
	{
		key = "F11",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'Tokyo Night (Gogh)'
config.color_scheme = "tokyonight_night"
config.font_size = 14
config.line_height = 1.1
config.force_reverse_video_cursor = true
config.initial_cols = 130
config.initial_rows = 35

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
