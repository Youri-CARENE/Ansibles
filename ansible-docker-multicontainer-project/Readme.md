# Ansible Docker Multicontainer Project

Ce projet utilise Ansible pour déployer et gérer un service multi-conteneurs Docker avec 10 conteneurs représentant différents systèmes d'exploitation. Il est conçu pour vous aider à vous entraîner à l'utilisation d'Ansible pour la gestion de conteneurs Docker avec multi-enviroonment

## Prérequis

- Ansible doit être installé sur la machine hôte.
- Docker doit être installé sur la machine hôte.

## Structure du Projet

- `ansible.cfg` : Fichier de configuration Ansible.
- `inventory/` : Contient le fichier `hosts` spécifiant les cibles Ansible.
- `playbooks/` : Contient les playbooks Ansible pour déployer et tester les conteneurs.
- `roles/docker/` : Contient les tâches, templates et variables pour la gestion de Docker.
- `tests/` : Contient des playbooks de test pour vérifier l'installation de Docker et le bon fonctionnement des conteneurs.
- `README.md` : Ce fichier, expliquant comment utiliser le projet.

## Utilisation

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/votre-profil/ansible-docker-multicontainer-project.git
   cd ansible-docker-multicontainer-project
