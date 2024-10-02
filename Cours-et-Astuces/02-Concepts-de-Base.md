# Concepts de Base d'Ansible

Cette section vous présente les concepts essentiels d'Ansible pour une meilleure compréhension de ses fonctionnalités et de son utilisation.

## 1. Inventaire
L'inventaire est un fichier qui contient la liste des hôtes sur lesquels Ansible peut exécuter des tâches. Il peut être un fichier statique (`hosts`) ou dynamique.

### Exemple d'inventaire statique
```
[webservers]
web1.example.com
web2.example.com

[databases]
db1.example.com
```

## 2. Modules
Les modules sont des blocs de code pré-écrits qui permettent d'effectuer des tâches spécifiques sur les hôtes, telles que l'installation de paquets ou la gestion des fichiers.

### Exemples de modules courants
- **apt** : Pour gérer les paquets sur Debian/Ubuntu.
- **yum** : Pour gérer les paquets sur CentOS/RedHat.
- **service** : Pour démarrer, arrêter ou redémarrer des services.
- **copy** : Pour copier des fichiers d'une machine à une autre.

## 3. Playbooks
Les playbooks sont des fichiers écrits en YAML qui définissent des tâches à exécuter sur des hôtes. Ils permettent d'automatiser des processus complexes.

### Structure d'un Playbook
- **hosts** : Définir les machines cibles.
- **tasks** : Lister les actions à exécuter.
- **vars** : Définir des variables.
- **handlers** : Définir des actions à exécuter après certaines modifications.

## 4. Rôles
Les rôles permettent de structurer les configurations en composants réutilisables. Un rôle peut inclure des tâches, des fichiers, des modèles, des variables, etc.

## 5. Variables
Les variables rendent les playbooks dynamiques et réutilisables. Elles sont définies dans des fichiers de variables, dans l'inventaire, ou directement dans le playbook.

## 6. Handlers
Les handlers sont des tâches spéciales qui ne s'exécutent que lorsqu'elles sont appelées par d'autres tâches, généralement suite à une modification d'état.
