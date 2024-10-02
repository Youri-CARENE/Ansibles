# Projet Multi-Container avec Jenkins et Ansible

## Description

Ce projet est un exemple d'infrastructure multi-container orchestrée avec Docker et Ansible, automatisée par un pipeline CI/CD via Jenkins. Il comprend une application web (Nginx) et une base de données PostgreSQL.

### Prérequis

- **Jenkins** : Avoir Jenkins installé et configuré avec un agent Docker.
- **Docker** : Installer Docker pour exécuter les conteneurs.
- **Ansible** : Installer Ansible pour orchestrer les tâches de déploiement.
- **Python** : Ansible dépend de Python pour fonctionner.
- **SSH** : Ansible utilise SSH pour se connecter aux hôtes (ici, à la machine locale).

### Instructions

1. **Configurer Jenkins** : 
   - Créez un pipeline Jenkins et pointez-le vers votre dépôt Git.
   - Installez le plugin Docker sur Jenkins si nécessaire.
2. **Exécuter le pipeline** :
   - Le pipeline clone le dépôt, construit les conteneurs avec Docker Compose, puis utilise Ansible pour les déployer.
   - Il effectue également des tests pour vérifier que l'application est bien déployée.
3. **Accéder à l'application** :
   - Une fois le déploiement terminé, l'application web sera accessible via `http://localhost:8080`.
