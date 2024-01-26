FROM ubuntu:latest

# Install dependencies
RUN apt-get update \
    && apt-get install -y weechat gopher tmux kitty x11vnc zshrc wget

RUN useradd -m chill -s /usr/bin/zsh

WORKDIR /home/chill

RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

RUN git clone https://github.com/powerline/fonts
WORKDIR ./fonts
RUN ./install.sh

ENTRYPOINT [ "/usr/bin/zsh" ]