
TAG = latest

container:
	docker build --rm -t ${DOCKER_REGISTRY}/k8s-loadtest:${TAG}
	docker push ${DOCKER_REGISTRY}/k8s-loadtest:${TAG}

deploy:
	${HELM} install simple-server
	${HELM} install locust-loadtest
