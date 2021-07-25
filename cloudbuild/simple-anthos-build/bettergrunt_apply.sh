#!/usr/bin/env bash
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# terrabetter.sh 
#
# Better (cleaner) 'apply' stage output for terragrunt
#
# Combine with tfmask for secure output
#
# Based on code from https://gist.github.com/angeloskaltsikis/f5ded5e94495e6254a9171365bcfaf7a#gistcomment-3492126

export TFMASK_CHAR="#"
export TFMASK_VALUES_REGEX="(?i)^.*[^a-zA-Z](oauth|secret|token|password|key|result|id).*$"
# Store stdout and stderr
APPLY_OUTPUT=$(terragrunt run-all apply --terragrunt-non-interactive -no-color | tfmask 2>&1 >/dev/null) 

# Show clean plan if successful via `show`,
# show full plan command output if errors
status=$?
[ $status -eq 0 ] && echo "Apply success" || echo "$APPLY_OUTPUT"