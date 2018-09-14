#
# Copyright © 2016-2018 The Thingsboard Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM openjdk:8-jre

# Thingsboard IoT Gateway (Debian package) in the same container
#RUN wget https://github.com/thingsboard/thingsboard-gateway/releases/download/v1.4.0.1/tb-gateway-1.4.0.deb \
#        -O tb-gateway.deb
# https://github.com/thingsboard/thingsboard-gateway/releases/download/2.1.1/tb-gateway.deb
COPY tb-gateway.deb /tb-gateway.deb
COPY run_gateway.sh /run_gateway.sh

RUN apt-get update \
        && apt-get install --no-install-recommends -y nmap nano \
        && apt-get clean \
        && rm -r /var/lib/apt/lists/*

# Script to install the debian packages and launch the IoT environment

RUN chmod +x /run_gateway.sh
CMD /run_gateway.sh
