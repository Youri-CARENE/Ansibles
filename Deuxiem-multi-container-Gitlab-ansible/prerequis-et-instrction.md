# Prérequis et Instructions pour un Projet Multi-Container avec Ansible

## Prérequis

- **GitLab** : Avoir un dépôt GitLab pour stocker le code.
- **Docker** : Installer Docker pour exécuter les conteneurs.
- **Ansible** : Installer Ansible pour orchestrer les tâches.
- **Python** : Ansible dépend de Python pour fonctionner.
- **SSH** : Ansible nécessite une connexion SSH pour se connecter aux serveurs (ici, la machine hôte où Docker est exécuté).

## Explication des fichiers

- **ansible/ansible.cfg** : Fichier de configuration pour Ansible.
- **ansible/inventory.yml** : Liste des hôtes (dans ce projet, l'hôte local).
- **ansible/playbooks/** : Contient les playbooks Ansible pour le déploiement des différents services, comme l'application web et la base de données.
- **docker-compose.yml** : Fichier Docker Compose pour orchestrer le déploiement multi-container.
- **.gitlab-ci.yml** : Pipeline CI/CD pour GitLab, afin d'automatiser les étapes d'intégration continue et de déploiement.
- **README.md** : Instructions pour configurer et lancer l'application avec Ansible.