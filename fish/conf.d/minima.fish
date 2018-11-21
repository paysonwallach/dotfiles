# Whether or not is a fresh session
set -g __minima_fresh_session 1

# Symbols

__minima_set_default minima_symbol_prompt "❯"

# Colors

__minima_set_default minima_color_red (set_color red)
__minima_set_default minima_color_green (set_color green)
__minima_set_default minima_color_blue (set_color blue)
__minima_set_default minima_color_yellow (set_color yellow)
__minima_set_default minima_color_cyan (set_color cyan)
__minima_set_default minima_color_gray (set_color 93A1A1)
__minima_set_default minima_color_normal (set_color normal)

__minima_set_default minima_username_color $minima_color_blue
__minima_set_default minima_host_color $minima_color_green
__minima_set_default minima_root_color $minima_color_red

# Max execution time of a process before its run time is shown when it exits
__minima_set_default minima_command_max_exec_time 5

__minima_set_default minima_separate_prompt_on_error 1
function pre_prompt --on-event fish_prompt
    # No command to test on fresh session
    if test $__minima_fresh_session -eq 0
        # Prompt command execution duration
        if test -n "$CMD_DURATION"
            set command_duration (__format_time $CMD_DURATION $minima_command_max_exec_time)
        end

        if test -n "$command_duration"
            set pre_prompt "\n"
        end

        set pre_prompt $pre_prompt "$minima_color_yellow$command_duration$minima_color_normal"

        echo -e -s $pre_prompt
    end
end

function minima_uninstall --on-event minima_uninstall
  functions -e pre_prompt
end
