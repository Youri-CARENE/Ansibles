


## Tester la connexion SSH

### Obtenez l'adresse IP de `alpine2`:
```
ip_alpine2=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' alpine2)
```

### SSH de `alpine1` à `alpine2`:
```
docker exec -it alpine1 ssh user@$ip_alpine2
```

