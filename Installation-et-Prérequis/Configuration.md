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
