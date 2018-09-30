#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Setup shell environment
# -------------------------------------------------------------------------------
# Copyright (C) 2018 Grady

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -------------------------------------------------------------------------------
# Version 1.0
# 1. Install iterm2
# 2. Install common tool
# 3. setup oh-my-zsh
# 4. setup tmux
# -------------------------------------------------------------------------------
#

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

function install_shell_app_and_packages() {
    cd $SETUP_ROOT_DIR/shell
    brew bundle check || brew bundle
    cd $SETUP_ROOT_DIR
}

function install_ohmyzsh() {
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_zsh_plugins() {
    git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
    autoload -U compinit && compinit
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

function check_and_install_ohmyzsh_env() {
    if [ ! -d $HOME/.oh-my-zsh ]; then
        install_ohmyzsh
        install_zsh_plugins
    fi
}

function link_config_files() {
    ln -sf .setup/shell/ohmyzsh/zshrc.zsh .zshrc
    if [ ! -d $ZSH_CUSTOM/android ]; then
        ln -s $SETUP_ROOT_DIR/shell/ohmyzsh/android $ZSH_CUSTOM/android
    fi
    ln -sf $SETUP_ROOT_DIR/shell/ohmyzsh/my_configs.zsh $ZSH_CUSTOM/my_configs.zsh
}

function setup_tmux() {
    git clone https://github.com/gpakosz/.tmux.git
    ln -sf .tmux/.tmux.conf
    ln -sf .setup/shell/tmux/tmux.conf .tmux.conf.local
}

function main() {
    warn "shell environment setup..."
    install_shell_app_and_packages
    check_and_install_ohmyzsh_env
    cd $HOME
    link_config_files
    setup_tmux
    cd $SETUP_ROOT_DIR
}

### Main script
main
