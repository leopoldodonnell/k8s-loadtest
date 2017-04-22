
IMAGE_NAME = "locust-loadtest"
TAG = latest
DOCKER_REGISTRY = "quay.io/leopoldodonnell"

container:
	docker build --rm -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG} .
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}

deploy:
	${HELM} install simple-server
	${HELM} install locust-loadtest
