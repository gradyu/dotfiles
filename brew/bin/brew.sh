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

#!/usr/bin/env bash

# check if pyenv is available
# edit: fixed redirect issue in earlier version
if command -v pyenv > /dev/null 2>&1; then
    # assumes default location of brew in `/usr/local/bin/brew`
    /usr/bin/env PATH="${PATH//$(pyenv root)\/shims:/}" /usr/local/bin/brew "$@"
else
    /usr/local/bin/brew "$@"
fi
