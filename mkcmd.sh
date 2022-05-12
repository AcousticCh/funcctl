#!/bin/bash

#add conditionals for possible binary directories
#add --help option
#add a third argument for a choice of bin dir or if /usr/bin not found
#make .py version then put .py and .sh version in  seperate functions to be called in makecommand() depending on option
#make seperate move command
#make update manpage function


makebash () {
    shc -f $2 -o $1
    rm ./$2.x.c
    mv $1 /usr/bin
}

makepython () {
    chmod 755 $2
    cp $2 /usr/bin/$1
}

# 1 is command name 2 is text file 3 is section number
make_manpage () {
    cp $2 /usr/share/man/man$3/$1.$3
    gzip /usr/share/man/man$3/$1.$3
}

makecommandhelpmenu () {
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
}

makecommand () {
    SUCCESS="[+] Command created successfully"
    case $1 in
        "-h" | "--help")
        makecommandhelpmenu
        ;;
        "-m" | "--manpage")
        # make manpage <command name> <manpage file> <manpage section>
        make_manpage $2 $3 $4
        ;;
        "-r" | "--remove")
        rm -rf /usr/bin/$2
        #check for man pages-- and remove--
        ;;
        *)
        if [[ -n $2 ]]
        then 
            FILE_TYPE=$(file $2)
        fi

        if [[ -z $1 ]]
        then
            echo "Type mkcmd -h or mkcmd --help for options and examples."
        elif [[ $FILE_TYPE == *" Bourne-Again shell script"* ]]
        then
            makebash $1 $2
            echo $SUCCESS
        elif [[ $FILE_TYPE == *"Python script"* ]]
        then
            makepython $1 $2
            echo $SUCCESS
        fi
        ;;
    esac
}


makecommand $1 $2 $3 $4