set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_RUNTIME_DIR "/tmp/$(id -u)-runtime-dir"
test -d "$XDG_RUNTIME_DIR"; or begin; 
    mkdir "$XDG_RUNTIME_DIR";
    chmod 700 "$XDG_RUNTIME_DIR"
end;
set fish_greeting

if status is-interactive
    # Source aliases
    if [ -f $XDG_CONFIG_HOME/fish/alias.fish ]
        source $XDG_CONFIG_HOME/fish/alias.fish
    end

    # Enable asynchronous prompt
    set -g async_prompt_enable 1

    if test (tty) = /dev/ttyv0
        Hyprland
    end
end
