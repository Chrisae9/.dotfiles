# .dotfiles
How to install my setup for my unix system.

**Includes**: git, zsh, nvim, ssh, fonts, scripts, VS Code, etc.

# Setup

### Install curl
`sudo apt-get install curl`

### Clone repository in your HOME directory
`cd ~ && git clone https://github.com/Chrisae9/.dotfiles.git`

### Run install script inside of directory
`cd .dotfiles/ && ./install`

# Tips
```
ssh-keygen -t rsa
git config --global user.name "githubid"
git config --global user.email "something"@gmail.com

vim ~/.ssh/config

~~~~~~~~~~~~~~~~~~~~
Host "shortcut"
    User "username"
    Hostname "address" 
    Port "number"
    IdentityFile "~/.ssh/file"
~~~~~~~~~~~~~~~~~~~~

ssh-copy-id "shortcut"

scp "shortcut":[filepath] [location to place file]
```