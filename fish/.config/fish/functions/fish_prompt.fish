function fish_prompt -d "Write out the left prompt"
    set -g __fish_git_prompt_showupstream auto
    set prompt_user (set_color -o white)  (whoami)   (set_color normal)
    set prompt_host (set_color -o red)    (hostname) (set_color normal)
    set prompt_cwd  (set_color -o brblue) (pwd)      (set_color normal)

    string join '' -- \n '┌[' $prompt_user '@' $prompt_host ']─[' $prompt_cwd ']' (fish_vcs_prompt) \
        \n '└λ '
end
