# MAC environment setup

#### Reformat Harddrive
+ restart
+ hold option key
+ [follow these instructions](http://support.apple.com/kb/ph11273)

#### Create Superuser account
+ username: choose user name
+ account name: choose account name
+ password: choose password

#### sublime text 2
- [ ] http://www.sublimetext.com/2
- [ ] install sublime package control: https://sublime.wbond.net/installation#st2
- [ ] To use 'subl' command in bash, do not symlink, add the following lines to your .bash_profile and reload bash.  Add to .zshrc for zsh.
```bash
alias subl="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"
export EDITOR="subl"
```

#### setup SSH
+ https://help.github.com/articles/generating-ssh-keys

#### XCODE & COMMAND LINE TOOLS
+ Install Xcode from Apple App Store
+ go to terminal and type in ```xcode-select --install``` to install command line tools.
+ full instructions for command line tools install: https://www.computersnyou.com/2025/install-command-line-tools-in-osx-10-9-mavericks-how-to/

### install iTerm2
+ http://www.iterm2.com

#### install bettertouchtools (window resizer)
+ http://www.macupdate.com/app/mac/32953/bettertouchtool
+ http://www.boastr.net/

#### install HOMEBREW
- [x] http://brew.sh/
+ Type this in command line:
```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
$ brew doctor
$ brew update
```

#### mysql
- [ ] type the following in command line
```bash
$ brew install mysql
```
- [ ] To have launchd start mysql now and restart at login:
```bash
$ brew services start mysql
```

- [ ] To manually start/stop mysql server
```bash
$ mysql.server start
$ mysql.server stop
```

#### RVM & RUBY
- `$ brew install gnupg`
- `$ brew install gnupg2`
- `$ brew install openssl`
- `$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
- `$ \curl -sSL https://get.rvm.io | bash -s stable`
- `$ rvm reinstall 2.3.0 --with-openssl-dir=/usr/local/opt/openssl`

+ <s>http://octopress.org/docs/setup/rvm/</s>
+ <s>replace ```1.9.3``` with whichever version of ruby you want to install.</s>

### Sequel Pro
+ http://www.sequelpro.com/


optional installs
---

#### PYTHON(2.X) & VIRTUALENV
```bash
$ brew install python
$ pip install virtualenv
$ cd [into folder where you will be keeping python env data]
$ virtualenv venv
$ source venv/bin/activate
$ deactivate
$ pip install ipython
```
+ http://docs.python-guide.org/en/latest/starting/install/osx/

#### ZSH
+ via wget or curl from https://github.com/robbyrussell/oh-my-zsh

### Adium
+ https://adium.im/

### Screenhero
+ http://screenhero.com/

### nvalt
+ http://brettterpstra.com/projects/nvalt/

#### spectacleapp (window resizer)
+ http://spectacleapp.com/

#### 1password
+ https://agilebits.com/onepassword/mac
