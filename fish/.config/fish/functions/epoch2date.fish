function epoch2date \
        --description "Convert an epoch timestamp to a human-readable date" \
        --argument-names timestamp
    echo (date -d @"$timestamp")
end
