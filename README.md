# Geekshub DevOps Bootcamp VLC2020
----

## Unidad - Desplegando contenedores

```
Fecha: 23-24 Enero 2020
Profesor: Pedro Díaz
```


## Introducción a la unidad.

En esta unidad vamos a trabajar sobre el tema `desplegando contenedores`. Para ello se ha dividio en dos sesiones de 5 horas cada una. En cada uno de los días veremos:

- Día 1:
    - ¿Por qué contenedores?
    - Estrategias más comunes de despliegue.
        - Recreate
        - Rolling Update
        - Blue-Green / Red-Black / A/B
        - Shadow
        - Canary

- Día 2:
    - Técnologías más comunes para desplegar contenedores.
        - Manual, `docker run`
        - Manual, `docker-compose`
        - Automática, `ansible`/`chef`/`puppet`/`saltstack`/etc..
        - Automática, `docker swarm`
        - Automática, `kubernetes`
        - Otras
    - Integrando el despliegue en el _DevOps pipeline_ (Continous Deployment)
        - Manual, `via script`
        - Automático, `Jenkinsfile`

## Material necesario

Para estas sesiones vamos a utilizar muchas tecnologias diferentes. Para agilizar trataremos de automatizar al máximo las partes que quedan fuera del ámbito de la unidad. Para ello usaremos:

> Sería muy recomendable que trajerais preinstalado todo.

- VirtualBox
- Vagrant
    - Usaremos Ubuntu 18.04 LTS como OS base, `vagrant box add ubuntu/bionic64`
-

----

Pedro Díaz - Vlc 2020
