#export ZSH="/home/newbuntu/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

#echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/newbuntu/.profile
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

ZSH_THEME="robbyrussell"

plugins=(git zsh-z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vc="vi ~/.config/nvim/init.vim"

export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3  }'):0"


