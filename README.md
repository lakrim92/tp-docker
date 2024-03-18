# Guide d'installation et de déploiement

Ce projet automatise l'installation de Docker et Docker Compose, ainsi que le déploiement d'une stack de base de données PostgreSQL avec deux instances à partir de l'image Docker postgres:12. Il inclut également l'injection de données initiales dans la base de données, l'exportation et l'importation de données entre les instances, ainsi que la création et le déploiement d'images Docker personnalisées dans un registre spécifique.

# La Magie Opère

Dans notre chaudron de code, nous avons concocté un mélange fascinant de commandes, de scripts, et de configurations dans le monde du Docker. Le fichier docker-compose.yml orchestre le ballet synchronisé de deux conteneurs PostgreSQL, chacun jouant son rôle avec élégance.

🚢 Le Voyage des Conteneurs

Suivez les aventures des conteneurs bdd1 et bdd2, nés de l'image mystique PostgreSQL:12, tandis qu'ils dansent ensemble dans le docker-compose.yml.

🔍 La Magie des Variables d'Environnement

Les secrets du fichier .env alimentent nos créatures magiques en variables d'environnement, leur donnant la puissance nécessaire pour régner sur la base de données.

📜 Le Livre de Sorts SQL

Le script SQL bdd.sql crée une table utilisateur avec des données mystiques - quatre utilisateurs pour être précis.

📤 Exportation et Importation Magiques

Utilisez la commande docker exec pour extraire le pouvoir de la première instance et l'injecter dans la seconde, tout en générant un grimoire appelé output.sql.

🌐 Le Registre Magique

Ouvrez la porte du registre devopsregistry.legaragenumerique.fr avec les clés secrètes devops et devopspassword, où nos images sont stockées comme des trésors.

## Instructions d'utilisation

### Prérequis

Assurez-vous d'avoir les éléments suivants installés sur votre machine :
- `bash`
- `docker`
- `docker-compose`

### Étapes d'installation et de déploiement

1. Clonez ce dépôt sur votre machine :
   ```bash
   git clone <URL_du_dépôt>
   cd <nom_du_dépôt>

    Assurez-vous que le fichier install-deploy.sh a les permissions d'exécution :

    bash

chmod +x install-deploy.sh

Exécutez le script install-deploy.sh :

bash

    ./install-deploy.sh

    Suivez les instructions du script pour installer Docker, Docker Compose, déployer la stack PostgreSQL et effectuer les autres opérations requises.

Structure du projet

    install-deploy.sh : Script bash pour l'installation et le déploiement automatisés.
    docker-compose.yml : Fichier de configuration Docker Compose définissant les services de base de données.
    .env : Fichier contenant les variables d'environnement utilisées par les services de base de données.
    bdd.sql : Fichier SQL contenant les données initiales à injecter dans la base de données.
    README.md : Ce fichier, fournissant des instructions d'utilisation du projet.

Modification de la consigne concernant le Docker login
    utilisation de user_password au lieu de password

Membres de l'Équipe

    Lina
    Ismael
    Hasan
    Benjamin
    Jean Jacques
    Georges 