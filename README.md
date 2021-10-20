# config backups and dotfiles
dotFiles and Config Backups of linux 

inspired from 
https://atlassian.com/git/tutorials/dotfiles

## prepare git repo
------------------------------------
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```
------------------------------------

### add files to git repo
------------------------------------
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push

```
------------------------------------

## Install your dotfiles onto a new system (or migrate to this setup)

### add alias to zshrc or bashrc
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
prepare your gitignore file not to track .cfg folder

```
echo ".cfg" >> .gitignore
```

```
git clone --bare git@github.com:atalaymurat/config.git $HOME/.cfg

checkout the actual content

config checkout
```

error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting


This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care.

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout
```
You're done, from now on you can now type config commands to add and update your dotfiles:
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
-----------------------------------------------
## Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script
Change git Url to your login Url 

```
git clone --bare git@github.com:atalaymurat.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
-----------------------------------------------
