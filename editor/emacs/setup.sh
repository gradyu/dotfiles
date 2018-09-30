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
# 3. Install spacemacs layers dependencies
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
        git clone https://github.com/gradyu/mac-dev-setup.git $CONFIG_DIR
    fi
}

function install_python_deps() {
    pip_deps=(
        jedi
        json-rpc
        service-factory
        flake8
        autoflake
        yapf
        isort
        importmagic
    )
    for pdep in ${pip_deps[@]}; do
        command -v $pdep > /dev/null 2>&1 || pip install --user $pdep
    done
}

function check_and_install_python_deps() {
    command -v pip > /dev/null && install_python_deps
}

function install_nodejs_deps() {
    npm_deps=(
        eslint
        js-beautify
        tern
    )
    for ndep in ${npm_deps[@]}; do
        command -v $ndep > /dev/null 2>&1 || cnpm install -g $ndep
    done
}

function check_and_install_nodejs_deps() {
    command -v cnpm > /dev/null && install_nodejs_deps
}

function main() {
    info "Setup emacs environment..."
    install_spacemacs
    clone_spacemacs_config
    check_and_install_python_deps
    check_and_install_nodejs_deps
}

### Main script
main

