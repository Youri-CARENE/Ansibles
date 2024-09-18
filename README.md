# Kubernetes ansible 


Ce répo contient divers fichiers et scripts pour aider à la gestion et au déploiement des conteneurs et des clusters Kubernetes, ainsi que des configurations Ansible.

## Structure du Répertoire

### Racine du Répertoire

- **Installation.md** : Guide d'installation pour Kubernetes.

### Répertoire:
 `Ansibles/Mini_Projet_Docker`

Ce répertoire contient un mini-projet Docker utilisant Ansible. Voici les fichiers inclus :

- **Conteneurs_Cibles.sh** : Script shell pour cibler les conteneurs spécifiques.
- **create_users.yml** : Playbook Ansible pour créer des utilisateurs.
- **docker-compose.yml** : Fichier de configuration pour Docker Compose.
- **Dockerfile** : Instructions pour construire l'image Docker.
- **Launch_all.sh** : Script shell pour lancer tous les services nécessaires.
- **requirements.txt** : Fichier listant les dépendances nécessaires pour le projet.

### Répertoire: 

`Ansibles/Wast`

Ce répertoire semble être utilisé pour des tests ou des fichiers temporaires.

- **File.txt** : Fichier texte vide (à utiliser pour des tests ou à supprimer si inutile).

## Utilisation

### Installation

Pour installer et configurer les projets, suivez les étapes détaillées dans `Installation.md`.

### Mini Projet Docker avec Ansible

1. **Configurer Docker et Docker Compose** : Assurez-vous que Docker et Docker Compose sont installés sur votre machine.
2. **Lancer les Services** : Utilisez le script `Launch_all.sh` pour démarrer tous les services nécessaires.
3. **Gérer les Conteneurs** : Utilisez `Conteneurs_Cibles.sh` pour cibler et gérer des conteneurs spécifiques.
4. **Ansible Playbooks** : Utilisez les playbooks comme `create_users.yml` pour gérer la configuration et les utilisateurs à l'intérieur des conteneurs.

### Répertoire Wast

Le répertoire `Wast` peut être utilisé pour stocker des fichiers temporaires ou des scripts en cours de développement.

## Contribuer

Les contributions sont les bienvenues ! Veuillez créer une branche pour votre fonctionnalité ou votre correctif et soumettre une pull request pour examen.
