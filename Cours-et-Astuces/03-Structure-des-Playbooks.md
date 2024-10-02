# Structure des Playbooks Ansible

Les playbooks Ansible sont des fichiers YAML qui définissent les tâches à exécuter sur des hôtes cibles. Voici les éléments principaux d'un playbook.

## 1. Nom du Playbook
Un playbook commence généralement par un nom pour décrire son objectif général :
```yaml
---
- name: Configuration des serveurs web
```

## 2. Définition des Hôtes
L'attribut **hosts** indique les machines sur lesquelles les tâches doivent être exécutées :
```yaml
  hosts: webservers
```

## 3. Privilèges Élevés
L'attribut **become** indique si les tâches doivent être exécutées avec des privilèges administrateur :
```yaml
  become: yes
```

## 4. Variables
Les **variables** peuvent être définies dans le playbook pour rendre les configurations dynamiques :
```yaml
  vars:
    http_port: 80
```

## 5. Tâches
Les **tasks** sont les actions à exécuter sur les hôtes :
```yaml
  tasks:
    - name: Installer Apache
      apt:
        name: apache2
        state: present
        update_cache: yes
```

## 6. Handlers
Les **handlers** sont des tâches qui s'exécutent lorsqu'elles sont appelées par une autre tâche. Elles sont souvent utilisées pour redémarrer des services après modification de fichiers de configuration :
```yaml
  handlers:
    - name: Redémarrer Apache
      service:
        name: apache2
        state: restarted
```

## Exemple Complet de Playbook
```yaml
---
- name: Configurer un serveur web
  hosts: webservers
  become: yes
  vars:
    http_port: 80
  tasks:
    - name: Installer Apache
      apt:
        name: apache2
        state: present

    - name: Copier la configuration Apache
      template:
        src: apache.conf.j2
        dest: /etc/apache2/apache2.conf
      notify: Redémarrer Apache

  handlers:
    - name: Redémarrer Apache
      service:
        name: apache2
        state: restarted
```
