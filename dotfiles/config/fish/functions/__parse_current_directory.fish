function __parse_current_directory
    set cwd (basename $PWD)

    if [ $cwd = (basename $HOME) ]
        echo "~"
    else
        echo $cwd
    end
end
