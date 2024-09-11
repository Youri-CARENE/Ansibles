# Projet Multi-Container avec Jenkins et Ansible

## Prérequis

Avant de commencer, assurez-vous que les éléments suivants sont installés et configurés :

- **Jenkins** : Installer Jenkins et configurer un pipeline Jenkins pour l'intégration continue et le déploiement.
- **Docker** : Installer Docker pour exécuter les conteneurs.
- **Jenkins Docker Plugin** : Jenkins doit être configuré avec le plugin Docker pour gérer les conteneurs et interagir avec Docker.
- **Python** : Ansible dépend de Python, certaines tâches peuvent en avoir besoin.
- **SSH** : Ansible utilise SSH pour se connecter aux serveurs (ici, à l'hôte local).

## Structure du Projet

```bash
multi-container-jenkins/
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.yml
│   ├── playbooks/
│   │   ├── deploy.yml
│   │   ├── web.yml
│   │   └── db.yml
├── docker-compose.yml
├── Jenkinsfile
└── README.md
