#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Setup the editor for development
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
# 1. Install emacs and packages
# 2. Call the emacs setup
# -------------------------------------------------------------------------------
# Version 1.1
# 1. Install sapcevim and deps 
#

function install_editor_and_packages() {
    cd $SETUP_ROOT_DIR/editor
    brew bundle check || brew bundle
    cd $SETUP_ROOT_DIR
}

function check_and_setup_emacs() {
    if [ ! -d $HOME/.spacemacs.d ]; then
        source $SETUP_ROOT_DIR/editor/emacs/setup.sh
    fi
}

function install_spacevim_and_deps() {
    if [ ! -d $HOME/.SpaceVim ]; then
        curl -sLf https://spacevim.org/install.sh | bash -s -- --install vim
    fi
    if [ ! -d $HOME/.SpaceVim.d ]; then
        mkdir $HOME/.SpaceVim.d
        ln -sf $SETUP_ROOT_DIR/editor/spacevim/init.toml $HOEM/.SpaceVim.d/init.toml
    fi
    command -v npm > /dev/null 2>&1 npm install -g neovim
    command -v pip > /dev/null 2>&1 pip install --user neovim
}

function main() {
    warn "editor setup..."
    install_editor_and_packages
    check_and_setup_emacs
    install_spacevim_and_deps
}

### Main script
main
