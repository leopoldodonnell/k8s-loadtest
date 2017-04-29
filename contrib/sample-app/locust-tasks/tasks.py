#!/usr/bin/env python

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

import hashlib

from datetime import datetime
from locust import HttpLocust, TaskSet, task


class MetricsTaskSet(TaskSet):
    _payload = ""
    _checksum = ""

    def on_start(self):
        with open('/locust-tasks/data.json') as data_file:
            self._payload = data_file.read().encode('utf-8')
            self._checksum = hashlib.md5(self._payload).hexdigest()
            print(self._checksum)

    @task(1)
    def post_json(self):
        response = self.client.post('/post_json', {'data': self._payload})
        if response.content != self._checksum:
            print("got bad response")
        

class MetricsLocust(HttpLocust):
    task_set = MetricsTaskSet