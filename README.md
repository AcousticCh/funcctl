funcctl:
  funcctl is a tool that wraps many different commands and sets of commands, 
  allowing you to use one command to get output from many commands without having to constantly reference their names and many options.
  funcctl stands for "function controller". The script itself is a library of functions written in bash.
  Each function in this library is called like most commands.
    ex: search -w ~/text_files/new_file.txt
  search is a function in the funcctl library, there is an array of functions with different uses and intentions.
Functions as of 04/26/22:
  > envctl ( environment controller )
  > search ( file/directory search )
  
Use of the library:
  1. download the script, I personally created and put it in a directory called ~/lib/sh/
  2. add the directory funcctl is in to your bash path variable in the .bashrc file,
     on most linux systems you can find the file in your home directory if you run ls -a
  3. now you can use funcctl from anywhere in your file system.
     funcctl library will not give immediate access to the functions in it,
     I built it this way so that the controller library is normally off in case
     the libraries commands/functions clash with file or command names on your system
  4. activate your function library with
      ex: . funcctl
  5. Now you can use the libraries commands and
     when you leave the shell and open a new one later the library will be inactivate again
  
Commands/Functions:
  search:
    search is a collection of muiltiple commands used for file and directory searching.
    running search by itself or with -h, --help will give you a list of options
    each option in search refers to a file finding command 
    when you run --help the options will be accompanied by a list of the common commands it wraps
    and how to use them 
    
  envctl:
    envctl will soon have its own help data as well but for now,
    envctl is used to create python3 virtual environments.
    Instead of having to remember or reference the longer commands of venv
    A environment is created with
      ex: envctl -c env_name
      or
      ex: envctl --create env_name
      
    And activated with
      ex: envctl -a env_name
      or
      ex: envctl --activate env_name
      
    then you can deactivate the environment with 
    ex: deactivate
    which is the functionality of the venv, not funcctl's envctl
