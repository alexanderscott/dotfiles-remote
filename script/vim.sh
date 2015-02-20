#!/bin/bash

set -e
cd "$(dirname "$0")"
echo "Replacing vim config"

#if [ -d "~/.vim" ]; then
  #rm -rf ~/.vim
#fi

#if [ -f "~/.vimrc" ]; then
  #rm -rf ~/.vimrc
#fi

#mkdir ~/.vim
#ln -s ~/.dotfiles/vim.symlink/ ~/.vim

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
    msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}
debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
      msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}
error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

remove_current_vim_setup() {
    rm -rf ~/.vim
    rm -rf ~/.vimrc

    mkdir ~/.vim
    mkdir ~/.vim/bundle
    mkdir ~/.vim/backups
    mkdir ~/.vim/swap
    mkdir ~/.vim/undo

    #cp -R ~/.dotfiles/vim/* ~/.vim/
    ln -s ~/.dotfiles/vim/vimrc.symlink ~/.vimrc

}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    
    vim \
        -u "$app_dir/.vimrc.bundles.default" \
        "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"
    
    export SHELL="$system_shell"

    success "$1"
    debug
}


program_exists "vim" "To install $app_name you first need to install Vim."
#setup_vundle    "Now updating/installing plugins using Vundle"
remove_current_vim_setup "removing current vim setup"

mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do curl -o ~/.vim/$d/scala.vim https://raw.githubusercontent.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim; done
