FROM cracauer/cando

WORKDIR /root

ENV TERM=xterm-256color
ENV DEBIAN_FRONTEND=noninteractive
    # RUN  apt-get -y update && apt-get -y install git net-tools cmake build-essential zsh curl wget ansible vim-nox cron gnutls-bin liblockfile1 rsync man
RUN for i in {1..8}; do mkdir -p "/usr/share/man/man$i"; done  # hack to fix stretch bug https://github.com/debuerreotype/debuerreotype/issues/10
RUN apt-get -y update && apt-get -y install ansible git rsync vim-nox 
# java debian boiler plate
RUN mkdir -p /usr/share/man/man1 && \
    (echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list) && \
    apt-get update -y && \
    apt-get install -yq --no-install-recommends default-jdk

RUN apt-get install unzip -y && \
    apt-get autoremove -y
RUN git clone https://github.com/vxe/home.git && rsync -avz --exclude '.git' /root/home/ /root
WORKDIR /root/boot
RUN ansible-playbook -l localhost /root/boot/home.yml --verbose
ENTRYPOINT [ "bash" ]
RUN apt-get -y install emacs25-nox rtags
RUN git clone https://github.com/vxe/home.git && rsync -avz --exclude '.git' /root/home/ /home/app && echo for real
RUN rm -rf home && git clone https://github.com/vxe/HOME.git && rsync -avz --exclude '.git' ./HOME/ /home/app && echo for real
RUN emacs --debug-init -nw --batch -l ~/.emacs.d/init.el --eval="(+ 2 3)" 
