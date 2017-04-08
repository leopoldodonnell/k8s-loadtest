# Copyright 2015 Google Inc. All rights reserved.
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


# Start with a base Python 2.7.8 image
FROM python:3.6

MAINTAINER "Leo O'Donnell <leopold.odonnell@gmail.com>"
 
# Install the required dependencies via pip
RUN pip install locustio==v0.8a1 && \
    pip install pyzmq


# Expose the required Locust ports
EXPOSE 5557 5558 8089

# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["/locust-tasks/run.sh"] 
