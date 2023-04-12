Configuration
=======

**ansible.cfg** : fichier de configuration d'Ansible.
**hosts** : fichier qui définit les hôtes que vous souhaitez gérer avec Ansible.


Commandes
-----------



**ansible-playbook** : commande pour exécuter un playbook Ansible.
**ansible-vault** : commande pour gérer les secrets et les variables sensibles.
**ansible-inventory** : commande pour afficher la liste des hôtes gérés par Ansible.
**ansible-galaxy** : commande pour gérer les rôles Ansible.

Playbooks
-----------



**hosts **: définit les hôtes cibles pour chaque tâche.
**vars **: définit des variables utilisées dans le playbook.
**tasks ** : définit les tâches à exécuter.
**roles **: définit des rôles qui peuvent être réutilisés dans différents playbooks.


Modules
-----------



**apt** : gère les paquets sous Debian et Ubuntu.
**yum **: gère les paquets sous CentOS, Red Hat et Fedora.
**copy **: copie des fichiers d'une machine à une autre.
**file **: gère les fichiers et les répertoires.
**service **: gère les services système.
**user** : gère les utilisateurs et les groupes système.
**template** : copie des fichiers en remplaçant les variables.


Variables
-----------



**{{ }}** : définit une variable dans un playbook Ansible.
**{{ variable_name }} **: appel d'une variable dans un playbook Ansible.
**ansible_* ***: variables système qui contiennent des informations sur l'hôte cible (par exemple, ansible_hostname, ansible_os_family, ansible_distribution).
**hostvars **: variable qui contient des informations sur l'hôte cible (par exemple, hostvars['hostname']['variable_name']).


Exemples
-----------



**Exécuter un playbook Ansible **: ansible-playbook playbook.yml
**Copier un fichier sur une machine distante **: ansible host -m copy -a "src=/path/to/local/file dest=/path/to/remote/file"
**Installer un paquet avec apt** : ansible host -m apt -a "name=package state=present"
**Exécuter une commande sur une machine distante **: ansible host -m command -a "some_command"