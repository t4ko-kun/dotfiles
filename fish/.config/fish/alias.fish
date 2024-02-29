# ls
if type "lsd" > /dev/null;
    alias ls="lsd -1 -h --group-dirs first"
    abbr lst "ls --tree --depth"
end
abbr l "ls"
abbr ll "ls -l"
abbr la "ls -a"
abbr lla "ls -la"

abbr o "xdg-open"
# git

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

function doas_last_history_item
    echo doas $history[1]
end
abbr -a please --function doas_last_history_item

