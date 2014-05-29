.files-remote
=================
![alt text](http://retrothing.typepad.com/photos/uncategorized/2008/02/07/avrterminal.jpg "looks something like this")

Installation


    ssh user@host "git clone git://github.com/alexanderscott/dotfiles-remote.git"


Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd dotfiles
    git submodule init
    git submodule update

To install, simply run `sh install.sh`

I put Vim's backup and swap files in `~/tmp`, so that directory must exist. To
be sure, run: 

    mkdir ~/tmp


# VIM #

My preferences for Vim are stored in `dotfiles-remote/vimrc` and `dotfiles-remote/gvimrc`
respectively. All plugins and scripts are stored in the `dotfiles/vim`
directory.

## Adding Plugin Bundles ##

Plugins that are published on github can be installed as submodules. For
example, to install the [JavaScript bundle][jsbun], follow these steps:

    cd ~/dotfiles
    git submodule add http://github.com/pangloss/vim-javascript.git vim/bundle/vim-javascript

This will update the `.gitmodules` file by appending something like:

    [submodule "vim/bundle/vim-javascript"]
        path = vim/bundle/vim-javascript
        url = http://github.com/pangloss/vim-javascript.git
    
As well as checkout out the git repo into the
`vim/bundle/vim-javascript` directory. You can then commit these changes
as follows:

    git add .
    git ci -m "Added the javascript bundle"


# CONTRIBUTIONS #

Thank you:
- https://github.com/nelstrom/dotfiles
- https://github.com/spf13/spf13-vim


[jsbun]: http://github.com/pangloss/vim-javascript.git
[ap]: http://github.com/michaeldv/awesome_print
[i_editor]: http://github.com/jberkel/interactive_editor
