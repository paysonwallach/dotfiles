function up \
    --description '`cd` up the specified number of directory levels' \
    --argument-names levels
    cd (for i in (seq $levels); echo -n ../; end)
end
