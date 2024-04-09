local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_close_confirmation = 'NeverPrompt'
config.hide_tab_bar_if_only_one_tab = true

local mod = 'SUPER'
config.leader = { key = ' ', mods = mod}
config.keys = {
    { mods = mod, key = 'v', action = act({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
    { mods = mod, key = 'h', action = act({ SplitVertical = { domain = 'CurrentPaneDomain' } }) },

    { mods = mod, key = 'q', action = act.CloseCurrentPane { confirm = false } },
    { mods = mod..'|SHIFT', key = 'q', action = act.CloseCurrentTab { confirm = false } },

    { mods = mod, key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { mods = mod, key = 'h', action = act.ActivatePaneDirection 'Left' },

    { mods = mod, key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { mods = mod, key = 'l', action = act.ActivatePaneDirection 'Right' },

    { mods = mod, key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { mods = mod, key = 'k', action = act.ActivatePaneDirection 'Up' },

    { mods = mod, key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { mods = mod, key = 'j', action = act.ActivatePaneDirection 'Down' },

    -- LEADER followed by 'r' will put us in resize-pane
    -- mode until we cancel that mode.
    {
        key = 'r',
        mods = mod,
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
        },
    },

    -- LEADER followed by 'g' will put us in switch-tab
    -- mode until we cancel that mode.
    {
        key = 'g',
        mods = mod,
        action = act.ActivateKeyTable {
            name = 'switch_tab',
            one_shot = true,
        },
    },
}

config.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  },

  -- Defi
  switch_tab = {
    { key = 'n', action = act.ActivateTabRelative(1)},
    { key = 'p', action = act.ActivateTabRelative(-1)},
    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  }
}

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

config.font = wezterm.font('Hack')
config.color_scheme = 'sol'
config.check_for_updates = false

return config
