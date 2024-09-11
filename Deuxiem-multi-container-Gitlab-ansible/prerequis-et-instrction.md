Prérequis
GitLab : Avoir un dépôt GitLab pour stocker le code.
Docker : Installer Docker pour exécuter les conteneurs.
Ansible : Installer Ansible pour orchestrer les tâches.
Python : Ansible dépend de Python.
SSH : Ansible nécessite SSH pour se connecter aux serveurs (dans ce cas, à la machine hôte où Docker est exécuté).


Explication des fichiers
ansible/ansible.cfg : Fichier de configuration pour Ansible.
ansible/inventory.yml : Liste des hôtes (ici, local).
ansible/playbooks/ : Contient les playbooks Ansible pour le déploiement de l'application web et de la base de données.
docker-compose.yml : Pour orchestrer le déploiement multi-container.
.gitlab-ci.yml : Pipeline CI/CD de GitLab pour l'intégration continue.
README.md : Instructions pour configurer et lancer l'application avec Ansible.