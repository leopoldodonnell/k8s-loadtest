FROM python:3.6

MAINTAINER "Leo O'Donnell <leopold.odonnell@gmail.com>"
 
# Install the required dependencies via pip
RUN pip install locustio==v0.8a1 && \
    pip install pyzmq


# Expose the required Locust ports
EXPOSE 5557 5558 8089

ADD run.sh /usr/local/bin/locust.sh
# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["/usr/local/bin/locust.sh"] 
