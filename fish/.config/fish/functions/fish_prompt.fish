function fish_prompt -d "Write out the left prompt"
    set prompt_user (set_color -o white)  (whoami)   (set_color normal)
    set prompt_host (set_color -o red)    (hostname) (set_color normal)
    set prompt_cwd  (set_color -o brblue) (prompt_pwd --full-length-dirs=3 --dir-length=5) (set_color normal)

    string join '' -- \n '┌[' $prompt_user '@' $prompt_host ']─[' $prompt_cwd ']' (fish_vcs_prompt) \
        \n '└' (vi_prompt) ' '
end

function vi_prompt
    switch $fish_bind_mode
        case default
          set_color --bold blue
        case insert
          set_color --bold green
        case replace_one
          set_color --bold green
        case visual
          set_color --bold brmagenta
        case '*'
          set_color --bold red
    end
    echo 'λ'
    set_color normal
end
