#!/bin/bash 

PLATFORM=ubuntu  EMAIL=  CONTEXT=local 

while getopts p:l:t: opt; do
  case $opt in
  p)
      PLATFORM=$OPTARG
      ;;
  c)
      CONTEXT=$OPTARG
      ;;
  e)
      EMAIL=$OPTARG
      ;;
  esac
done

shift $((OPTIND - 1))

#PLATFORM=${1:-local}        # Set platform ( local, vm, remote )
#CONTEXT=${2:-personal}      # Set context ( personal, 


# CREATE SYMLINKS
rm ~/.bash_profile 2> /dev/null; ln -s ~/.dotfiles/bash_profile ~/.bash_profile;

cp -f ~/.profile ~/.profile.bak; unlink ~/.profile.bak;
rm ~/.profile 2> /dev/null ; ln -s ~/.dotfiles/bash_profile ~/.profile;

rm ~/.bash_aliases 2> /dev/null ; ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases;
rm ~/.bash_exports 2> /dev/null ; ln -s ~/.dotfiles/bash_exports ~/.bash_exports;
rm ~/.bash_paths 2> /dev/null ; ln -s ~/.dotfiles/bash_paths ~/.bash_paths;
rm ~/.bash_functions 2> /dev/null ; ln -s ~/.dotfiles/bash_functions ~/.bash_functions;
rm ~/.bash_prompt 2> /dev/null ; ln -s ~/.dotfiles/bash_prompt ~/.bash_prompt;

rm ~/.git-completion.bash 2> /dev/null ; ln -s ~/.dotfiles/git-completion.bash ~/.git-completion.bash;
rm ~/.git-prompt.sh 2> /dev/null ; ln -s ~/.dotfiles/git-prompt.sh ~/.git-prompt.sh;

# COPY CURRENT BASHRC TO BASHRC_LOCAL
rm ~/.bashrc_local 2> /dev/null ; touch ~/.dotfiles/bashrc_local; ln -s ~/.dotfiles/bashrc_local ~/.bashrc_local
cp ~/.bashrc ~/.bashrc.bak; unlink ~/.bashrc.bak;
rm ~/.bashrc 2> /dev/null ; ln -s ~/.dotfiles/bashrc ~/.bashrc;


cp -f ~/.vimrc ~/.vimrc.bak; unlink ~/.vimrc.bak;
rm ~/.vimrc 2> /dev/null; ln -s ~/.dotfiles/vimrc ~/.vimrc;
#rm ~/.gvimrc 2> /dev/null; ln -s ~/.dotfiles/gvimrc ~/.gvimrc;
rm -rf ~/.vim 2> /dev/null; ln -s ~/.dotfiles/vim ~/.vim;

#rm ~/.tmux.conf 2> /dev/null; ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf;
#rm ~/.irbrc ; ln -s ~/.dotfiles/irbrc ~/.irbrc;
rm ~/.screenrc 2> /dev/null; ln -s ~/.dotfiles/screenrc ~/.screenrc;
rm ~/.hushlogin 2> /dev/null; ln -s ~/.dotfiles/hushlogin ~/.hushlogin;
rm ~/.hgignore 2> /dev/null; ln -s ~/.dotfiles/hgignore ~/.hgignore;
rm ~/.inputrc 2> /dev/null; ln -s ~/.dotfiles/inputrc ~/.inputrc;


rm ~/.gjslint.ini 2> /dev/null; ln -s ~/.dotfiles/gjslint.ini ~/.gjslint.ini;
rm ~/.jshintrc 2> /dev/null; ln -s ~/.dotfiles/jshintrc ~/.jshintrc;
rm ~/.npmrc 2> /dev/null; ln -s ~/.dotfiles/npmrc ~/.npmrc;

rm ~/.gitattributes 2> /dev/null; ln -s ~/.dotfiles/gitattributes ~/.gitattributes;
rm ~/.gitignore_global 2> /dev/null; ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global;
rm ~/.gitconfig 2> /dev/null; ln -s ~/.dotfiles/gitconfig ~/.gitconfig;
rm -rf ~/.git_template 2> /dev/null; ln -s ~/.dotfiles/git_template ~/.git_template;

# set up global gitignore config
git config --global core.excludesfile '~/.gitignore_global';
git config --global init.templatedir '~/.git_template';



# create dir for git post-commit pics =)
mkdir ~/.gitshots

if [[ ! -z $EMAIL ]]
then
    git config --global user.email $EMAIL
fi

#if [[ $CONTEXT == vm ]]
#then
    #rm ~/.bash_prompt 2> /dev/null ; ln -s ~/.dotfiles/bash_prompt_vm ~/.bash_prompt
#fi

#if [[ $CONTEXT == remote ]]
#then
    rm ~/.bash_prompt 2> /dev/null ; ln -s ~/.dotfiles/bash_prompt_remote ~/.bash_prompt
#fi
    

sudo apt-get install -y htop vim git fail2ban cpulimit ftp curl gzip openssh-server openssh-client rsync sed grep traceroute build-essential nmap

# Web server, db packages
sudo apt-get install -y nginx squid3 ruby-mysql 
sudo apt-get install -y sqlite3 mysql-server zip wget curl redis-server screen tmux 
sudo apt-get install -y php5-cgi php5-fpm php5-mysql php5
sudo apt-get install -y python-pip python-dev build-essential 


# install aws tools
cd /tmp
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
complete -C aws_completer aws

# install aws ec2 tools
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
sudo mkdir /usr/local/ec2
sudo unzip ec2-api-tools.zip -d /usr/local/ec2



# install rvm
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.bash_profile
source ~/.profile
rvm install 2.1.1
rvm use 2.1.1

# Python & pip
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 

# Webdev helpers
sudo pip install ngxtop


#mkdir ~/.vim/backups;
#mkdir ~/.vim/swaps;
#mkdir ~/.vim/undo;

# LOAD SUBMODULES 
cd ~/.dotfiles
git submodule init 
git submodule update

# CREATE NEEDED TMP DIRECTORIES
#mkdir -p ~/tmp/vim/undo;

exit 0;
