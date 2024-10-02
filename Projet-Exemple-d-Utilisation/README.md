# Exemple d'Utilisation d'Ansible

Cette section contient un exemple pratique d'utilisation d'Ansible pour déployer une infrastructure comprenant un serveur web et une base de données. L'objectif est de démontrer les capacités d'Ansible à automatiser des tâches de configuration et de gestion sur plusieurs machines.

## Objectifs du Projet
- **Déployer un serveur web (Apache)** sur un groupe d'hôtes désigné comme `webservers`.
- **Configurer une base de données (MySQL)** sur un groupe d'hôtes désigné comme `dbservers`.
- Utiliser des rôles pour structurer les tâches et rendre le déploiement réutilisable et modulaire.

## Contenu de cette Section
- **inventaire/** : Contient le fichier `hosts` définissant les machines cibles.
- **playbooks/** : Contient les playbooks nécessaires pour déployer le serveur web et configurer la base de données.
- **roles/** : Contient les rôles `web-server` et `db-server` pour organiser les tâches de déploiement.

Pour exécuter ces playbooks, vous aurez besoin de définir votre inventaire, puis de lancer les playbooks via la commande `ansible-playbook`.
