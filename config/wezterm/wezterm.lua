local wezterm = require("wezterm")
local utils = require("utils")
local assets = wezterm.config_dir .. "/assets"

local act = wezterm.action

local config = {
  -- Control whether changing the font size adjusts the
  -- dimensions of the window (true) or adjusts the
  -- number of terminal rows/columns (false). The default
  -- is true.
  adjust_window_size_when_changing_font_size = false,

  -- Sets the default current working directory used byte
  -- the initial window.
  --default_cwd

  -- Acceptable values are:
  --   * SteadyBlock, BlinkingBlock
  --   * SteadyUnderline, BlinkingUnderline
  --   * SteadyBar, and BlinkingBar
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 528,

  --font = wezterm.font('Mononoki')
  --font = wezterm.font("Lilex"),
  --font = wezterm.font("JetBrains Mono"),
  font = wezterm.font("Hack"),
  font_size = 15,
  line_height = 1.0,
  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  -- COLORS
  -- https://github.com/mbadolato/iTerm2-Color-Schemes#screenshots
  --color_scheme = "nightfox",
  color_scheme = "terafox",
  -- window_background_opacity = 0.15,
  -- macos_window_background_blur = 30,
  window_decorations = "RESIZE",
  window_close_confirmation = "AlwaysPrompt",
  harfbuzz_features = { "calt", "dlig", "clig=1", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
  native_macos_fullscreen_mode = true,
  keys = {
    --Toggle Full Screen w/CMD + Enter
    {
      key = "Enter",
      mods = "CMD",
      action = act.ToggleFullScreen,
    },
    --Horizontal Split w/CMD + d
    {
      key = "d",
      mods = "CMD",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    --Vertical Split w/CMD + SHIFT + d
    {
      key = "D",
      mods = "CMD|SHIFT",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "Enter",
      mods = "CMD|SHIFT",
      action = act.TogglePaneZoomState,
    },
    --Navigate between panes
    {
      key = "LeftArrow",
      mods = "CMD|ALT",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "RightArrow",
      mods = "CMD|ALT",
      action = act.ActivatePaneDirection("Right"),
    },
    {
      key = "UpArrow",
      mods = "CMD|ALT",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "DownArrow",
      mods = "CMD|ALT",
      action = act.ActivatePaneDirection("Down"),
    },
    --Scrolling
    { key = "UpArrow", mods = "ALT|SHIFT", action = act.ScrollByPage(-0.5) },
    { key = "DownArrow", mods = "ALT|SHIFT", action = act.ScrollByPage(0.5) },
    { key = "UpArrow", mods = "ALT", action = act.ScrollByLine(-1) },
    { key = "DownArrow", mods = "ALT", action = act.ScrollByLine(1) },
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
}

--local is_dark = wezterm.gui.get_appearance():find("Dark")
local is_dark = true
local theme = utils.get_current_theme()

utils.table_extend(true, config, require(theme)(is_dark, assets))

return config
