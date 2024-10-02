# Astuces pour Utiliser Ansible

Cette section regroupe des astuces pratiques pour optimiser l'utilisation d'Ansible au quotidien.

## 1. Commandes Utiles
### Vérifier la Version d'Ansible
```bash
ansible --version
```
### Pinguer tous les Hôtes
```bash
ansible all -m ping
```
### Lancer un Playbook
```bash
ansible-playbook playbook.yml
```

## 2. Utilisation de Ansible Vault
### Créer un Fichier Chiffré
```bash
ansible-vault create secret.yml
```
### Modifier un Fichier Chiffré
```bash
ansible-vault edit secret.yml
```
### Lancer un Playbook avec des Secrets
```bash
ansible-playbook playbook.yml --ask-vault-pass
```

## 3. Mode de Vérification (Dry Run)
Pour vérifier les modifications sans les appliquer réellement, utilisez l'option `--check` :
```bash
ansible-playbook playbook.yml --check
```

## 4. Afficher une Sortie Détaillée
Pour obtenir plus de détails sur l'exécution, utilisez l'option `-v` :
```bash
ansible-playbook playbook.yml -v
```

## 5. Utiliser des Tags
Les **tags** permettent de contrôler quelles tâches seront exécutées dans un playbook. Utilisez `--tags` pour spécifier les tâches à exécuter :
```bash
ansible-playbook playbook.yml --tags "configuration"
```

## 6. Créer des Rôles
Utilisez **Ansible Galaxy** pour créer des rôles rapidement :
```bash
ansible-galaxy init nom_du_role
```

## 7. Optimisation des Playbooks
- **Utilisez `--limit`** pour exécuter des tâches sur un sous-ensemble d'hôtes :
  ```bash
  ansible-playbook playbook.yml --limit "webservers"
  ```
- **Rendez vos tâches conditionnelles** en utilisant `when` pour éviter des actions inutiles :
  ```yaml
  - name: Redémarrer Apache si la configuration a changé
    service:
      name: apache2
      state: restarted
    when: apache_config_changed
  ```
