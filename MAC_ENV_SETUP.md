# MAC environment setup

#### Reformat Harddrive
+ restart
+ hold option key
+ [follow these instructions](http://support.apple.com/kb/ph11273)

#### Create Superuser account
+ username: choose user name
+ account name: choose account name
+ password: choose password

#### Sublime Text Editor
+ download from sublime text, move to applications folder
+ To use subl command in bash, do not symlink, add the following lines to you .bash_profile and reload bash.

    alias subl="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"
    export EDITOR="subl"

#### XCODE & COMMAND LINE TOOLS
+ Install Xcode from Apple App Store
+ Once installed, open Xcode, go to: Xcode > Preferences... > Downloads > Components (tab)
+ click install Command Line Tools

#### HOMEBREW
+ Type this in command line: ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
+ brew doctor
+ brew update
+ Instructions are here: http://mxcl.github.io/homebrew/

#### WGET
+ brew install wget

#### RVM & RUBY
+ http://octopress.org/docs/setup/rvm/

#### MYSQL
+ brew install mysql

1. check if there exists ~/Library/LaunchAgents, if not type this in command line: mkdir -p ~/Library/LaunchAgents

2. go /usr/local/Cellar/mysql and ls to find version number -- my_sql_version_number

3. cp /usr/local/Cellar/mysql/[my_sql_version_number]/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/

4. launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

5. unset TMPDIR

6. (maybe optional) mysql_install_db --verbose --user=[whoami]--basedir=[$(brew --prefix mysql)]--datadir=/usr/local/var/mysql --tmpdir=/tmp

7. (optional) /usr/local/Cellar/mysql/[my_sql_version_number]/bin/mysqladmin -u root password [password in quotation marks]

Instructions: http://madebyhoundstooth.com/blog/install-mysql-on-mountain-lion-with-homebrew/

#### POSTGRES
+ download from http://postgresapp.com/ and move app to application folder

#### SSH
+ https://help.github.com/articles/generating-ssh-keys

#### ZSH
+ via wget or curl from https://github.com/robbyrussell/oh-my-zsh
