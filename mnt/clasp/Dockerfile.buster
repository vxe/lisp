FROM cracauer/cando

WORKDIR /root

ENV TERM=xterm-256color
ENV DEBIAN_FRONTEND=noninteractive
    # RUN  apt-get -y update && apt-get -y install git net-tools cmake build-essential zsh curl wget ansible vim-nox cron gnutls-bin liblockfile1 rsync man
RUN apt-get -y update && apt-get -y install ansible git rsync vim-nox emacs25-nox rtags elpa-rtags
# java debian boiler plate
RUN git clone https://github.com/vxe/HOME.git && rsync -avz --exclude '.git' ./HOME/ /home/app
WORKDIR /home/app/boot
RUN ansible-playbook -l localhost /home/app/boot/home.yml --verbose
RUN emacs --debug-init -nw --batch -l ~/.emacs.d/init.el --eval="(+ 2 3)" 

RUN apt-get update && apt-get -y install `apt-cache search libclang | grep 3.6 | awk '{print $1}' | xargs`
WORKDIR /root/build
ADD . /root/build

RUN pip install --upgrade cmake
RUN apt-get -y install libncurses5-dev zlib1g-dev libtinfo5
RUN git clone --recursive https://github.com/cquery-project/cquery.git;cd cquery;mkdir build && cd build;cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES;cmake --build . ;cmake --build . --target install

ENTRYPOINT [ "bash" ]
