-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")

config.initial_cols = 120
config.initial_rows = 38
config.font_size = 14
config.color_scheme = 'Batman'
config.window_background_opacity = .8
config.macos_window_background_blur = 7

return config
