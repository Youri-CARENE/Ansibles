# Communication SSH entre conteneurs Alpine

## Étape 1: Création du Dockerfile

\```Dockerfile
FROM alpine:latest

# Installer OpenSSH
RUN apk add --no-cache openssh-server openssh-client

# Générer des clés SSH lors du démarrage du conteneur
RUN ssh-keygen -A

# Créer un nouvel utilisateur (par exemple "user") et définir son mot de passe
RUN adduser -D user && echo "user:password" | chpasswd

# Exposer le port SSH
EXPOSE 22

# Exécuter le serveur SSH en arrière-plan
CMD ["/usr/sbin/sshd", "-D"]
\```

## Étape 2: Construire l'image Docker

\``` 
docker build -t alpine-ssh .
\```

## Étape 3: Exécuter les conteneurs

\``` 
docker run -d --name alpine1 alpine-ssh
docker run -d --name alpine2 alpine-ssh
docker run -d --name alpine3 alpine-ssh
\```

## Étape 4: Configurer SSH

1. Générez une paire de clés SSH sur `alpine1`:
\``` 
docker exec -it alpine1 ssh-keygen
\```

2. Copiez la clé publique de `alpine1` et ajoutez-la aux clés autorisées de `alpine2` et `alpine3`:

\``` 
# Copier la clé publique de alpine1
key=$(docker exec -it alpine1 cat /root/.ssh/id_rsa.pub)

# Ajouter la clé aux clés autorisées de alpine2
docker exec -it alpine2 sh -c "echo $key >> /root/.ssh/authorized_keys"

# Ajouter la clé aux clés autorisées de alpine3
docker exec -it alpine3 sh -c "echo $key >> /root/.ssh/authorized_keys"
\```

## Étape 5: Tester la connexion SSH

1. Obtenez l'adresse IP de `alpine2`:
\``` 
ip_alpine2=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' alpine2)
\```

2. SSH de `alpine1` à `alpine2`:
\``` 
docker exec -it alpine1 ssh user@$ip_alpine2
\```
