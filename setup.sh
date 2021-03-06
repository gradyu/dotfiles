#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Check and Install The Xcode Command Line Tools and call submodule
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
# 1. Color echo
# 2. Check and install Xcode cli
# 3. Clone setup repository
# 4. Call submodule
# -------------------------------------------------------------------------------
#
### Check and install Xcode cli tool

export SETUP_ROOT_DIR=$HOME/.setup

### color echo
### See https://github.com/PeterDaveHello/ColorEchoForShell/blob/master/dist/ColorEcho.bash)
function info() {
    echo -e $*
}

function warn() {
    echo -e "\033[33m$*\033[m"
}

function error() {
    echo -e "\033[1;31m$*\033[m"
}

function success() {
    echo -e "\033[1;32m$*\033[m"
}

### Install Xcode cli slient
### See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line
function install_xcode_cli() {
    info "Installing the xcode command line..."
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
    PROD=$(softwareupdate -l |
               grep "\*.*Command Line" |
               head -n 1 | awk -F"*" '{print $2}' |
               sed -e 's/^ *//' |
               tr -d '\n')
    softwareupdate -i "$PROD";
}

function check_and_install_xcode_cli() {
    info "Checking Xcode command line"
    xcode-select -p &> /dev/null
    if [ $? -ne 0 ]; then
        install_xcode_cli
    fi
    if [ $? -ne 0 ]; then
        error "Xcode command Line install failed!"
        exit 1
    fi
    success "Xcode command Line is OK"
}

function check_and_clone_setup_repository() {
    info "Check and clone setup repository"
    if [ ! -d $SETUP_ROOT_DIR ]; then
        git clone https://github.com/gradyu/mac-dev-setup.git $SETUP_ROOT_DIR
    fi
}

function call_submodules_setup() {
    info "Call submodule setup script"
    submodules=(
        brew
        nodejs
        python
        vagrant
        shell
        editor
        tool
    )
    for module in ${submodules[@]}
    do
        source $SETUP_ROOT_DIR/${module}/setup.sh
    done
}

function main() {
    check_and_install_xcode_cli
    check_and_clone_setup_repository
    call_submodules_setup
}

### Main script
main

success "mac development setup finished!!!"
