
#!/bin/bash

# convert swiftlint's output into GitHub Actions Logging commands
# https://help.github.com/en/github/automating-your-workflow-with-github-actions/development-tools-for-github-actions#logging-commands


function stripPWD() {
    sed -E "s/$(pwd|sed 's/\//\\\//g')\///"
}

function format() {
    sed -E 's/^(.*):([0-9]+):([0-9]+) (warning|error) (.*)/::\4 file=\1,line=\2,col=\3::\5/'
}

function convertToGitHubActionsLoggingCommands() {
    while read line; do
        if  [[ $line == "$(pwd)"* ]] ;
        then
            path=$(echo $line | stripPWD)
        fi
        pat="^([0-9]+):([0-9]+) (warning|error|[^:]+) (.*)"
        echo $line
        if [[ $line =~ $pat ]];
        then
            echo $path:$line
            echo $path:$line | format
        fi
    done
}

set -o pipefail && eslint "$@" . | convertToGitHubActionsLoggingCommands
