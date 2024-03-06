#!/usr/bin/env zsh

# This script is primarily to document the development lifecycles of the app. 
# Call ./run.sh -b to build the application
# Call ./run.sh -e for an example call
# Use ./run.sh -x --- to draw a line if you call the other two examples together

# ##############################################################################

usage() {
	echo "Usage statment"

	format="%4s %-4s : %s\n"
	printf "${format}" "Flag" "Arg" "Description"
	printf "${format}" "----" "----" "----"
	printf "${format}" "b" "" "Build command"
	printf "${format}" "e" "" "Show a usage example"
	printf "${format}" "x" "msg" "Prints out a message"
}

# ##############################################################################

# Behavior for no parameters
if [ $# -eq 0 ]; then
	usage
	exit 1
fi

while getopts bex: opt ; do
    case "${opt}" in
        b) go build -o gcss cmd/gcss/main.go ;;
        e) cat test/0001.gcss | ./gcss ;;
        x) echo "${OPTARG}" ;;
        *) usage ;;
    esac
done
