local wezterm = require("wezterm")

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#85678f"
	local foreground = "silver"
	local edge_background = "black"
	local edge_foreground = "#b294bb"

	if tab.is_active then
		background = "#b294bb"
		foreground = "black"
		edge_foreground = "#b294bb"
	end

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width)

	return {
		-- { Background = { Color = edge_background } },
		-- { Foreground = { Color = edge_foreground } },
		-- { Text = "  " },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = "  " },
		{ Text = title },
		{ Text = "  " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
		{ Text = "  " },
	}
end)

return {}
