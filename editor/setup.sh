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

function main() {
    warn "editor setup..."
    install_editor_and_packages
    check_and_setup_emacs
}

### Main script
main
