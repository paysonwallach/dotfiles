function fish_title
    set cwd (basename $PWD)

    if [ $cwd = "paysonwallach" ]
        echo "~"
    else
        echo $cwd
    end
end
