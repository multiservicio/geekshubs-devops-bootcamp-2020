---
marp: true
---

# [fit] Desplegando
# [fit] Contenedores
---
# Pedro Díaz

SRE lead @ Mercadona Tech
@multiservicio86

![inline](https://storage.googleapis.com/mercadonatech/assets/img/teamimages/MercadonaOnlineTeam20200107-16.jpg)

---
# Agenda

- Día 1:
    - ¿Por qué contenedores?
    - Estrategias más comunes de despliegue.
        - Recreate
        - Rolling Update
        - Blue-Green / Red-Black / A/B
        - Shadow
        - Canary

---
# Agenda

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
