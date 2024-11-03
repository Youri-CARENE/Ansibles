
# Configuration de Base Après Installation

Après avoir installé Ansible, il est important de configurer quelques éléments de base pour que votre environnement soit opérationnel.

## 1. Créer un Fichier d'Inventaire
L'inventaire est un fichier qui contient la liste des hôtes que vous souhaitez gérer avec Ansible. Par défaut, Ansible utilise `/etc/ansible/hosts`, mais vous pouvez créer votre propre fichier d'inventaire.

### Exemple de fichier d'inventaire (`hosts`)
```
[webservers]
web1.example.com
web2.example.com

[databases]
db1.example.com
```

Vous pouvez aussi spécifier des variables spécifiques aux groupes ou aux hôtes dans ce fichier.

## 2. Configurer `ansible.cfg`
Le fichier `ansible.cfg` permet de configurer le comportement d'Ansible, tel que les chemins d'inventaire, les options de connexion, et bien plus.

### Exemple de fichier `ansible.cfg`
```ini
[defaults]
inventory = ./hosts
remote_user = your_user
host_key_checking = False
```

## 3. Configurer les Clés SSH
Pour que le contrôleur Ansible puisse se connecter aux hôtes sans mot de passe, vous devrez configurer les clés SSH.

### Générer une clé SSH
```bash
ssh-keygen -t rsa
```

### Copier la clé publique sur les hôtes
```bash
ssh-copy-id user@remote_host
```

## 4. Tester la Connexion SSH
Assurez-vous que vous pouvez vous connecter aux hôtes cibles via SSH sans avoir à entrer un mot de passe :
```bash
ssh user@remote_host
```

## 5. Vérifier la Configuration avec la Commande `ansible all -m ping`
Il peut être utile de vérifier que la configuration fonctionne correctement en exécutant une commande de test. La commande `ansible all -m ping` permet de s'assurer qu'Ansible peut communiquer avec tous les hôtes définis dans l'inventaire.

**Exemple :**
```bash
ansible all -m ping
```

Cette commande devrait retourner un message "pong" pour chaque hôte si la connexion fonctionne.

## 6. Définir des Variables dans l'Inventaire
Vous pouvez définir des variables spécifiques dans l'inventaire, telles que `ansible_user` pour chaque hôte ou groupe de machines.

**Exemple :**
```ini
[webservers]
web1.example.com ansible_user=webadmin
web2.example.com ansible_user=webadmin
```

## 7. Installer des Modules Python Nécessaires
Certains modules Ansible nécessitent des bibliothèques Python spécifiques pour fonctionner (comme `paramiko` pour les connexions SSH). Installez les dépendances nécessaires pour éviter les erreurs.

**Exemple :**
```bash
pip install paramiko
```

## 8. Utiliser les Groupes d'Environnements
Divisez les hôtes en groupes logiques dans l'inventaire, comme `dev`, `staging`, et `production` pour une gestion plus organisée.

**Exemple :**
```ini
[dev]
dev1.example.com

[staging]
staging1.example.com

[production]
prod1.example.com
prod2.example.com
```
