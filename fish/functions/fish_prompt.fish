function fish_prompt
    # Save previous exit code
    set -l exit_code $status

    set -l prompt ""
    set -l user_and_host ""
    set -l current_directory (__parse_current_directory)
    set -l command_duration ""


    # Check if user is in an SSH session
    if [ "$SSH_CONNECTION" != "" ]
        set -l host (hostname -s)
        set -l user (whoami)

        if [ "$user" = "root" ]
            set user "$minima_root_color$user"
        else
            set user "$minima_username_color$user"
        end

        # Format user and host part of prompt
        set user_and_host "$minima_username_color$user$minima_color_gray@$minima_host_color$host$minima_color_gray:$minima_color_normal "
    end

    # Format current directory on prompt output
    set prompt "$minima_color_cyan$current_directory$minima_color_normal "

    set -l color_symbol $minima_color_green

    # Handle previous failed command
    if test $exit_code -ne 0
        # Symbol color is red when previous command fails
        set color_symbol $minima_color_red
        if test $minima_separate_prompt_on_error -eq 1
            set color_symbol $minima_color_red$minima_symbol_prompt$minima_color_green
        end
    end

    set prompt $prompt "$color_symbol$minima_symbol_prompt$minima_color_normal "

    echo -e -s $prompt

    set __minima_fresh_session 0
end
