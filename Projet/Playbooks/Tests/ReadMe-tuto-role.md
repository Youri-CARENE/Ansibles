Utiliser les Rôles Ansible `webserver/` et `database/`

## Prérequis
1. Assurez-vous qu'Ansible est installé sur votre machine.
2. Vérifiez que votre inventaire est correctement configuré dans le dossier `inventaire/`.

## Étapes pour Tester les Rôles

1. **Tester le Rôle de Configuration du Serveur Web** :
   Exécutez le fichier de test `test_webserver_role.yaml` pour vérifier que le rôle `webserver` configure correctement Nginx.
   ```bash
   ansible-playbook tests/test_webserver_role.yaml