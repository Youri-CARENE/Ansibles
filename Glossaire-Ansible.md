# Glossaire Ansible

## 1. Playbook
- **Explication** : Un **Playbook** est un fichier YAML où tu décris les tâches que tu veux qu'Ansible exécute sur tes serveurs. Il contient une série de "plays" qui définissent ce qu'Ansible doit faire.
- **Exemple** : Si tu veux installer Nginx sur plusieurs serveurs, tu écris les instructions dans un **Playbook**.
  - **Commande** : `ansible-playbook <playbook.yml>`
#add





## 2. Task
- **Explication** : Une **Task** est une action unique dans un playbook, comme installer un paquet ou modifier un fichier. Plusieurs tâches sont exécutées séquentiellement dans un playbook.
- **Exemple** : Une tâche pour installer `nginx` sur un serveur :
  ```yaml
  - name: Install nginx
    apt:
      name: nginx
      state: present
  ```

## 3. Role
- **Explication** : Un **Role** est une manière organisée de structurer des playbooks et des fichiers connexes. Il permet de réutiliser facilement du code pour automatiser des tâches.
- **Exemple** : Si tu as besoin de plusieurs playbooks pour gérer une application web, tu peux les organiser dans un rôle.
  - **Commande** : `ansible-galaxy init <nom-role>`

## 4. Inventory
- **Explication** : L’**Inventory** est un fichier qui contient la liste des serveurs (hosts) sur lesquels Ansible va exécuter des tâches. Il peut contenir des groupes de serveurs et leurs adresses IP.
- **Exemple** : Un fichier d'inventaire avec deux serveurs :
  ```
  [webservers]
  192.168.1.10
  192.168.1.11
  ```
  - **Commande** : `ansible-playbook -i inventory <playbook.yml>`

## 5. Module
- **Explication** : Un **Module** est une fonction prédéfinie dans Ansible qui fait une tâche spécifique, comme installer des paquets, copier des fichiers, ou gérer des services.
- **Exemple** : Le module `apt` permet d'installer des paquets sur des systèmes basés sur Debian.
  - **Commande** :
  ```yaml
  - name: Install nginx
    apt:
      name: nginx
      state: present
  ```

## 6. Handler
- **Explication** : Un **Handler** est une tâche spéciale qui ne s'exécute que si elle est "notifiée" par une autre tâche. Souvent utilisé pour redémarrer des services après un changement.
- **Exemple** : Redémarrer Nginx après l'avoir installé ou modifié un fichier de configuration.
  ```yaml
  - name: Install nginx
    apt:
      name: nginx
    notify: Restart nginx

  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
  ```

## 7. Template
- **Explication** : Un **Template** est un fichier modèle qui peut inclure des variables, et Ansible les remplace par des valeurs spécifiques lors de son exécution.
- **Exemple** : Un template pour un fichier de configuration Nginx qui inclut une variable pour le port :
  ```jinja
  server {
    listen {{ http_port }};
    server_name localhost;
  }
  ```
  - **Commande** :
  ```yaml
  - name: Configure nginx
    template:
      src: nginx.conf.j2
      dest: /etc/nginx/nginx.conf
  ```

## 8. Ad-hoc Command
- **Explication** : Une **Ad-hoc Command** est une commande Ansible exécutée directement dans le terminal, sans avoir besoin d'écrire un playbook complet.
- **Exemple** : Pour installer un paquet sur un groupe de serveurs :
  ```bash
  ansible all -m apt -a "name=nginx state=present" -i inventory
  ```

## 9. Facts
- **Explication** : Les **Facts** sont des informations recueillies automatiquement par Ansible sur les machines distantes, comme l'adresse IP, l'OS, la mémoire, etc.
- **Exemple** : Récupérer les informations système d’un serveur :
  ```bash
  ansible <nom-hôte> -m setup
  ```

## 10. Vault
- **Explication** : **Ansible Vault** est un outil pour chiffrer des fichiers sensibles comme des mots de passe ou des clés API dans des playbooks.
- **Exemple** : Chiffrer un fichier contenant des mots de passe :
  ```bash
  ansible-vault encrypt <fichier>
  ansible-vault decrypt <fichier>
  ```

## 11. Variable
- **Explication** : Une **Variable** dans Ansible permet de rendre un playbook plus dynamique en remplaçant des valeurs fixes par des valeurs modifiables.
- **Exemple** : Définir et utiliser une variable pour spécifier un port :
  ```yaml
  - hosts: all
    vars:
      http_port: 80
    tasks:
      - name: Ensure nginx is running
        service:
          name: nginx
          state: started
  ```

## 12. Tag
- **Explication** : Un **Tag** permet d'exécuter des parties spécifiques d'un playbook au lieu de tout exécuter.
- **Exemple** : Si tu veux exécuter uniquement une tâche liée à la configuration :
  ```yaml
  - name: Configure nginx
    service:
      name: nginx
      state: started
    tags: configure
  ```
  - **Commande** : `ansible-playbook <playbook.yml> --tags "configure"`
