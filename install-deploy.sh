#!/bin/bash

# Charger les variables d'environnement à partir du fichier .env
echo "Chargement des variables d'environnement à partir du fichier .env"
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Installation de Docker et Docker Compose
echo "Installation de Docker"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
docker --version

echo "Installation de Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

# Démarrage des conteneurs PostgreSQL
echo "Démarrage de la stack PostgreSQL"
docker-compose up -d

# Attendre quelques instants pour que les conteneurs démarrent complètement
sleep 10

# Partie SQL pour la création de la table utilisateur et l'insertion de données
echo "Exécution du fichier SQL pour créer la table utilisateur et insérer des données dans bdd1"
docker exec -i bdd1 psql -U $MY_USER $MY_DB1 < bdd.sql

# Export de la base de données dans bdd1
echo "Export de la base de données dans bdd1 dans output.sql"
docker exec -i bdd1 pg_dump -U $MY_USER $MY_DB1 > output.sql

# Injection de output.sql dans bdd2
echo "Injection de output.sql dans bdd2"
docker exec -i bdd2 psql -U $MY_USER $MY_DB2 < output.sql

# Docker login au registre devopsregistry.legaragenumerique.fr
echo "Docker login au registre devopsregistry.legaragenumerique.fr"
echo "devopspassword" | docker login -u devops --password-stdin devopsregistry.legaragenumerique.fr

# Sauvegarde des conteneurs sous forme d'images
echo "Sauvegarde des conteneurs sous forme d'images"
docker commit bdd1 devopsregistry.legaragenumerique.fr/groupe-postgres-1:1.0
docker commit bdd2 devopsregistry.legaragenumerique.fr/groupe-postgres-2:1.0

# Push des images vers le registre
echo "Push des images vers le registre devopsregistry.legaragenumerique.fr"
docker push devopsregistry.legaragenumerique.fr/groupe-postgres-1:1.0 
docker push devopsregistry.legaragenumerique.fr/groupe-postgres-2:1.0

# Nettoyage des fichiers temporaires
echo "Nettoyage des fichiers temporaires"
rm -f output.sql bdd.sql

echo "Installation et déploiement terminés avec succès!"

