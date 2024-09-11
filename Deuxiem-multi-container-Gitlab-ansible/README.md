# Projet Multi-Container avec Ansible

## Description

Ce projet est un exemple d'infrastructure multi-container orchestrée avec Docker et Ansible. Il comprend une application web (Nginx) et une base de données PostgreSQL.

### Prérequis

- **GitLab** : Avoir un dépôt GitLab pour stocker le code.
- **Docker** : Installer Docker pour exécuter les conteneurs.
- **Ansible** : Installer Ansible pour orchestrer les tâches.
- **Python** : Ansible nécessite Python pour fonctionner.
- **SSH** : Ansible nécessite une connexion SSH pour interagir avec les hôtes (local dans ce projet).

### Instructions

1. **Configurer Ansible** : Assurez-vous qu'Ansible et Docker sont installés sur votre machine.
2. **Exécuter les playbooks** : Utilisez Ansible pour déployer les conteneurs avec la commande :
   ```bash
   ansible-playbook ansible/playbooks/deploy.yml
