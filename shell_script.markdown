shell
---

#### show shells installed
    $ cat /etc/shells

#### show shell used currently
    $ echo $SHELL

#### change permission on script file
    $ chmod +x script_name
    $ chmod 755 script_name

#### show exit status
    $ echo $?

#### variables
+ system variables are defined in capital letters
+ user defined variables are lowercase

#### show all system variables
    $ set

#### print variable
    $ echo $variable_name

#### assign variables
    $ variable_name=value # no spaces around equal sign

#### shell arithmatics
    $ expr operand_1 operator operand_2

#### write output to file (overwrite existing file's content)

    $ command > file_name

#### write ouput to file (append to existing file's content)

    $ command >> file_name
