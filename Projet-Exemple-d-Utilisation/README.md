
# Exemple d'Utilisation d'Ansible

Ce guide vous montre comment utiliser Ansible pour déployer une infrastructure simple comprenant un serveur web et une base de données. 
L'objectif est de démontrer les capacités d'Ansible à automatiser des tâches de configuration et de gestion sur plusieurs machines.

## Objectifs du Projet

- **Déployer un serveur web (Apache)** sur un groupe d'hôtes désigné comme `webservers`.
- **Configurer une base de données (MySQL)** sur un groupe d'hôtes désigné comme `dbservers`.
- Utiliser des rôles pour structurer les tâches et rendre le déploiement réutilisable et modulaire.

## Prérequis

- **Ansible** : Assurez-vous qu'Ansible est installé. Si ce n'est pas le cas, installez-le avec les commandes suivantes :
  - Sur **Ubuntu/Debian** : 
    ```bash
    sudo apt update && sudo apt install ansible -y
    ```
  - Sur **CentOS/RedHat** :
    ```bash
    sudo yum install epel-release -y && sudo yum install ansible -y
    ```
- **Accès SSH** : Les hôtes cibles (serveur web et base de données) doivent être accessibles via SSH avec les bonnes clés.
- **Permissions root** : Certaines tâches nécessitent des privilèges d'administrateur. Configurez `sudo` ou `become` si nécessaire.

## Contenu du Projet

- **inventaire/** : Contient le fichier `hosts` définissant les machines cibles.
- **playbooks/** : Contient les playbooks nécessaires pour déployer le serveur web et configurer la base de données.
- **roles/** : Contient les rôles `web-server` et `db-server` pour organiser les tâches de déploiement.

## Structure des Fichiers

- **`hosts`** : Fichier d'inventaire qui liste les hôtes cibles. Remplacez `web1.example.com` et `db1.example.com` par les adresses IP de vos serveurs.
- **`deploy-web.yml`** : Playbook pour déployer le serveur web.
- **`config-db.yml`** : Playbook pour configurer la base de données.
- **`roles/web-server`** : Rôle contenant les tâches pour le déploiement du serveur web.
- **`roles/db-server`** : Rôle contenant les tâches pour la configuration de la base de données.

### Exemple de Fichier d'Inventaire (`hosts`)

```ini
[webservers]
web1.example.com  # Remplacez par l'adresse IP du serveur web
web2.example.com  # Remplacez par une autre adresse IP, si nécessaire

[dbservers]
db1.example.com  # Remplacez par l'adresse IP du serveur de base de données
db2.example.com  # Remplacez par une autre adresse IP, si nécessaire
```

Pour vérifier les adresses IP, connectez-vous à chaque serveur et tapez `ip a`.

## Exécution des Playbooks

Une fois les fichiers de configuration prêts, exécutez les playbooks en utilisant les commandes suivantes :

1. **Déploiement du Serveur Web** :
   ```bash
   ansible-playbook -i hosts playbooks/deploy-web.yml
   ```

2. **Configuration de la Base de Données** :
   ```bash
   ansible-playbook -i hosts playbooks/config-db.yml
   ```

## Structure des Rôles

Les rôles sont structurés pour rendre le projet modulaire et réutilisable. Voici un aperçu de chaque rôle :

- **`roles/web-server`** : Configure et installe le serveur Apache. Inclut des tâches pour la mise en place et les vérifications.
- **`roles/db-server`** : Configure et installe MySQL. Un handler est inclus pour redémarrer le service MySQL après certaines tâches.

### Exemple d'Utilisation des Handlers

Le fichier `main.yml` dans le rôle `db-server` contient un handler pour redémarrer MySQL :
```yaml
- name: Redémarrer MySQL
  service:
    name: mysql
    state: restarted
```

Ce handler est appelé automatiquement après des tâches spécifiques et assure que MySQL est actif après la configuration.

## Dépannage

- **Erreur de connexion SSH** : Assurez-vous que les clés SSH sont configurées correctement et que vous pouvez accéder aux hôtes avec `ssh user@host`.
- **Privilèges root** : Si des erreurs de permission apparaissent, vérifiez que `become: yes` est bien configuré dans les playbooks.
- **Host Key Checking** : Si des erreurs de clé hôte apparaissent, désactivez la vérification en ajoutant `host_key_checking = False` dans le fichier `ansible.cfg`.

---

Avec ce guide, vous êtes prêt à déployer un serveur web et une base de données de manière automatisée avec Ansible. Assurez-vous de remplacer les valeurs d'exemple par celles spécifiques à votre infrastructure.
