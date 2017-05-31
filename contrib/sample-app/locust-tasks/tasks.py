#!/usr/bin/env python

import hashlib
import os

from datetime import datetime
from locust import HttpLocust, TaskSet, task


class MetricsTaskSet(TaskSet):
    _payload = ""
    _checksum = ""

    def on_start(self):
        with open('data.json') as data_file:
            self._payload = data_file.read().encode('utf-8')
            self._checksum = hashlib.md5(self._payload).hexdigest()
            print(self._checksum)

    @task(1)
    def post_json(self):
        response = self.client.post('/post_json', {'data': self._payload})
        if response.content != self._checksum:
            print("got bad response")
        
    @task(10)
    def post_primes(self)
        response = self.client.post('/nth_prime', { 'primes': os.getenv('PRIMES', '800000') })
        print(response.text)

class MetricsLocust(HttpLocust):
    task_set = MetricsTaskSet