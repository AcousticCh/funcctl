#!/bin/bash

search()
{
	case $1 in
		"-ff" | "--findfile")
		#find file in directory
		case $4 in
			"-r" | "--regex")
			sudo find $3 -type f -name $2 | grep $5
			;;
			*)
			sudo find $3 -type f -name $2
			;;
		esac
		;;

		"-fd" | "--finddir")
		#find directory in directory
		case $4 in
                        "-r" | "--regex")
                        sudo find $3 -type d -name $2 | grep $5
                        ;;
                        *)
                        sudo find $3 -type d -name $2
                        ;;
                esac
		;;

		"-l" | "--locate")
		#locate file or directory
		sudo updatedb
		case $3 in
			"-r" | "--regex")
			sudo locate $2 | grep $4
			;;
			*)
			sudo locate $2
			;;
		esac
		;;

		"-w" | "--which")
		case $3 in
			"-r" | "--regex")
			which $2 | grep $4
			;;
			*)
			which $2
			;;
		esac
		;;

		"-ws" | "--whereis")
		case $3 in
			"-r" | "--regex")
                        whereis $2 | grep $4
                        ;;
			*)
			whereis $2
			;;
		esac
		;;

		"-h" | "--help")
		echo "The search command is a convienent way of using many search commands well only remembering one."
		echo "The --help page lists the commands that search wraps as a quick reference so you can use those"
		echo "commands at their full power."
		echo ""
		echo "-----------------------------------------------------------------------------------------------"
		echo ""
		echo "Commands and Options:"
		echo ""
		echo "find:"
		echo "	-ff, --findfile: "
		echo "			Uses find command to find files,"
		echo "			ex: search -ff <file> <dir tree to search>"
		echo "	-fd, --finddir: "
		echo "			Uses find command to find directories,"
		echo "			ex: search -fd <dir> <dir tree to search>"
		echo "locate:"
		echo "	-l, --locate: "
		echo "			runs updatedb command and uses locate command to find files or directories"
		echo "			ex: search -l <file/dir>"
		echo "which:"
		echo "	-w, --which:"
		echo "			Uses which command to find programs and applications"
		echo "			ex: search -w <file>"
		echo "whereis:"
		echo "	-ws, --whereis: "
		echo "			Uses whereis command to find programs, source files and man files in a broad search range"
		echo "			ex: search -ws <file>"
		echo "grep:"
		echo "	-r, --regex: "
		echo "			refine any search by adding grep as a final parameter"
		echo "			ex: search -l <file> -r <keyword>"
		;;

		*)
		echo "Type search -h or search --help for options and examples"
		;;
	esac

}

search $1 $2 $3 $4 $5
