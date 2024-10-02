# Guide d'Installation d'Ansible

Comment installer Ansible sur votre système, afin que vous puissiez commencer à l'utiliser pour automatiser vos tâches.

## Installation sur Ubuntu/Debian
1. **Mettre à jour le gestionnaire de paquets** :
   ```bash
   sudo apt update
   ```

2. **Installer Ansible** :
   ```bash
   sudo apt install ansible -y
   ```

3. **Vérifier l'installation** :
   ```bash
   ansible --version
   ```
   Vous devriez voir la version d'Ansible installée.

## Installation sur CentOS/RedHat
1. **Activer le dépôt EPEL** :
   ```bash
   sudo yum install epel-release -y
   ```

2. **Installer Ansible** :
   ```bash
   sudo yum install ansible -y
   ```

3. **Vérifier l'installation** :
   ```bash
   ansible --version
   ```

## Installation via Pip
Vous pouvez également installer Ansible via **pip**, le gestionnaire de paquets Python :
```bash
pip install ansible
```

## Configuration Après Installation
Une fois Ansible installé, vous devrez créer un fichier d'inventaire pour lister les hôtes à gérer, et un fichier `ansible.cfg` pour définir la configuration par défaut.
