#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Setup vagrant development
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
# 1. Install VirtualBox and Vagrant
# 2. Install vagrant plugin
# 3. Link Vagrantfile
# -------------------------------------------------------------------------------
#

VAGRANT_WORK_DIR=$HOME/Documents/vagrant

function brew_update_tap() {
    brew update
    brew tap caskroom/versions
}

function install_virtualbox() {
    brew cask install virtualbox
    brew cask install virtualbox-extension-pack
}

function install_vagrant_and_plugins() {
    brew cask install vagrant
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-hostmanager
}

function install_vbox_and_vagrant {
    command -v VirtualBox > /dev/null 2>&1 || install_virtualbox
    command -v vagrant > /dev/null 2>&1 || install_vagrant_and_plugins
}

function create_vagrant_env() {
    if [ ! -d $VAGRANT_WORK_DIR ]; then
        info "create vagrant environment"
        mkdir -p $VAGRANT_WORK_DIR
        ln -sfn $SETUP_ROOT_DIR/vagrant/Vagrantfile $VAGRANT_WORK_DIR/Vagrantfile
    fi
}

function main() {
    warn "vagrant setup..."
    install_vbox_and_vagrant
    create_vagrant_env
}

### Main script
main
