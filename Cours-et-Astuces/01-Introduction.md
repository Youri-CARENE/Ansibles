# Introduction à Ansible

Ansible est un outil d'automatisation open source qui permet de gérer la configuration, le déploiement et l'orchestration de l'infrastructure informatique. Il se distingue par sa simplicité, car il est **sans agent** (agentless) et utilise **SSH** pour communiquer avec les hôtes cibles, ce qui en fait une solution facile à mettre en œuvre.

## Avantages d'Ansible
- **Simplicité** : Ansible utilise le langage **YAML** (Yet Another Markup Language) pour définir les configurations. Les playbooks sont donc faciles à lire et à comprendre, même pour des utilisateurs non techniques.
- **Automatisation sans agent** : Aucun logiciel supplémentaire n'a besoin d'être installé sur les machines cibles, ce qui réduit la maintenance.
- **Flexibilité** : Ansible permet d'automatiser des tâches sur un grand nombre de systèmes, que ce soit des serveurs physiques, des environnements cloud, ou même des périphériques réseau.
- **Communauté et soutien** : Ansible bénéficie d'une communauté active, ce qui permet de trouver des ressources, des modules existants, et de l'aide facilement.

Ansible est principalement utilisé pour :
1. **Automatiser les configurations de serveurs** : Par exemple, la configuration d'Apache, MySQL, etc.
2. **Orchestrer les tâches complexes** : Déployer une application dans un environnement multi-serveurs.
3. **Gestion de configuration** : Maintenir les systèmes dans un état défini.

Pour commencer avec Ansible, il est important de se familiariser avec les concepts de base, tels que les **playbooks**, les **modules**, et les **inventaires**, qui seront détaillés dans les sections suivantes.
