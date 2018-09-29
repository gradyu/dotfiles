#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Setup emacs environment
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
# 1. Install spacemacs
# 2. Git clone persnal spacemacs configuration
# -------------------------------------------------------------------------------
#

info "Setup emacs environment..."

function install_spacemacs() {
    EMACS_DIR=$HOME/.emacs.d
    if [ ! -d $EMACS_DIR ]; then
        git clone -b develop https://github.com/syl20bnr/spacemacs $EMACS_DIR
    fi
}

function clone_spacemacs_config() {
    CONFIG_DIR=$HOME/.spacemacs.d
    if [ ! -d $CONFIG_DIR ]; then
        git clone git@github.com:gradyu/spacemacs.d.git $CONFIG_DIR
    fi
}

function main() {
    info "Setup emacs environment..."
    install_spacemacs
    clone_spacemacs_config
}

### Main script
main

