FROM archlinux:latest

RUN pacman -Syyu --noconfirm base-devel git vim

RUN useradd -m docker_user && \
    passwd -d docker_user && \
    printf 'docker_user ALL=(ALL) ALL\n' | tee -a /etc/sudoers

USER root

RUN mkdir /AUR && chown docker_user:docker_user /AUR

USER docker_user

WORKDIR /AUR

RUN git clone https://aur.archlinux.org/paru.git

WORKDIR /AUR/paru

RUN makepkg -si --noconfirm

USER root

WORKDIR /