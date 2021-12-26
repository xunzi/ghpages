---
title: "Upgrade auf Lenny und Umstellung auf Dovecot"
date: 2009-07-12
tags: ['rootserver', 'debian', 'dovecot']
slug: upgrade-auf-lenny-und-umstellung-auf-dovecot
---
Gestern habe ich mir ein Herz gefasst und den Server auf Lenny
aktualisiert. Der erste Lauf von *aptitude dist-upgrade* förderte 7
unauflösbare Konflikte zu Tage, aber nach dem Entfernen von libsasl2 und
libapache2-mod-php5 ging es dann reibungslos. Nach dem reboot (immer ein
spannender Moment bis die Pings wieder zurückkommen) ging dann fast
alles wieder wie gewohnt bis auf Postfix und den Tomcat-Mount per ajp.
Postfix mochte keine Benutzer mehr authentifizieren, wohl ein Problem
mit Sasl und Passworten im Klartext (die ich in Syscp ausgeschaltet
habe). Die einfachste Lösung hierfür war, Courier durch Dovecot zu
ersetzen und Postfix gegen Dovecot authentifizieren zu lassen, was dank
der exzellenten Doku von Dovecot sehr einfach war.  

Der fehlende Tomcat-Mount  lag daran, daß der Mountpoint in die
Definition des Virtual Host verschoben werden muß.
