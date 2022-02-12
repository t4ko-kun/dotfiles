local wezterm = require 'wezterm';

return {
    window_close_confirmation = "NeverPrompt",
    font = wezterm.font("Hack"),
    keys = {
        {key="\"", mods="CMD", action=wezterm.action{SplitHorizontal={args={"zsh"}}}
        },
    }
}
