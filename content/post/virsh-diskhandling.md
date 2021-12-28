---
title: "Virsh disk handling"
date: 2018-07-02
tags: ['virsh', 'blockdevice', 'qemu-img']
slug: virsh-disk-handling
---
Wenn die qemu/kvm-Platten vollaufen, kann man relativ einfach eine neue Platte erzeugen und mounten. Das ist in vielen Fällen weniger kritisch, als existierende Diskimages, Partitionen und Dateisysteme zu vergrößern.

<!--more-->

  * Neue Platte erzeugen

Eine neues Diskimage (im qcow2-Format, siehe [Diskussion][] zu den Unterschieden der beiden Formate, qcow2 ist angeblich langsamer, bietet aber Snapshots) kann man folgendrmaßen erstellen:


````shell
[0]next:{1026}~% export format="qcow2"
[0]next:{1026}~% export your_vm_name="somename"
[0]next:{1026}~% qemu-img create -f $format $your_vm_name-128G.qcow2 128G
````

Für Images im Raw-Format einfach die erste Zeile so umschreiben:
````shell
[0]next:{1026}~% export format="raw"
````

  * Diskimage an VM anhängen

````shell
[0]next:{1026}~% virsh attach-disk $your_vm_name $your_vm_name-128G.qcow2 vdb --current
````

  [Diskussion]: https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Virtualization/3.5/html/Technical_Guide/QCOW2.html
