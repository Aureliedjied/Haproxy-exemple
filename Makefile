# Nom du projet 
PROJECT_NAME := ha-proxy 
TAG := latest

# Variables pour les images Docker 
IMAGE_NAME := aurelie/ha-proxy 
DEMO_IMAGE_NAME := aurelie/ha-proxy-demo 

# Build les images Docker 
build: 
	@echo "Construction des images Docker..." 
	@docker build -t $(IMAGE_NAME) ./Back 
	@docker build -t $(DEMO_IMAGE_NAME) ./Front

# Pousser les images Docker 
push: 
	@echo "Push des images Docker ..."
	@docker push $(IMAGE_NAME):$(TAG)
	@docker push $(DEMO_IMAGE_NAME):$(TAG)

# Pull les images docker
pull:
	@echo "Pull des images Docker ..."
	@docker pull $(IMAGE_NAME):$(TAG)
	@docker pull $(DEMO_IMAGE_NAME):$(TAG)

# Démarrer les services en local 
run-local: build 
	@echo "Démarrage des services en local..." 
	@docker-compose up -d

#Afficher les logs de tous les services
logs:
	@echo "Affichage des logs..."
	@docker-compose logs 

#acceder aux ID des conteneur
id:
	@echo "Accès aux ids des conteneur..."
	@docker ps

# Arrêt des service
stop:
	@echo "Arrêt des services..."
	@docker-compose down

# Supprimer les images et les conteneurs
clean:
	@echo "Nettoyage des images et des conteneurs..."
	@docker-compose down --rmi all -v

# Default target
.PHONY: build push pull run-local stop