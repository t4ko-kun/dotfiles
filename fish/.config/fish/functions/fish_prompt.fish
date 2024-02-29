function fish_prompt -d "Write out the left prompt"
    set prompt_user (set_color -o white)  (whoami)   (set_color normal)
    set prompt_host (set_color -o red)    (hostname) (set_color normal)
    set prompt_cwd  (set_color -o brblue) (pwd)      (set_color normal)

    string join '' -- \n '┌[' $prompt_user '@' $prompt_host ']─[' $prompt_cwd ']' \
        \n '└λ '
end
