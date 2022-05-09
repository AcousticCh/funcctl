#!/bin/bash
# Add -r remove option
envctl() {
	case $1 in
		"-c" | "--create")
			python3 -m venv $2
			echo $(pwd)/$2 >> ~/text_files/my_environments.txt
		;;
		"-a" | "--activate")
			source ./$2/bin/activate
		;;
		"-r" | "--remove")
			rm -rf $2
		;;
		"-h" | "--help")
			echo "The envctl (environment controller) speeds up and simplifies the creation and use of a python3 venv."
            echo ""
            echo "----------------------------------------------------------------------------------------------------"
            echo ""
			echo "Options: "
            echo ""
			echo "	-c, --create: "
			echo "			Creates a python3 virtual environment in present working directory"
			echo "			ex: envctl -c <env_name>"
            echo ""
			echo "	-a, --activate: "
			echo "			Activates an environment quickly by name"
			echo "			ex: . envctl -a <env_name>"
			echo ""
			echo "deactivation of an environment is a function of the venv module itself,"
			echo "in the directory you activated your environment you deactivate it by simply tyiping deactivate"
			echo "			ex: deactivate"
		;;
		*)
		echo "Type envctl -h or envctl --help for options and examples."
        ;;
	esac

}

envctl $1 $2