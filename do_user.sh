#!/bin/bash

function wait_for_pid_to_disappear() {
    while [ ! -z "`ps -p ${1} -o cmd --no-headers`" ]; do
        sleep 1
    done
}

ORIG_PWD=${PWD}

ssh-keygen -t rsa -b 4096 -C "george.lorch@percona.com" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

sudo apt-get update
sudo apt-get install -y fail2ban vim screen git make cmake gcc g++ libncurses5-dev libreadline-dev bison libz-dev libgcrypt20 libgcrypt20-dev libssl-dev libboost-all-dev valgrind python-mysqldb mdm clang libasan5 clang-format libldap2-dev

ssh -o "StrictHostKeyChecking no" -T git@github.com
git config --global user.email "george.lorch@percona.com"
git config --global user.name "George O. Lorch III"
git config --global core.editor "vim"
mkdir ~/dev
cd ~/dev
wget http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.gz
tar -xzf boost_1_59_0.tar.gz
rm boost_1_59_0.tar.gz
wget http://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.gz
tar -xzf boost_1_66_0.tar.gz
rm boost_1_66_0.tar.gz
wget http://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz
tar -xzf boost_1_67_0.tar.gz
rm boost_1_67_0.tar.gz
wget http://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.gz
tar -xzf boost_1_68_0.tar.gz
rm boost_1_68_0.tar.gz
wget http://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz
tar -xzf boost_1_69_0.tar.gz
rm boost_1_69_0.tar.gz
wget http://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz
tar -xzf boost_1_70_0.tar.gz
rm boost_1_70_0.tar.gz



echo -e "set expandtab\n" \
"set ts=2\n" \
"set sw=4\n" \
"set softtabstop=4\n" \
"set number\n" \
"map <C-K> :py3f /usr/share/vim/addons/syntax/clang-format.py\n" \
"imap <C-K> <c-o>:py3f /usr/share/vim/addons/syntax/clang-format.py\n" >> ~/.vimrc

cd ${ORIG_PWD}
