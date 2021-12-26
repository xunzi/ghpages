---
title: "Apache raus, Nginx rein"
date: 2012-07-02
tags: ['apache', 'php-fpm', 'nginx']
slug: apache-raus-nginx-rein
---

Anlässlich des Upgrades auf Ubuntu Precise habe ich den Webserver
umgestellt von Apache auf Nginx. Für das ungeliebte Php muss dann
[php-fpm.org/][] mit ins Boot, der Java-Appserver wird per Proxy
angebunden, da Nginx kein AJP spricht. Auf dem kleinen Webserver
performt das Ganze ganz gut und hat den Vorteil, dass die Nginx-Konfig
deutlich einfacher und überschaubarer ist.

</p>

Erst dachte ich, die openJDK-Version im Lieferumfang von Precise hätte
ne massive Macke, weil der Tomcat-Prozess munter alle verfügbaren
Cpu-Zyklen aufgebraucht hat, es stellte sich dann aber heraus, dass die
[Schaltsekunde][] schuld war und ein dezenter Reboot die schnellste
Abhilfe brachte.

</p>

**[EDIT]** Einen anständigen Performance-Schub für die Auslieferung von
Bildern bringt es, die Parameter `fastcgi_max_temp_file_size` auf 0 und
`proxy_buffering` auf off  zu setzen, sonst werden grössere Dateien wie
Photos oder Mp3-Dateien erst auf die Platte gepuffert und dann von Nginx
ausgeliefert, da kommt es dann schon mal zu unschönen Verzögerungen.

</p>

  [php-fpm.org/]: http://php-fpm.org/
  [Schaltsekunde]: http://www.heise.de/newsticker/meldung/Schaltsekunde-Linux-kann-einfrieren-1629683.html
