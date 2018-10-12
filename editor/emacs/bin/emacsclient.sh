#!/usr/bin/env bash

# Copyright (C) 2018  Grady

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

EMACSPATH=/Applications/Emacs.app/Contents/MacOS

# Check if an emacs server is available
# (by checking to see if it will evaluate a lisp statement)

if ! (${EMACSPATH}/bin/emacsclient --eval "t"  2> /dev/null > /dev/null )
then
    # There is no server available so,
    # Start Emacs.app detached from the terminal
    # and change Emac's directory to PWD

    nohup ${EMACSPATH}/Emacs --chdir "${PWD}" "${@}" 2>&1 > /dev/null &
else
    # The emacs server is available so use emacsclient

    if [ -z "${@}" ]
    then
        # There are no arguments, so
        # tell emacs to open a new window

        ${EMACSPATH}/bin/emacsclient --eval "(list-directory \"${PWD}\")"
    else
        # There are arguments, so
        # tell emacs to open them

        ${EMACSPATH}/bin/emacsclient --no-wait "${@}"
    fi

    # Bring emacs to the foreground

    ${EMACSPATH}/bin/emacsclient --eval "(x-focus-frame nil)"
fi
