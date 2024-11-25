# Définir la version de l'image Docker
IMAGE_NAME := aurelie/haproxy
TAG := latest
CONTAINER_NAME := haproxy-container

# Définir le nom de l'image Docker pour le backend et le load balancer
DEMO_IMAGE_NAME := aurelie/haproxy-demo
DEMO_PORT1 := 8080
DEMO_PORT2 := 8082

# Construire les images Docker
build:
	@docker build -t $(IMAGE_NAME):$(TAG) ./LoadBalancer
	@docker build -t $(DEMO_IMAGE_NAME) ./Demo

# Push the docker image
push:
	@docker push $(IMAGE_NAME):$(TAG)
	@docker push $(DEMO_IMAGE_NAME):$(TAG)

# Pull the docker image
pull:
	@docker pull $(IMAGE_NAME):$(TAG)
	@docker pull $(DEMO_IMAGE_NAME):$(TAG)

# Run the demo (without https)
run-local:
	@make build
	@docker compose up -d

# Stop the demo
stop:
	@docker compose down

# Default target
.PHONY: build push pull run-local stop

