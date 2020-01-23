autoscale: true
# [fit] Desplegando
# [fit] Contenedores
---
# Pedro Díaz

SRE lead @ Mercadona Tech
@multiservicio86

![inline](https://storage.googleapis.com/mercadonatech/assets/img/teamimages/MercadonaOnlineTeam20200107-16.jpg)

---
# Contenido
- ¿Por qué contenedores?
- Estrategias más comunes de despliegue.
    - Recreate
    - Rolling Update
    - Blue-Green / Red-Black / A/B
    - Shadow
    - Canary
- Técnologías más comunes para desplegar contenedores.
    - Kubernetes
- Integrando el despliegue en el _DevOps pipeline_ (Continous Deployment)

---
# Cómo

Por cada una de las estrategias que veamos veremos y haremos algunas de ellas:
- Manual, `docker run`
- Manual, `docker-compose`
- Automática, `ansible`/`chef`/`puppet`/`saltstack`/etc..
- Automática, `docker swarm`, `kubernetes`

---
# Agenda

- Día 1:
    - Introducción al bloque y presentaciones.
    - ¿Por qué contenedores?
    - Estrategias más comunes de despliegue.
        - Recreate
        - Rolling Update
        - Blue-Green / Red-Black / A/B

---
# Agenda

- Día 2:
    - Estrategias más comunes de despliegue.
        - Shadow
        - Canary
    - Integrando el despliegue en el _DevOps pipeline_ (Continous Deployment)
        - Manual, `via script`
        - Automático, `Jenkinsfile`
    - Recapitulación

---
# ¿Por qué contenedores?

---
# 2020, dah!

---
# ¿Por qué contenedores?

El estandar actual es `Docker`. Aunque existen otras alternativas:

- [LXC](https://linuxcontainers.org)
- [RKT](https://coreos.com/rkt/)

---
# ¿Por qué contenedores?

> Containers offer a logical packaging mechanism in which applications can be abstracted from the environment in which they actually run. This decoupling allows container-based applications to be deployed easily and consistently, regardless of whether the target environment is a private data center, the public cloud, or even a developer’s personal laptop.

-- Google

---
# ¿Por qué contenedores?

- Encapsulado de la aplicación junto a sus dependencias.
- Seguridad.
- Inmutabilidad.

---
![](https://youtu.be/II4PFe9BbmE)

---
# ¿Por qué contenedores?
Pero, ¿se puede hacer DevOps sin contenedores?

##Sí!

---
# ¿Por qué contenedores?

Ahora, con la irrupción de los contenedores es más sencillo que nunca crear un _pipeline_ de desarrollo que permita prácticas más modernas como las que normalmente se utilizan en cultura de equipos DevOps.

<br/>
`Code -> Build -> Test -> Deploy St -> Deploy Pr`

---
# ¿Por qué contenedores?

`docker run postgres`
`docker run python`
`docker run nginx`
...

---
# ¿Qué necesitamos?

Para el curso necesitaremos:

- VirtualBox
- Vagrant
    - Usaremos Ubuntu 18.04 LTS como OS base, `vagrant box add ubuntu/bionic64`


Según avancemos iremos instalando más cosas.

---
# Estoy listo?

`vagrant up
