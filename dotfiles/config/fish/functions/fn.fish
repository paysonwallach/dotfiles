function fn \
    --description 'Find files/directories by substring' \
    --argument-names substring max_depth
    if [ -z "$max_depth" ]
        find . -iname "*$substring*"
    else
        find . -maxdepth "$max_depth" -iname "*$substring*"
    end
end
