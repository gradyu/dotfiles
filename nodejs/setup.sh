#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Setup nodejs development
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
# 1. Install nvm
# 2. Install nodejs
# 3. Install global package
# -------------------------------------------------------------------------------
#

export NVM_DIR="$HOME/.nvm"

function install_nvm() {
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
}

function export_nvm_command() {
    warn "export nvm command"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

function check_and_install_nvm() {
    command -v nvm > /dev/null 2>&1 || install_nvm && export_nvm_command
    success "nvm is OK"
}

function install_lts_node() {
    command -v node > /dev/null 2>&1 || nvm install --lts && nvm ls node
}

function install_cnpm() {
    npm install -g cnpm --registry=https://registry.npm.taobao.org
}

function install_global_packages() {
    command -v cnpm > /dev/null 2>&1 || install_cnpm
    packages=(
        hexo-cli
        gulp
    )
    for pkg in ${packages[@]}
    do
        command -v pkg > /dev/null 2>&1 || cnpm install -g pkg
    done
}

function main() {
    warn "nodejs setup..."
    check_and_install_nvm
    install_lts_node
    install_global_packages
}

### Main setup script
main
