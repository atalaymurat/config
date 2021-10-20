export PATH=$HOME/bin:/usr/local/bin:$PATH

### EXPORT
export TERM="xterm-256color"


export ZSH="/home/mata/.oh-my-zsh"
export PATH="/home/mata/.local/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(git colored-man-pages ruby rails)

source $ZSH/oh-my-zsh.sh



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

eval "$(starship init zsh)"
#vifm run script for image previews
alias vifm="/home/mata/.config/vifm/scripts/vifmrun"

#FZF
source ~/.fzf/shell/key-bindings.zsh
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_COMMAND="ag --silent --hidden -l -o"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias neofetch='neofetch --ascii_colors 2 7 --colors 2 7 2 2 7 7 2'
neofetch

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
#Autoconnect Bluetooth device
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias config='/usr/bin/git --git-dir=/home/mata/.cfg/ --work-tree=/home/mata'
