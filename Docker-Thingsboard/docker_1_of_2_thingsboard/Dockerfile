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

# Thingsboard application Debian package
#RUN wget https://github.com/thingsboard/thingsboard/releases/download/v2.1/thingsboard-2.1.deb \
#        -O thingsboard.deb
COPY thingsboard.deb /thingsboard.deb


RUN apt-get update \
        && apt-get install --no-install-recommends -y nmap nano \
        && apt-get clean \
        && rm -r /var/lib/apt/lists/*

# Script to install the debian packages and launch the IoT environment
COPY run_thingsboard.sh /run_thingsboard.sh
RUN chmod +x /run_thingsboard.sh
CMD run_thingsboard.sh
