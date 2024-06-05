local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.color_scheme = "Sonokai Atlantis"
config.font = wezterm.font("Fira Code")
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.audible_bell = 'Disabled'

return config