local wezterm  = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  macos_forward_to_ime_modifier_mask = "CTRL",
  enable_tab_bar = true,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "SteadyBlock",
  font_size = 15,
  font = wezterm.font('JetBrains Mono', { weight = 'Medium' }),
  line_height = 1.12,
  window_background_opacity = 0.82,
  macos_window_background_blur = 15,
  initial_rows = 44,
  initial_cols = 160,
  colors = {
    cursor_bg = 'white',
    background = '#15191e'
  },
  window_padding = {
    left = 3,
    right = 3,
    top = 3,
    bottom = 3
  }
}

return config
