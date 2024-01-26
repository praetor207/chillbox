FROM nvidia/cudagl:11.4.1-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y weechat gopher tmux kitty x11vnc zsh wget xorg git xvfb libgl1 libgl1-mesa-glx

RUN useradd -m chill -s /usr/bin/zsh

WORKDIR /home/chill

RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

RUN git clone https://github.com/powerline/fonts
WORKDIR ./fonts
RUN ./install.sh

WORKDIR /home/chill
COPY zshrc /home/chill/.zshrc

EXPOSE 5900
EXPOSE 22

COPY entrypoint.sh /home/chill/entrypoint.sh
RUN chmod +x /home/chill/entrypoint.sh

CMD ["/home/chill/entrypoint.sh"]