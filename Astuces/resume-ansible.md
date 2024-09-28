# Ansible

## Introduction à Ansible
- **Ansible** est un outil d'automatisation pour la gestion de configuration, le déploiement d'applications, et l'orchestration.
- C'est un outil **agentless** qui utilise SSH pour communiquer avec les machines cibles.
- Les fichiers Ansible sont écrits en **YAML**.

## Concepts Clés d'Ansible
- **Playbook** : Fichier YAML qui définit les tâches à exécuter.
- **Inventory** : Liste des hôtes (machines cibles).
- **Roles** : Organisation des tâches dans des composants réutilisables.
- **Tasks** : Actions à exécuter sur les hôtes.
- **Handlers** : Tâches spéciales qui ne s'exécutent que lorsqu'elles sont notifiées.
- **Modules** : Briques fonctionnelles pour exécuter des actions (ex. : `apt`, `yum`, `service`, `copy`).

## Fichier Playbook Exemple
```yaml
---
- name: Installer et configurer un serveur web
  hosts: webservers
  become: yes
  tasks:
    - name: Installer Apache
      apt:
        name: apache2
        state: present
        update_cache: yes
    - name: S'assurer qu'Apache est démarré
      service:
        name: apache2
        state: started