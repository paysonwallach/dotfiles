function fish_prompt
    set_color blue
    echo -n $USER

    set_color white
    echo -n "@"

    set_color green
    echo -n (hostname)

    set_color white
    echo -n ": "

    set_color yellow

    set -g cwd (basename $PWD)
    if [ $cwd = $USER ]
        set cwd "~"
    end

    echo -n -s $cwd " » "

    set_color normal
end
