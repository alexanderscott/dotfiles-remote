### BASH_PROFILE ###
####################

#export PATH=/usr/local/sbin:$PATH
#PATH=$PATH:/usr/local/bin:$PATH

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/{.bash_paths,.bash_prompt,.bash_exports,.bash_aliases,.bash_functions,.git-completion.sh,.git-prompt.sh,.bashrc_local}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Ruby
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Node
# {{{
# Node Completion - Auto-generated, do not touch.
#shopt -s progcomp
#for f in $(command ls ~/.node-completion); do
#  f="$HOME/.node-completion/$f"
#  test -f "$f" && . "$f"
#done
# }}}

#export NODE_PATH="/usr/local/lib/node"
#export PATH="/usr/local/lib/node_modules/npm/bin:$PATH"

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh


# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
