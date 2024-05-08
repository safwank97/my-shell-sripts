#!/bin/bash

echo "Starting program at $(date)" # Date will be substituted

# Print the name of the running script along with number of 
# arguments given and process id assigned to the running script
echo "Running program $0 with $# arguments with pid $$"  

# Looping over all the files in pwd which are passed as arguments
for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null
    # When foobar pattern is not found, grep has exit status 1
    # We redirect STDOUT and STDERR to a null register since we do not care about them

    if [[ "$?" -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"

        echo "# foobar" >> "$file"
    fi
done
#foobar