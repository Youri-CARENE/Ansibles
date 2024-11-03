# Ansible Cheat Sheet with Docker

## Installation

### Installing Ansible
sudo apt update
sudo apt install ansible -y

### Installing Docker
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

### Installing Docker Python Module
pip install docker

## Configuration

### Ansible Hosts File
Edit the `/etc/ansible/hosts` file to add your Docker hosts.
[local]
localhost ansible_connection=local

[webservers]
web1 ansible_host=192.168.1.100 ansible_user=root
web2 ansible_host=192.168.1.101 ansible_user=root

## Basic Commands

### Check Ansible Version
ansible --version

### Ping All Hosts
ansible all -m ping

### List Hosts
ansible all --list-hosts

### Running Ad-Hoc Commands
ansible all -m shell -a 'uptime'

## Playbooks

### Basic Playbook Structure
---
- name: Example Playbook
  hosts: webservers
  tasks:
    - name: Ensure Docker is running
      service:
        name: docker
        state: started

    - name: Run a Docker container
      docker_container:
        name: my_container
        image: nginx
        state: started
        ports:
          - "80:80"

### Running a Playbook
ansible-playbook playbook.yml

## Roles

### Creating a Role
ansible-galaxy init my_role

### Using a Role in a Playbook
---
- name: Example Playbook with Role
  hosts: webservers
  roles:
    - my_role

## Docker Module Examples

### Pull a Docker Image
- name: Pull an image
  docker_image:
    name: nginx
    source: pull

### Run a Docker Container
- name: Run a container
  docker_container:
    name: my_container
    image: nginx
    state: started
    ports:
      - "80:80"

### Stop and Remove a Docker Container
- name: Stop and remove a container
  docker_container:
    name: my_container
    state: absent

### List Docker Containers
- name: List containers
  docker_host_info:

## Useful Tips

### Check Syntax of Playbook
ansible-playbook playbook.yml --syntax-check

### Dry Run (Check Mode)
ansible-playbook playbook.yml --check

### View Detailed Output
ansible-playbook playbook.yml -v

### Use Vault for Secrets
ansible-vault create secret.yml
ansible-vault edit secret.yml
ansible-playbook playbook.yml --ask-vault-pass



## 7. Boucles et Conditions
Les boucles et les conditions permettent d'exécuter des tâches de manière répétée ou conditionnelle.

### Boucles
Les boucles permettent de répéter une tâche plusieurs fois avec des valeurs différentes.

**Exemple :**
```yaml
- name: Installer plusieurs paquets
  apt:
    name: "{{ item }}"
    state: present
  loop:
    - git
    - curl
    - vim
```

### Conditions
Les conditions permettent d'exécuter des tâches seulement si certaines conditions sont remplies.

**Exemple :**
```yaml
- name: Redémarrer le service nginx si la version est 2.0
  service:
    name: nginx
    state: restarted
  when: ansible_facts['nginx_version'] == "2.0"
```

## 8. Templates
Les templates utilisent le moteur de templating Jinja2 pour générer des fichiers de configuration dynamiques, ce qui est particulièrement utile pour personnaliser des configurations.

**Exemple :**
```yaml
- name: Copier le fichier de configuration
  template:
    src: /templates/nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: Redémarrer nginx
```

## 9. Filtres
Les filtres sont utilisés pour manipuler les données (variables) dans Ansible, notamment pour formater ou transformer des valeurs.

**Exemple d'utilisation de filtre :**
```yaml
- name: Afficher la date formatée
  debug:
    msg: "La date actuelle est {{ ansible_date_time.date | replace('-', '/') }}"
```

## 10. Gestion des erreurs
La gestion des erreurs est essentielle pour contrôler le comportement en cas d'échec d'une tâche. Ansible permet d'ignorer ou de personnaliser le comportement en cas d'échec avec `ignore_errors` et `failed_when`.

**Exemple :**
```yaml
- name: Exécuter une commande avec gestion d'erreur
  command: /bin/false
  ignore_errors: yes
```

## 11. Tags
Les tags permettent de filtrer les tâches à exécuter. C’est pratique pour n’exécuter qu'une partie d’un playbook.

**Exemple d'utilisation de tags :**
```yaml
- name: Installer Nginx
  apt:
    name: nginx
    state: present
  tags: nginx_installation
```

## 12. Ansible Galaxy
Ansible Galaxy permet de télécharger et de partager des rôles Ansible. Cela facilite l'importation de rôles préconfigurés pour des tâches courantes.

**Exemple de commande :**
```bash
ansible-galaxy install geerlingguy.nginx
```

## 13. Ansible Vault
Ansible Vault permet de chiffrer des données sensibles comme des mots de passe, garantissant ainsi la sécurité des informations confidentielles.

**Exemple de chiffrement :**
```bash
ansible-vault encrypt fichier_secrets.yml
```
