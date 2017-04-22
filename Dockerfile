FROM python:3.6

MAINTAINER "Leo O'Donnell <leopold.odonnell@gmail.com>"
 
# Install the required dependencies via pip
RUN pip install locustio==v0.8a1 && \
    pip install pyzmq


# Expose the required Locust ports
EXPOSE 5557 5558 8089

# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["/locust-tasks/run.sh"] 
