
#
# ~/.bash_aliases
#
eval $(thefuck --alias fuck)
# Safeguarding aliases to confirm file changes
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ls='ls --color=auto'
alias vi='/usr/bin/vim'
alias l='ls -Al'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'

# Passing aliases when using sudo
alias sudo='sudo '

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && \
        eval "$(dircolors -b ~/.dircolors)" || \
        eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias grep='grep -n -B 4 -A 4 --colour --exclude tags -e'

export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#git downloads path (gpd)
export GDP=$HOME"/Downloads/gitDownloads"
export PATH="$PATH:$GDP/skim/bin"
# bash env agnostic exports
#export FZF_DEFAULT_COMMAND
export SC="$HOME/profile_config/customscripts/"
alias fd='fdfind'
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--reverse --inline-info --ansi --preview-window=up:58"
export FZF_COMPLETION_TRIGGER=']]'
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
# Custom Aliases
alias orphan='& disown'
alias fsearch='rg . -n -g "!*.html" | fzf --preview="source $SC/string2arg.sh; string2arg {}"'
alias nfsearch='export vfile=$(fsearch);nvim +$(cut -d":" -f2 <<< $vfile) \
    $(cut -d":" -f1 <<< $vfile)'
alias plugfsearch='export vfile=$(fsearch);echo +$(cut -d":" -f2 <<< $vfile) \
    $(cut -d":" -f1 <<< $vfile)'
alias vfsearch='export vfile=$(fsearch);vi +$(cut -d":" -f2 <<< $vfile) \
    $(cut -d":" -f1 <<< $vfile)'
alias cfsearch='export cfile=$(fsearch);code --goto \
    $(cut -d":" -f1 <<< $cfile):$(cut -d":" -f2 <<< $cfile) & disown'
alias fcheck='git_checkout $(git branch | fzf)'
alias rcheck='git_checkout $(git branch -r | fzf)'
alias ncheck='git checkout'
alias rebase='git_rebase'
alias commit='git_commit_message'
alias fixup='git_commit_fixup'
alias cloneHome='git_clone'
alias mi='maint_ip'
alias pull='git pull -p'
alias nn='nvim'
alias nf='nvim $(fzf)'
alias vf='vfile=$(fzf --preview="cat {}");vim $vfile && echo $vfile'
alias asource='source ~/.bashrc;source ~/.zshrc'
alias update='sudo apt update && sudo apt upgrade -y && brew update'
alias fbit='git lg $(fuzzls)'
alias obd='/usr/bin/python3 ~/util/wescam-obd.py'
alias cdc='cd ~/cfgdb'
alias cdr='cd ~/Projects/workRequests/bugfixes/release/'
alias fdiff='git diff $(fuzzls)'
alias up='nmcli -p con up id Ethernet'
alias down='nmcli -p con down id Ethernet'
alias pep8='autopep8 --in-place --aggressive --aggressive'
alias reset='git reset HEAD --hard'
alias gbit="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias s='subl'
alias vi='nvim'
alias cdg='cd $GDP'
if [ "$TMUX" = "" ]; then tmux attach; fi


export BAT_THEME="OneHalfLight"


function add_alias() {
 $1 >> ~/.bash_aliases
}
function say_hello() {
    echo "Hello"
}

