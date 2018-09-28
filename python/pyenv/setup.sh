#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------
# Filename:    setup.sh
# Revision:    1.0
# Date:        2018-09-14
# Author:      Grady <yhwei876@gmail.com>
# Description: Setup pyenv development
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
# 1. Install pyenv environment
# 2. Configuration
# -------------------------------------------------------------------------------
#

export PYENV_ROOT=$HOME/.pyenv

function install_pyenv() {
    info "install pyenv"
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash > /dev/null 2>&1
}

function export_pyenv_command() {
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

function remove_plugins() {
    rm -rf $PYENV_ROOT/plugins/pyenv-doctor > /dev/null 2>&1
    rm -rf $PYENV_ROOT/plugins/pyenv-installer > /dev/null 2>&1
    rm -rf $PYENV_ROOT/plugins/pyenv-which-ext > /dev/null 2>&1
}

function main() {
    info "Setup pyenv development..."
    install_pyenv
    export_pyenv_command
    remove_plugins
}

### Main script
main

