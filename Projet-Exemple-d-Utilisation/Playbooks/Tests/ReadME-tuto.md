# Petit uide pour Tester et utiliser les Playbooks ansible

## Prérequis
1. Assurez-vous qu'Ansible est installé sur votre machine.
2. Vérifiez que votre inventaire est correctement configuré dans le dossier `inventaire/`.

## Étapes pour Tester les Playbooks

1. **Tester le Playbook Principal (`site.yaml`)** :
   Exécutez le fichier de test `test_site.yaml` pour vérifier que les playbooks de configuration du serveur web et de la base de données sont inclus correctement.
   ```bash
   ansible-playbook tests/test_site.yaml
