# Définir la version de l'image Docker
TAG := latest

# Définir le nom de l'image Docker pour le backend et le load balancer
DEMO_IMAGE_NAME := aurelie/haproxy-demo
LOADBALANCER_IMAGE_NAME := aurelie/haproxy

# Construire les images Docker
build:
	@docker build -t $(DEMO_IMAGE_NAME):$(TAG) ./LoadBalancer
	@docker build -t $(LOADBALANCER_IMAGE_NAME) ./Demo

# Pousser les images Docker vers le registre
push:
    @docker push $(DEMO_IMAGE_NAME):$(TAG)
    @docker push $(LOADBALANCER_IMAGE_NAME):$(TAG)

# Tirer les images Docker depuis le registre
pull:
    @docker pull $(DEMO_IMAGE_NAME):$(TAG)
    @docker pull $(LOADBALANCER_IMAGE_NAME):$(TAG)

# Lancer l'application en local
run-local:
	@make build
	@docker compose up -d

# Arrêter l'application en local
stop:
	@docker compose down

.PHONY: build push pull run-local stop

