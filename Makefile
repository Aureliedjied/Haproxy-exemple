# Définir la version de l'image Docker
TAG := latest

# Définir le nom de l'image Docker
DEMO_IMAGE_NAME := aurelie/demo-load-balancer

# Construire l'image Docker
build:
    @docker build -t $(DEMO_IMAGE_NAME):$(TAG) ./Demo

# Pousser l'image Docker vers le registre
push:
    @docker push $(DEMO_IMAGE_NAME):$(TAG)

# Pull l'image Docker depuis le registre
pull:
    @docker pull $(DEMO_IMAGE_NAME):$(TAG)

# Lancer l'application en local
run-local:
    @make build
    @docker compose up -d

# Arrêter l'application en local
stop-local:
    @docker compose down
