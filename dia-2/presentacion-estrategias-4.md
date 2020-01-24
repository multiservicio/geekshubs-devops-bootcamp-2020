autoscale: true
theme: pedro
# [fit] Estrategias
# [fit] De despliegue
---
![fit](https://media1.tenor.com/images/6c558a6366d2967e6de4ad294c3c4b7f/tenor.gif)
# Canary

---
![](https://www.tigera.io/wp-content/uploads/2018/12/canary-deployment-74d9ceb259a7b87beb0b5fc3af0e3788-e9535-1.png)

---
# Canary

- Sin _downtime_
- Nos permite probar con tráfico real la versión en un % del tráfico.
- Rollback inmediato.

---
# Canary

`vagrant up --provision-with microk8s`

---
# Canary

Vamos a crear las imágenes de Docker necesarias primero:

- `sudo docker build -t myapp:v1 -f Dockerfile-myapp .`
- Modificamos `index.html` y:
- `sudo docker build -t myapp:v2 -f Dockerfile-myapp .`

---
# Canary

**ATENCIÓN**: Este paso únicamente es por usar `microk8s`.

Vamos a copiarle las imágenes de docker a kubernetes para que las "encuentre".

```
sudo docker save myapp:v1 > myapp:v1.tar
sudo docker save myapp:v2 > myapp:v2.tar
microk8s.ctr import myapp:v1.tar
microk8s.ctr import myapp:v2.tar
```

---
# Canary

Tenemos ahora 3 réplicas de `v1` y 1 réplica de `v2`. Esto significa que:
- 75% del tráfico va a recibir `v1`
- 25% del tráfico va a recibir `v2`

---
# Canary

Para ver los pods que están en un `label`.

`microk8s.kubectl get pod -l app=myapp`

```
vagrant@ubuntu-bionic:~/canary$ microk8s.kubectl get pod -l app=myapp
NAME                        READY   STATUS    RESTARTS   AGE
myapp-v1-6d9ddff5c6-259dp   1/1     Running   0          3m1s
myapp-v1-6d9ddff5c6-btx74   1/1     Running   0          3m1s
myapp-v1-6d9ddff5c6-njndx   1/1     Running   0          3m1s
myapp-v2-6c45c99f45-f2w2k   1/1     Running   0          3m1s
```

---
# Canary
- `microk8s.kubectl get service myapp`
- `watch -d -n 1 'curl -s serviceIP'`

---
# Canary

Ahora podemos jugar con los % de cada una de las versiones.

- `microk8s.kubectl scale deployment myapp-v2 --replicas=2`
- `microk8s.kubectl scale deployment myapp-v1 --replicas=2`

Con estos cambios lo balanceamos 50/50

---
# Canary

Hasta finalmente:

- `microk8s.kubectl scale deployment myapp-v2 --replicas=4`
- `microk8s.kubectl scale deployment myapp-v1 --replicas=0`

---
![](https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2019/05/21/957237.jpg)
# Canary

---
# Canary
- Sin _downtime_
- Implementación más laboriosa.
- Requiere madurez en el equipo para hacerlo de forma eficiente y teniendo en cuenta feedback sobre la versión nueva.
    - Ratio de errores
    - Rendimiento
    - Latencias
    - ...
- Riesgo bajo y controlado frente a fallos.

---
# Canary

Ejercicio:

- Construir v3 y desplegarla.
