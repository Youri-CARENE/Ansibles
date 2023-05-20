# Installer Ansible sur Ubuntu Linux

Pour installer Ansible sur Ubuntu Linux, vous pouvez suivre ces étapes :

## Mise à jour du système

Ouvrez un terminal et exécutez la commande suivante pour mettre à jour la liste des paquets et installer les mises à jour disponibles :


 
```sudo apt update && sudo apt upgrade -y```




## Installation des dépendances logicielles

Ansible a besoin de quelques paquets supplémentaires pour fonctionner correctement. Installez les paquets nécessaires avec la commande suivante :


 
```sudo apt install -y software-properties-common```


## Ajout du dépôt PPA d'Ansible

Ansible est disponible via son propre dépôt PPA (Personal Package Archive) pour Ubuntu. Ajoutez ce dépôt en utilisant la commande suivante :


 
```sudo add-apt-repository --yes --update ppa:ansible/ansible```


## Installation d'Ansible

Après avoir ajouté le dépôt PPA d'Ansible, installez Ansible avec la commande suivante :




```sudo apt install -y ansible```


## Vérification de l'installation

Vérifiez la version d'Ansible installée pour vous assurer que l'installation a réussi :



 
```ansible --version```



Vous devriez voir la version d'Ansible s'afficher dans le terminal.

## Configuration d'Ansible

Créez un fichier de configuration Ansible dans le répertoire /etc/ansible :


 
```sudo vim /etc/ansible/ansible.cfg```


Ajoutez les éléments suivants dans le fichier de configuration :


 
[defaults]
inventory = /etc/ansible/hosts
remote_user = votre_utilisateur
host_key_checking = False


Remplacez votre_utilisateur par le nom d'utilisateur que vous utiliserez pour vous connecter aux machines distantes.

## Configuration des hôtes

Créez un fichier d'inventaire pour définir les hôtes sur lesquels vous voulez exécuter des commandes Ansible :




 
```sudo nano /etc/ansible/hosts```



Ajoutez vos hôtes en utilisant la syntaxe suivante :



 
[nom_du_groupe]
hôte1 ansible_host=adresse_ip_hôte1
hôte2 ansible_host=adresse_ip_hôte2


Remplacez nom_du_groupe, hôte1, hôte2, adresse_ip_hôte1 et adresse_ip_hôte2 par les informations appropriées pour vos machines distantes.

## Test de connexion

Testez la connexion à vos hôtes en utilisant la commande ping d'Ansible :


 
```ansible nom_du_groupe -m ping```

Si la connexion est établie avec succès, vous verrez une réponse pong pour chaque hôte dans le groupe.
