autoscale: true
# [fit] Estrategias
# [fit] De despliegue
---
![](https://i.gifer.com/8H4k.gif)

---
# Blue/Green

Consiste en desplegar de forma simultanea 2 versiones distintas y entonces mover el tráfico de Blue a Green.
Una vez pasamos de A a B, si tenemos problemas podemos hacer `roll back` instantáneo.

---
# Blue/Green

- Sin _downtime_
- Cambio de A a B
- Rollback inmediato

---
# Blue/Green

`vagrant up --provision-with microk8s`

---
# Blue/Green

Vamos a crear las imágenes de Docker necesarias primero:

- `sudo docker build -t myapp:v1 -f Dockerfile-myapp .`
- Modificamos `index.html` y:
- `sudo docker build -t myapp:v2 -f Dockerfile-myapp .`

---
# Blue/Green

**ATENCIÓN**: Este paso únicamente es por usar `microk8s`.

Vamos a copiarle las imágenes de docker a kubernetes para que las "encuentre".

```
sudo docker save myapp:v1 > myapp:v1.tar
sudo docker save myapp:v2 > myapp:v2.tar
microk8s.ctr import myapp:v1.tar
microk8s.ctr import myapp:v2.tar
```

---
# Blue/Green

Es hora de desplegar nuestra aplicación. Ahora vamos a deplegar la `v1` y la `v2` de forma simultanea, pero únicamente la `v1` recibe tráfico.

`microk8s.kubectl -n default apply -f myapp.yml`

Y luego exponerla mediante el balanceador:

`microk8s.kubectl apply -f lb.yml`

---
# Blue/Green

Tenemos `v1` recibiendo tráfico. Ahora es momento de cambiar a `v2`. Para ello:

- Editamos el `service` para decirle que ahora conecte a los `pods` de `v2`.
- `microk8s.kubectl edit service myapp`

```
  selector:
    app: myapp
    version: v1
```
Se convierte en:
```
  selector:
    app: myapp
    version: v2
```

---
![](https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2019/05/21/957237.jpg)
# Blue/Green

---
# Blue/Green
- Sin _downtime_
- Implementación sencilla.
- Requiere un segundo paso en el despliegue (hacer el cambio de versiones).

---
# Blue/Green

Ejercicio:

- Construir v3 y desplegarla.
- Ir alternando entre v1, 2 y 3
