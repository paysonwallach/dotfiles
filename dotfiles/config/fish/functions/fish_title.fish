function fish_title
    set cwd (basename $PWD)

    if [ $cwd = (basename $HOME) ]
        echo "~"
    else
        echo $cwd
    end
end
