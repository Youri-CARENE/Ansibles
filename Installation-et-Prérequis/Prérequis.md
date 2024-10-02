# Prérequis pour Utiliser Ansible

Avant de commencer avec Ansible, il est important de vous assurer que votre système répond à certains prérequis. Voici les principaux logiciels et configurations nécessaires.

## 1. Système d'Exploitation
Ansible fonctionne sur la plupart des distributions Linux, macOS, et Windows via WSL (Windows Subsystem for Linux). Les systèmes Linux, tels qu'Ubuntu, Debian, CentOS, et Red Hat, sont les plus couramment utilisés.

## 2. Python
Ansible nécessite Python 3.6 ou une version ultérieure pour fonctionner correctement. Vérifiez la version de Python avec la commande :
```bash
python3 --version
```

## 3. Accès SSH
Ansible utilise SSH pour se connecter aux hôtes cibles. Assurez-vous que les hôtes à gérer sont accessibles via SSH et que vous avez les clés SSH configurées pour éviter de devoir entrer le mot de passe à chaque connexion.

## 4. Droits Administrateur
Pour installer des paquets et configurer des services, Ansible doit être capable d'exécuter des commandes avec des privilèges élevés (root). Vous devrez donc configurer **sudo** sans mot de passe pour les utilisateurs Ansible.

## 5. Bibliothèques Python supplémentaires
Selon les modules Ansible que vous prévoyez d'utiliser, certaines bibliothèques Python supplémentaires peuvent être nécessaires. Par exemple :
```bash
pip install paramiko
```

## 6. Ansible Installé sur le Contrôleur
Le contrôleur Ansible est la machine depuis laquelle vous exécutez les commandes. Vous devez installer Ansible sur cette machine (voir le fichier `Installer-Ansible.md`).
