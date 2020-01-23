autoscale: true
# [fit] Estrategias
# [fit] De despliegue
---
![](https://media.giphy.com/media/MS0fQBmGGMaRy/giphy.gif)
# Recreate

---
# Recreate

Reemplazar la actual versión por una nueva.

Apagar y encender.

---
# Recreate

- Cuando nuestra aplicación no esté preparada para trabajar con más de una réplica.
- Cuando nuestro despliegue sea manual, e.g. ftp a un directorio.
- En un estado embrionario de nuestro producto nos puede simplificar el despliegue (no producción)

---
# Recreate

`vagrant up --provision-with docker`

---
# Recreate

- `vagrant ssh`
- `sudo docker run hello-world`

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
---
# Recreate

```
vagrant ssh
sudo su
vim|nano Dockerfile
vim|nano index.html
vim|nano myapp.conf
docker build -t myapp:v1 .
```

---
# Recreate

```
docker run --rm -d -p 8080:80 myapp:v1
```

Podemos comprobar que está desplegada con:
`curl localhost:8080`

y como respuesta:

```
<h1>GeekHub - VLC Bootcamp</h1>
<p>Version 1.0</p>
```

---
![](https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2019/05/21/957237.jpg)
# Recreate

---
# Recreate

Ahora vamos a por la `v2`.

Seguimos dentro de la máquina virtual.
```
vim index.html
```
Y sustituimos `<p>Version 1.0</p>` por `<p>Version 2.0</p>`

Entonces hacemos `build` de nuestra nueva versión.

`docker build -t myapp:v1 .`

---
# Recreate

Podemos ver las imágenes que tenemos con `docker images`.

Ahora paramos el contenedor con la versión 1.

`docker stop containerId`

Y lanzamos la v2:

`docker run --rm -d -p 8080:80 myapp:v2`

Y comprobamos de nuevo el output:

`curl localhost:8080`

---
# Recreate

- Downtime.
- Fácil de implementar.

---
# Recreate

Ejercicio:

- Construir v3 y desplegarla.
