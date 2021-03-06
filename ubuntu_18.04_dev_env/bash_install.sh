FROM ubuntu:18.04

MAINTAINER Reginald Marr version: 0.1

RUN apt-get update && apt-get install -y \
    tmux \
    zsh \
    curl \
    wget \
    vim \
    feh \
    git \
    python \
    python3 \
    sudo \
    mesa-utils \
    unzip \
    build-essential \
	dpkg \
    cmake \
    && rm -rf /var/likb/apt/lists/*


cd $HOME/Downloads && mkdir -p gitDownloads && cd gitDownloads

git clone https://github.com/rizsotto/Bear.git && cd Bear \
    && mkdir -p build && cd build && cmake ../ && make all && \
    make install && make package
git clone --depth 1 https://github.com/lotabout/skim.git $HOME/.skim \
    && ~/.skim/install && echo "export PATH='$PATH:$HOME/.skim/bin'" \
    | >> ~/.bash_aliases
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    ~/.fzf/install && echo "export PATH='$PATH:HOME/.fzf/bin'" \
    | >> ~/.bash_aliases
apt-get update --fix-missing -y && apt-get upgrade -y
apt-get install apt-utils dpkg tree -y
apt-get install firefox --fix-missing -y
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb \
    && dpkg -i ripgrep_11.0.2_amd64.deb
curl -LO https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb \
    && dpkg -i fd_7.3.0_amd64.deb
curl -LO https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb \
    && dpkg -i bat_0.12.1_amd64.deb
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

apt-get install python3-pip -y && apt-get update -y

