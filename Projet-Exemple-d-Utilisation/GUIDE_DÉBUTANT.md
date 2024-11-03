
# Guide Ansible pour Débutants

Ce guide est conçu pour vous aider à démarrer avec Ansible et à utiliser efficacement ce projet. Il comprend des conseils pour installer Ansible, configurer les connexions SSH, organiser les rôles et playbooks, et résoudre les erreurs courantes.

## 1. Introduction aux Concepts Ansible

Ansible est un outil d'automatisation qui vous permet de gérer plusieurs machines en utilisant des scripts appelés "playbooks". Voici quelques concepts clés :
- **Inventaire (hosts)** : Fichier listant les machines cibles (serveurs).
- **Playbook** : Un fichier qui définit une série de tâches à exécuter sur des hôtes.
- **Rôle** : Structure permettant de réutiliser et organiser des tâches spécifiques (comme configurer un serveur web).
- **Handler** : Tâche spéciale qui ne s'exécute que lorsqu'elle est déclenchée par d'autres tâches.

## 2. Installation d'Ansible et Configuration SSH

### Installation d'Ansible
1. **Sur Ubuntu/Debian** :
   ```bash
   sudo apt update && sudo apt install ansible -y
   ```
2. **Sur CentOS/RedHat** :
   ```bash
   sudo yum install epel-release -y && sudo yum install ansible -y
   ```

### Vérification de l'installation
Utilisez la commande suivante pour vérifier qu'Ansible est bien installé :
```bash
ansible --version
```
Vous devriez voir des informations sur la version installée d'Ansible.

### Configuration SSH
1. **Générer une clé SSH** si vous n'en avez pas encore :
   ```bash
   ssh-keygen -t rsa
   ```
2. **Copier la clé publique sur chaque hôte cible** pour permettre la connexion sans mot de passe :
   ```bash
   ssh-copy-id user@remote_host  # Remplacez user et remote_host
   ```

## 3. Structure des Rôles et des Playbooks

- **Rôles** : Assurez-vous que chaque rôle contient les dossiers `tasks`, `handlers`, `vars` (si nécessaire), et `files`. Le rôle `web-server` doit être configuré pour Apache, et `db-server` pour MySQL.
- **Playbooks** : Utilisez les playbooks fournis (`deploy-web.yml` et `config-db.yml`) pour exécuter les rôles. Les commandes sont dans le README.

**Exemple de Rôle** :
- `roles/web-server/tasks/main.yml` : Contient les tâches pour installer et configurer Apache.
- `roles/db-server/tasks/main.yml` : Contient les tâches pour installer et configurer MySQL.

## 4. Conseils de Dépannage

- **Erreur SSH** : Si vous avez des problèmes de connexion SSH, vérifiez que les clés sont bien copiées et que `host_key_checking = False` est dans `ansible.cfg`.
- **Permissions insuffisantes** : Utilisez `become: yes` dans vos playbooks pour obtenir des droits root.
- **Modules manquants** : Si une tâche échoue à cause d'un module manquant, installez les dépendances avec `pip install`.
- **Vérification de la connectivité** : Testez la connectivité avec tous les hôtes cibles en utilisant :
   ```bash
   ansible all -m ping -i hosts
   ```

## 5. Commandes Clés d'Ansible

- **Exécuter un playbook** :
   ```bash
   ansible-playbook -i hosts nom_du_playbook.yml
   ```
- **Lister les hôtes dans l'inventaire** :
   ```bash
   ansible-inventory --list -i hosts
   ```
- **Vérifier les variables disponibles** :
   ```bash
   ansible -m setup nom_d_hôte
   ```

