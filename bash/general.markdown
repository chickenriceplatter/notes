shell
---

#### make shell script executable
```bash
chmod 555 file_name
```

##### numerical operations

- wrap experssion in double parentheses (())

comparison operations

- wrap experssion in double square brackets [[]]


#### change ownership for folder and all subfolders

```bash
$ sudo chown -R owner_name <directory>
```

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

#### split a file into n files
```bash
$ split -l <number_of_lines> <file_name> <new_files_prefix>
$ split -l 15 number.txt apart
```

#### create a new file from the first n lines of a file
```bash
$ head -<number_of_lines> <file_name> > <new_file_name>
$ head -100 somefile.txt > newfile.txt
```

#### translate (tr)
```bash
$ echo 'a,b,c' | tr ',' '-' # => a-b-c
$ echo '12345678987654321' | tr '123456789' 'abcdefghi' # => abcdefghihgfedcba
```

#### deletion using tr
```bash
$ echo 'a,b,c,d,e,f,g' | tr -d ',' # => abcdefg
```

#### cut
- -c for characters
- -b for bytes
- -f for fields
```bash
$ cut -d [delimiter] -f [field_index] file_name > new_file_name
```


