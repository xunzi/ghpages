---
title: "Einbruch!"
date: 2010-09-19
tags: ['web', 'rootserver', 'security']
slug: einbruch
---
Einbruch in unseren schönen Server! Spam- und Virusmails ham se
verschickt, die Schmutzbuckel.

Aufgefallen ist das Ganze dadurch, daß Postfix immer versucht hat, Mails
an den Webserver-User zuzustellen. Ich habe mir die Mails dann mal
weiterleiten lassen und hatte in ein paar Sekunden weit über 500 neue
Emails, alles Bounces von Aol und Yahoo, die mich darüber informieren
wollten, daß meine Mails nicht zugestellt werden konnten. In der
Mailqueue waren auch noch ein paar Dutzend Mails, denen die Mxe von
Yahoo die Annahme verweigerten. Sehr verdächtig! Die gebouncten Mails
machten Werbung für potenzsteigernde Mittel und enthielten wohl auch
Viren.

Der Einbruch erfolgte über eine nicht gepatchte Webapplikation, hier
fanden sich dann in einem Cache-Verzeichnis ein paar Php-Dateien, namens
admin.php, cache.php (die sind nach dem Dateidatum zusammen dort
gelandet), cached.php (zwei Tage später hochgeladen) und sendme.php
(hierüber sind die Spammails hochgeladen worden). Admin.php ist ein
[Webinterface][], mit dem man verschiedene interessante Sachen machen
kann. Cache.php und cached.php ermöglichen es, einen Irc-Server
aufzumachen.

Die Zahl der Müllmails liegt bei etwa 20000, das hat schon gereicht, um
auf die Blackliste von Barracuda zu kommen (die haben den Eintrag aber
auf Nachfrage sehr schnell wieder gelöscht).

Insgesamt eine sehr ärgerliche Geschichte, die wohl auch noch
unangenehmer hätte ausgehen können.


Die Datei admin.php hat die Checksumme 20ed027c0d6d6798b3ec03fb8ef42756,
falls mal einer vergleichen will.

Als Gegenmaßnahme habe ich dem Webserver-User die Shell gegen /bin/false
ausgetauscht (das hätte ich schon längst machen sollen) und einen Bcc
für alle Mails eingerichtet, die der Webserver-User schickt. Das geht
mit folgendem Eintrag in /etc/postfix/main.cf:

```sender_bcc_maps = hash:/etc/postfix/sender_bcc```


In dieser Datei stehen Absenderadressen und die dazugehörigen
bcc-Adressen. Das Ganze muß noch per postmap /etc/postfix/sender\_bcc in
eine Hashmap umgewandelt werden, dann wird für jede Mail, die
www-data@minden144.server4you.de eine Blindkopie an eine andere Andresse
geschickt.


[Webinterface]: /static/w4ck1ng.png
