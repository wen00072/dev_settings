#=============================================================================
# References:
# ssh
#   1. https://docs.docker.com/engine/examples/running_ssh_service/
#   2. https://jimmylin212.github.io/post/0007_create_an_ssh_login_image/
# X11:
#   1. https://gist.github.com/udkyo/c20935c7577c71d634f0090ef6fa8393
#=============================================================================
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt install -y apt-utils aptitude && \
    aptitude upgrade -y --full-resolve && \
    apt-get install -y openssh-server sudo xauth vim-gtk locales meld tree    \
    build-essential bison flex automake libtool intltool libncurses5-dev tig  \
    cscope fonts-inconsolata exuberant-ctags manpages-dev manpages-posix-dev  \
    terminator ghex mc sshfs bc libssl-dev cmake gdb libatk-adaptor net-tools \
    libgail-common bash-completion python3 libpython3-all-dev strace lsof     \
    lsb-release

#=============================================================================
# Install ssh with X11 forwarding
#=============================================================================
RUN mkdir /var/run/sshd
RUN locale-gen en_US.UTF-8 && update-locale en_US.UTF-8
RUN useradd -ms /bin/bash user
RUN adduser user sudo
RUN echo 'user:user' | chpasswd \
    && ssh-keygen -A \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV NOTVISIBLE "in users profile"

RUN echo "export VISIBLE=now" >> /etc/profile
RUN apt -y clean

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
