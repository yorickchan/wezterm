local wezterm = require("wezterm")
require("events/tab-title")
local act = wezterm.action
-- local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.show_tab_index_in_tab_bar = false
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.window_background_opacity = 0.82
config.macos_window_background_blur = 5
config.text_background_opacity = 0.8
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
	top = 5,
}
config.initial_rows = 70
config.initial_cols = 120

-- Keybindings
config.keys = {
	{ key = "d", mods = "SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "SUPER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "t", mods = "CMD|SHIFT", action = act.ShowTabNavigator },
}

return config
