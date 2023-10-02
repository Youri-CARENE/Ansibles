#!/bin/bash


# Copier la clé publique de alpine1
key=$(docker exec -it alpine1 cat /root/.ssh/id_rsa.pub)

# Ajouter la clé aux clés autorisées de alpine2
docker exec -it alpine2 sh -c "echo $key >> /root/.ssh/authorized_keys"

# Ajouter la clé aux clés autorisées de alpine3
docker exec -it alpine3 sh -c "echo $key >> /root/.ssh/authorized_keys"