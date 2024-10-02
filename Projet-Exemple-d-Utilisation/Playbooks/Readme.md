Un dossier spécifique pour mes playbooks Ansible. Cela permet de séparer clairement les fichiers de configuration des autres éléments du projet


|-- inventaire/
|   |-- hosts






|-- playbooks/
|   |-- site.yml
|   |-- webserver.yml
|   |-- database.yml




|   |-- templates/
|       |-- nginx.conf.j2
