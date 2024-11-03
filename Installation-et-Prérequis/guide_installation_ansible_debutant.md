
# Guide d'Installation et de Configuration d'Ansible

Ce guide vous accompagnera pas à pas pour installer et configurer Ansible sur votre système, avec les instructions nécessaires pour adapter les fichiers de configuration aux spécificités de votre infrastructure.

## 1. Prérequis et Installation d'Ansible

### Prérequis
- Un système basé sur Linux (Ubuntu, CentOS, etc.) ou macOS.
- Accès administrateur (root ou sudo) pour les installations et configurations.
  - **Comment vérifier ?** : Tapez `whoami` dans votre terminal. Si la réponse est "root" ou si vous avez un accès `sudo`, vous pouvez continuer. Sinon, demandez l'accès à votre administrateur système.
- Une connexion internet pour télécharger Ansible.

### Installation d'Ansible

#### Sur Ubuntu/Debian :
```bash
sudo apt update
sudo apt install ansible -y
```

#### Sur CentOS/RedHat :
```bash
sudo yum install epel-release -y
sudo yum install ansible -y
```

#### Vérification de l'installation
Vérifiez qu'Ansible est installé en utilisant :
```bash
ansible --version
```
Vous devriez voir la version installée d'Ansible s'afficher. Si ce n'est pas le cas, vérifiez votre connexion internet et réessayez.

## 2. Configuration de Base

### Créer un Fichier d'Inventaire

L'inventaire est un fichier qui contient la liste des hôtes sur lesquels Ansible exécutera des tâches. Par défaut, Ansible utilise `/etc/ansible/hosts`, mais il est recommandé de créer un fichier d'inventaire spécifique pour votre projet.

**Exemple de fichier d'inventaire (`hosts`)**
```
[webservers]
web1.example.com
web2.example.com

[databases]
db1.example.com
```

**Remarque :** Utilisez l'adresse IP ou le nom de domaine de chaque serveur en fonction de votre infrastructure.

**Comment trouver l'adresse IP ?**  
Connectez-vous à chaque serveur cible et tapez `ip a` ou `ifconfig`. L'adresse IP devrait ressembler à `192.168.x.x` ou `10.x.x.x`.

### Convention de Nommage
- **Nom d'hôte** : Utilisez des noms descriptifs (ex. `web1`, `db1`) pour identifier les serveurs par leur rôle. Cela rend la gestion plus claire.
- **Groupes** : Créez des groupes logiques (ex. `[webservers]`, `[databases]`) pour organiser les hôtes par type ou fonction.

## 3. Configurer `ansible.cfg`

Le fichier `ansible.cfg` configure le comportement d'Ansible, comme le chemin de l'inventaire, les options de connexion, etc.

**Exemple de configuration `ansible.cfg`**
```ini
[defaults]
inventory = ./hosts  # Spécifiez le chemin de votre fichier d'inventaire
remote_user = votre_utilisateur  # Remplacez par l'utilisateur SSH par défaut
host_key_checking = False  # Désactive la vérification de clé hôte pour éviter les avertissements
```
**Remarque** : Désactiver `host_key_checking` peut éviter des erreurs si c'est la première fois que vous vous connectez à un hôte.

## 4. Configuration SSH

Ansible se connecte aux hôtes via SSH. Pour simplifier, vous pouvez configurer une connexion SSH sans mot de passe en générant une clé SSH.

### Générer une clé SSH
Si vous n'avez pas de clé SSH, générez-en une avec :
```bash
ssh-keygen -t rsa
```
Suivez les instructions et appuyez sur Entrée pour chaque option si vous voulez garder les valeurs par défaut.

### Copier la clé publique sur les hôtes
Copiez la clé publique sur chaque hôte pour permettre une connexion sans mot de passe :
```bash
ssh-copy-id user@remote_host  # Remplacez user par votre utilisateur SSH et remote_host par l'adresse IP de l'hôte cible
```
**Note** : Si `ssh-copy-id` n'est pas disponible, vous pouvez copier manuellement la clé avec :
```bash
cat ~/.ssh/id_rsa.pub | ssh user@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

### Vérifier la connexion SSH
Assurez-vous que la connexion fonctionne en vous connectant aux hôtes :
```bash
ssh user@remote_host  # Remplacez user et remote_host par vos informations
```

## 5. Vérifier la Configuration avec la Commande `ansible all -m ping`

Une fois l'inventaire et les clés SSH configurés, testez la connexion avec la commande suivante :
```bash
ansible all -m ping
```
Si tout est correctement configuré, vous devriez voir un message "pong" pour chaque hôte. Si une erreur apparaît, vérifiez que les adresses IP et utilisateurs sont corrects dans le fichier d'inventaire.

## 6. Définir des Variables dans l'Inventaire

Les variables peuvent être ajoutées directement dans le fichier d'inventaire. Par exemple, vous pouvez définir l'utilisateur SSH pour chaque hôte.

**Exemple :**
```ini
[webservers]
192.168.1.10 ansible_user=webadmin
192.168.1.11 ansible_user=webadmin
```

## 7. Installer des Modules Python Nécessaires

Certains modules Ansible nécessitent des bibliothèques Python supplémentaires pour fonctionner, comme `paramiko` pour les connexions SSH.

**Installez les modules requis :**
```bash
pip install paramiko
```
**Vérifiez l'installation avec :**
```bash
pip show paramiko
```

## 8. Utiliser les Groupes d'Environnements

Pour organiser les hôtes, vous pouvez les diviser en groupes d'environnements, comme `dev`, `staging`, et `production`.

**Exemple d'organisation :**
```ini
[dev]
192.168.1.10

[staging]
192.168.2.10

[production]
192.168.3.10
192.168.3.11
```

## Résolution des Erreurs Courantes

- **Erreur de clé hôte inconnue** : Si `host_key_checking` n'est pas désactivé dans `ansible.cfg`, vous pourriez recevoir des erreurs de clé SSH. Ajoutez `host_key_checking = False` dans `[defaults]` pour éviter cela.
- **Permission SSH refusée** : Vérifiez que la clé SSH a bien été copiée sur l’hôte et que l’utilisateur est correct.
- **Modules Python manquants** : Vérifiez l'installation des modules nécessaires avec `pip show <module_name>`.

En suivant ces étapes, vous aurez un environnement Ansible opérationnel, prêt à exécuter des tâches sur vos hôtes. Assurez-vous de remplacer les valeurs d'exemple par celles spécifiques à votre infrastructure.
