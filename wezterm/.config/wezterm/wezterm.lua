local wezterm = require 'wezterm';

return {
    window_close_confirmation = "NeverPrompt",
    hide_tab_bar_if_only_one_tab = true,
    keys = {
        {key="|", mods="CMD", action=wezterm.action{SplitHorizontal={args={"zsh"}}}},
        {key="_", mods="CMD", action=wezterm.action{SplitVertical={args={"zsh"}}}},
    },
    font = wezterm.font("Hack"),
    color_scheme = "sol"
}
