---
title: "Testinstallation: Owncloud"
date: 2012-04-12
tags: ['owncloud', 'php-fpm', 'nginx']
slug: testinstallation-owncloud
---
Ich habe - angeregt durch die Jubelmeldungen über [owncloud][] - eine
Testinstanz von "Your Cloud, Your Data, Your Way!" aufgesetzt. OC
kombiniert einen Webdav-Server, mit dem man die Dateien in die
Dateimanager moderner Betriebssysteme einbinden kann mit einem
Kalender/Caldav-Server und einem Addressbuch/carddav-Server. Die
Standards caldav und carddav werden z. B. von Apples iOS unterstützt, so
dass man in der eigenen Wolke seine Kalenderdaten und Kontakte speichern
kann, ohne dass Google oder die anderen üblichen Verdächtigen nen
schnellen Euro mit der Zweit- und Drittverwertung der persönlichen Daten
machen können.

Das ist soweit ja ganz schnuckelig, leider ist das Ganze in Php
geschrieben (apropos: [hier][] gibt es ein schönes Php-Bashing), um es
mit Nginx zum Laufen zu kriegen, braucht es einen Fcgi-Server, der den
Php-Matsch ausführt, unter Ubuntu gibt es dafür [php-fpm][].

Die iOS-Clients finden die Caldav- und Carddav-Server für eine bestimmte
Domäne per DNS-Request (Details dazu gibt es [hier][1]).  Ist der Server
einmal lokalisiert, sucht iOS nach well-known-Resourcen gemäss
[RFC5785][].

Da diese nicht in der Owncoud-Applikation abgebildet werden, empfiehlt
sich ein Redirect:


    rewrite ^/.well-known/host-meta /public.php?service=host-meta last;rewrite ^/.well-known/host-meta.json /public.php?service=host-meta-json last;
	rewrite ^/.well-known/carddav /remote.php/carddav/ redirect;rewrite ^/.well-known/caldav /remote.php/caldav/ redirect;rewrite ^(/core/doc/[^\/]+/)$ $1/index.html;

Das reicht aber immer noch nicht, um das MacOS-Addressbuch glücklich zu
machen, hier bedarf es eines weiteren Redirects:


    rewrite /apps/contacts/carddav.php/addressbooks/(.+)/addressbook/ /apps/contacts/carddav.php/addressbooks/$1/default permanent;

Das funktioniert natürlich nur, wenn der Kalender auch `default` heisst,
ist das nicht der Fall, klappt es nicht mehr. Diese Probleme sind wohl
in der Lion-Version des MacOS-Adressbuches behoben.


**Edit:** Synchronisation mit Thunderbird klappt auch, der Kalender
braucht das [Lightning-Plugin][] und das Addressbuch kann man mit Hilfe
des [Sogo-Konnektors][] und des Plugins "[More Functions for
Addressbook][]" syncen, klappt erstaunlich schmerzfrei.


**Edit**: Nach dem Update auf Lion klappt das Caldav-Discovery
tatsächlich problemlos.


  [owncloud]: http://owncloud.org
  [hier]: http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/
  [php-fpm]: http://packages.ubuntu.com/oneiric/php5-fpm
  [1]: http://andrew.mcmillan.net.nz/blog/srv_records_with_dnsmasq
  [RFC5785]: http://tools.ietf.org/html/rfc5785.html
  [Lightning-Plugin]: https://addons.mozilla.org/thunderbird/2313/
  [Sogo-Konnektors]: http://www.sogo.nu/files/downloads/extensions/sogo-connector-10.0.1.xpi
  [More Functions for Addressbook]: https://nic-nac-project.org/~kaosmos/morecols-en.html
