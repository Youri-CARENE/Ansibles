FROM alpine:latest

# Installer OpenSSH
RUN apk add --no-cache openssh-server openssh-client

# Générer des clés SSH lors du démarrage du conteneur
RUN ssh-keygen -A

# Créer un nouvel utilisateur et  son mot de passe
RUN adduser -D user && echo "user:password" | chpasswd

# Exposer le port SSH
EXPOSE 22

# Exécuter le serveur SSH en arrière-plan
CMD ["/usr/sbin/sshd", "-D"]
