---
title: "KVM zu LXD"
date: 2018-10-07
tags: ['kvm', 'rootserver', 'lxd']
slug: kvm-zu-lxd
---

Alle vier Jahre migrieren wir den Hetzner-Server auf neue Hardware,
bei der letzten Umstellung haben wir auch gleich den Unterbau
geändert, wo früher die individuellen Gäste als kvm/libvirt-Gäste
liefen und die Infrastruktur (Datenbanken, Verzeichnisdienst, Email)
auf dem Host, sind jetzt alle Funktionen in [Lxd][]-Container
ausgelagert.

Lxd-Container stellen sich wie ein vollwertiges Betriebssystem dar,
mir persönlich sind Docker-Container zu friemelig, der Unix-Admin in
mir stört sich einfach daran, dass man bei Docker nicht so einfach mit
der Shell rumporkeln kann, bis es geht. Ich sehe Docker und rkt eher
als fortgeschrittenes Delivery-Format, während für unseren Rootserver
eher leichtgewichtige VM-ähnliche Konstrukte passend sind.

Ich habe angefangen, Links und Beispielbefehle zu Lxd auf [Github] zu sammeln.


  [Lxd]: https://linuxcontainers.org/lxd/introduction/
  [Github]: https://github.com/xunzi/lxd-documents
