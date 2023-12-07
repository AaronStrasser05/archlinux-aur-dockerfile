FROM archlinux:latest

RUN pacman -Syyu --noconfirm base-devel git vim

RUN useradd -m USER && \
    passwd -d PASSWORD && \
    printf 'USER ALL=(ALL) ALL\n' | tee -a /etc/sudoers

RUN mkdir /AUR

USER USER

WORKDIR /AUR

RUN git clone https://aur.archlinux.org/paru.git

WORKDIR /AUR/paru

RUN makepkg -si --noconfirm

USER root

WORKDIR /