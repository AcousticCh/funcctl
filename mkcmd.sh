#!/bin/bash

#add conditionals for possible binary directories
#add --help option
#add a third argument for choice of bin dir or if /usr/bin not found

makecommand () {
    case $1 in
        "-h" | "--help")
        echo "mkcmd takes a script/file and converts it into a bash shell command."
        echo ""
        echo "      Use: sudo mkcmd <new_command_name> <script/file>"
        echo ""
        echo "--------------------------------------------------------------------"
        echo ""
        echo "Options:"
        echo ""
        echo "-h, --help:"
        echo "      Print this menu to shell."
        ;;
        *)
        if [ -z $1 ]
        then
            echo "Type mkcmd -h or mkcmd --help for options and examples."
        else
            shc -f $2 -o $1
            rm ./$2.x.c
            mv $1 /usr/bin
        fi
        ;;
    esac
}

makecommand $1 $2