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
# Better (cleaner) 'validate' stage output for terragrunt
#
# Based on code from https://gist.github.com/angeloskaltsikis/f5ded5e94495e6254a9171365bcfaf7a#gistcomment-3492126

#
# Store stdout and stderr since terragrunt produces a lot of unnecessary output we don't want to see during builds
VALIDATE_OUTPUT=$(terragrunt run-all validate --terragrunt-non-interactive 2>&1 >/dev/null) 

# Show output when there is an error
status=$?
[ $status -eq 0 ] && echo "Terraform Initialized Successfully" || echo "$VALIDATE_OUTPUT"