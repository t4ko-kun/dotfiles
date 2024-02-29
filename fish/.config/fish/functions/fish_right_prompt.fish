function fish_right_prompt -d "Write right prompt"
    set prompt_time (set_color brpurple) (date +%H:%M) (set_color normal)

    string join '' -- '[' $prompt_time ']'

end
