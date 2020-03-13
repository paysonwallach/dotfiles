function fext \
    --description 'Find files with the given extension' \
    --argument-names ext max_depth
    if [ -z "$max_depth" ]
        find . -type f -name "*.$ext"
    else
        find . -maxdepth "$max_depth" -type f -name "*.$ext"
    end
end
