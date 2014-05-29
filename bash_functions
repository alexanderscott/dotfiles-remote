###  BASH FUNCTIONS  ###
########################

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Check for the process running by name
#check() { ps aux | grep "$@"; }

cl() { 
    if [ -n "$1" ] ; then
        cd $1; 
    fi
    ls -Al; 
}
# Fuzzy cd
# Usage:
#    cdf public
# Changes to repos-public directory.


# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
        local tmpFile="${@%/}.tar"
        tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

        size=$(
                stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
                stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
        )

        local cmd=""
        if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
                # the .tar file is smaller than 50 MB and Zopfli is available; use it
                cmd="zopfli"
        else
                if hash pigz 2> /dev/null; then
                        cmd="pigz"
                else
                        cmd="gzip"
                fi
        fi

        echo "Compressing .tar using \`${cmd}\`…"
        "${cmd}" -v "${tmpFile}" || return 1
        [ -f "${tmpFile}" ] && rm "${tmpFile}"
        echo "${tmpFile}.gz created successfully."
}


# Determine size of a file or total size of a directory
function fs() {
        if du -b /dev/null > /dev/null 2>&1; then
                local arg=-sbh
        else
                local arg=-sh
        fi
        if [[ -n "$@" ]]; then
                du $arg -- "$@"
        else
                du $arg .[^.]* *
        fi
}


# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
        function diff() {
                git diff --no-index --color-words "$@"
        }
fi


# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
        if [ $# -eq 0 ]; then
                vim .
        else
                vim "$@"
        fi
}


# `o` with no arguments opens current directory, otherwise opens the given
# location
function o() {
        if [ $# -eq 0 ]; then
                open .
        else
                open "$@"
        fi
}


# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
        tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}
