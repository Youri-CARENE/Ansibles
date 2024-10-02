# Tester l'Installation d'Ansible

Une fois Ansible installé et configuré, vous devrez vérifier que tout fonctionne correctement. Voici quelques tests à effectuer.

## 1. Vérifier la Version d'Ansible
Assurez-vous qu'Ansible est correctement installé en vérifiant sa version :
```bash
ansible --version
```
Cela devrait retourner la version installée d'Ansible ainsi que des informations sur la configuration.

## 2. Tester la Connexion aux Hôtes
Utilisez la commande `ping` pour vérifier la connexion aux hôtes de votre inventaire :
```bash
ansible all -m ping
```
Si la connexion est réussie, vous verrez une réponse `pong` de chaque hôte.

## 3. Exécuter une Commande Ad-Hoc
Essayez d'exécuter une commande simple sur tous les hôtes pour vérifier que la communication est possible :
```bash
ansible all -m command -a "uptime"
```
Cela devrait retourner le temps de fonctionnement de chaque hôte.

## 4. Lancer un Playbook de Test
Créez un playbook de test pour installer un paquet (par exemple, `htop`) sur un hôte :
```yaml
---
- name: Test de l'installation d'Ansible
  hosts: all
  become: yes
  tasks:
    - name: Installer htop
      apt:
        name: htop
        state: present
```
Ensuite, lancez le playbook :
```bash
ansible-playbook test_installation.yml
```

## 5. Résolution des Problèmes
### Vérifier les Logs
Si une commande échoue, utilisez l'option `-v` pour obtenir plus de détails :
```bash
ansible-playbook test_installation.yml -v
```

### Vérifier les Clés SSH
Assurez-vous que les clés SSH sont correctement configurées et que vous pouvez vous connecter sans mot de passe :
```bash
ssh user@remote_host
```
