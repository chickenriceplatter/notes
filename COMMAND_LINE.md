# Command Line

#### Shortcuts

- **Ctrl + a** – go to the start of the command line
- **Ctrl + e** – go to the end of the command line
- **Ctrl + k** – delete from cursor to the end of the command line
- **Ctrl + u** – delete from cursor to the start of the command line
- **Ctrl + w** – delete from cursor to start of word (i.e. delete backwards one word)
- **Ctrl + r** – search the history backwards
- **Ctrl + g** – escape from history searching mode
- **Ctrl + l** – clear the screen
- **Ctrl + s** – stops the output to the screen (for long running verbose command)
- **Ctrl + q** – allow output to the screen (if previously stopped using command above)
- **Ctrl + c** – terminate the command
- **Ctrl + z** – suspend/stop the command

#### common commands

- **!!** - run last command
- **cd -** - goes back to the last directory
- **mkdir -p** - creates both file and nested directory structure
- **ls -thor** - shows when each file in the directory was last edited and who did the editing

- afplay

- **date** - shows the current date and time
- **df** - shows amount of free space on disk drive
- **free** - shows amount of free memory
- **file** - determine file type
- **more** - view file contents, can only page forward
- **less** - view file contents, can page forward and backwards
- **ls -l** - outputs long format

- **type [command]** - shows the type of the command
- **which** - display an executable's location
- **man** - display a program's manual page

#### wildcards

- * - any characters
- ? - any one character
- [characters] - any characters in the set of characters
- [!characters] - any character that is not a member of the set.
- [[:class]] - matches any character that is a member of the class

###### classes

- [:alnum:] - matches any alphanumeric character
- [:alpha:] - matches any alphabetic character
- [:digit:] - matches any numeric character
- [:lower:] - matches any lowercase character
- [:upper:] - matches any uppercase character
