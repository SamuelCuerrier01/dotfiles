#!/usr/bin/env bash

setup_dossiers() {
    echo " creation du dossier ~/bin"
    mkdir -p ~/bin
    echo " creation du dossier ~/cegep"
    mkdir -p ~/cegep
    echo " creation du dossier ~/cegep/prog_systeme"
    for (( i=1; i<16; i++ )); do
        echo "creation dossier ~/cegep/prog_systeme/Cours$i"
        mkdir -p "$HOME/cegep/prog_systeme/Cours$i"
    done
    mkdir -p ~/cegep/prog_systeme
    echo " creation du dossier ~/projets"
    mkdir -p ~/projets
}

setup_logiciels() {
    echo "installation de firefox"
    yes "" | sudo pacman -S firefox
    echo " installation de git"
    yes | sudo pacman -S git
    echo " installation de vim"
    yes | sudo pacman -S neovim
    echo " installation de vsc"
    yes | sudo pacman -S code
    echo " installation de GCC"
    yes | sudo pacman -S gcc
    echo " installation de GDB"
    yes | sudo pacman -S gdb
    echo " installation de Python3"
    yes | sudo pacman -S python3
    python --version
    yes | sudo pacman -S python-pip
    pip3 --version
    echo "le python3-venv est déja inclut dans le package de python"
}
setup_ssh() {
    echo "generation de la cle ssh pour github"
    ssh-keygen -t ed25519 -C "6297553@cstjean.qc.ca"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
}

setup_dossiers
setup_logiciels
cp .bashrc ~/
cp .gitconfig ~/
cp -r .ssh ~/
clear
setup_ssh 

