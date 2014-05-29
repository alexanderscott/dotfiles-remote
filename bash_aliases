### ALIASES ###
###############

# DEV ALIASES #
#jsonpp() { cat "$@" | python -mjson.tool >> "$@"; }
# cat unformatted.json | py-json > formatted.json
alias prettify='python -mjson.tool'

# Delete all branches beginning with local-app
alias delete-local-branches='git branch  | cut -c3- | egrep "^local-app" | xargs git branch -D'

# Remove .DS_Store files
alias rm-dsstores='find ./ -type f | grep .DS_Store | xargs rm'

# Find and sort by large files recursively
alias sort-large-files='find -type f -printf "%s %p\n" |sort -nr | head'

# POSTGRES ALIASES #
alias pg-start='postgres -D /usr/local/var/postgres'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Lazy aliases
alias l="ls -l"
alias la="ls -lah"
alias ..="cd .."
alias tree="tree -C"
alias trls="tree -C | less -R"  # -C outputs colour, -R makes less understand color
alias mode="(set -o | grep emacs.*on >/dev/null 2>&1 && echo 'emacs mode' || echo 'vi mode')"

# SVN aliases
alias svnadd="svn st | grep '^\?' | awk '{print $2}' | xargs svn add"
alias svnrmd="svn st | grep '^\!' | awk '{print $2}' | xargs svn rm"

# git aliases
# http://titusd.co.uk/2010/08/29/use-g-as-an-alias-for-git-without-losing-autocompletion
alias g="git"
alias gs="git status"
alias gbv="git branch -v"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gpd="git push origin HEAD:refs/for/devel"
alias gcd="git checkout devel"
alias gp="git pull"
alias gbl="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias git-list-submodules="grep path .gitmodules | sed 's/.*= //'"

# Vim aliases
alias rvim="mvim --remote-silent "

# Open MacVim as alias for remote tabs
#alias mvim='open -a MacVim.app'

# Set terminal colors when launching screen
#alias tmux="TERM=screen-256color-bce tmux"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Reload .bashrc
alias refresh='. ~/.bashrc'

alias 644.='find . -type f -exec chmod 644 {} \;'
alias print-colors='( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )'

# test internet connection speed
alias ispeed='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# get file sizes in mb
alias ls-mb='ls -l --block-size=1M'

# For advanced line-editors, start node with the environmental variable NODE_NO_READLINE=1. 
# This will start the main and debugger REPL in canonical terminal settings which will allow you to use with rlwrap.
#alias node="env NODE_NO_READLINE=1 rlwrap node"

# point ctags to homebrew version
alias ctags='/usr/local/bin/ctags'

# Vagrant shortcuts
alias vh='vagrant halt'
alias vsus='vagrant suspend'
alias vssh='vagrant ssh'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vup='vagrant up'

alias ll='ls -lah'
alias gg='git status -s'

alias list-big-files='find . -type f -print0 | xargs -0 du -h | sort -hr | head -20'

#sudo /Library/StartupItems/VirtualBox/VirtualBox restart
alias vagrant-restart='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'


#alias find-replace="find ./ -type f -exec sed -i 's/{print $2}/{print $3}/' {} \;"
#alias find-replace='find ./ -type f -print0 | xargs -0 sed -i "s/{print $2}/{print $1}/g"'
alias find-replace="find . -type f -name '*.*' -exec sed -i '' s/{print $2}/{print $3}/ {} +"

alias filesizes='du -ksh */ | sort -nr'
