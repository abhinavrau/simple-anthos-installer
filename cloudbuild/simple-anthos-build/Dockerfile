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
# limitations under the License.FROM gcr.io/cloud-builders/gcloud as builder
FROM gcr.io/cloud-builders/gcloud as builder

ARG TERRAFORM_VERSION
ARG TERRAFORM_VERSION_SHA256SUM
ARG TERRAGRUNT_VERSION
ARG TERRAGRUNT_VERSION_SHA256SUM

WORKDIR /builder/terragrunt

RUN apt-get update
RUN apt-get -y install unzip wget curl ca-certificates

RUN wget "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"
RUN echo "af986793a515d500ab2d35f8d2aecd656e764504b789b66d7e1a0b727a124c44 jq-linux64" > jq_SHA256SUMS
RUN sha256sum -c jq_SHA256SUMS --status 

RUN wget https://storage.googleapis.com/kpt-dev/latest/linux_amd64/kpt 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
RUN unzip awscliv2.zip



RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_linux_amd64.zip
RUN echo "${TERRAFORM_VERSION_SHA256SUM} terraform_linux_amd64.zip" > terraform_SHA256SUMS
RUN sha256sum -c terraform_SHA256SUMS --status
RUN unzip terraform_linux_amd64.zip -d /builder/terragrunt

RUN wget -q https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64
RUN echo "${TERRAGRUNT_VERSION_SHA256SUM} terragrunt_linux_amd64" > terragrunt_SHA256SUMS
RUN sha256sum -c terragrunt_SHA256SUMS --status




FROM gcr.io/cloud-builders/gcloud

ENV PATH=/builder/terragrunt/:/usr/local/bin:$PATH

WORKDIR /builder/terragrunt

COPY --from=builder /builder/terragrunt/jq-linux64 ./jq 
COPY --from=builder /builder/terragrunt/kpt ./kpt
COPY --from=builder /builder/terragrunt/aws ./aws
RUN ./aws/install 
COPY --from=builder /builder/terragrunt/terraform ./
COPY --from=builder /builder/terragrunt/terragrunt_linux_amd64 ./terragrunt

COPY entrypoint.bash /builder/entrypoint.bash
COPY bettergrunt_apply.sh /builder/bettergrunt_apply.sh
COPY bettergrunt_plan.sh /builder/bettergrunt_plan.sh

RUN chmod +x ./jq
RUN chmod +x kpt
RUN chmod +x ./terraform
RUN chmod +x ./terragrunt

ENTRYPOINT ["/builder/entrypoint.bash"]
