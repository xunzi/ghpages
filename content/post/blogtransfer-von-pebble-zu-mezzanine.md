---
title: "Blogtransfer von Pebble zu Mezzanine"
date: 2013-05-13
tags: ['mezzanine', ' web', ' pebble']
slug: blogtransfer-von-pebble-zu-mezzanine
---
Die Umsetzung der alten Blogposts aus Pebble erfolgte mit Hilfe eines
Skripts, das die xml-Dateien parst und entsprechende
Mezzanine/Django-Objeckte anlegt inkl. Tags und Kategorien.

Das Skript gibt es als [Gist][] bei Github.

<!--more-->

Um wenigstens die Syndication-Clients nicht zu verschrecken, schubsen
die folgenden Rewrite-Regeln in der Nginx-Konfig die Requests zu den
alten Rss- und Atom-Feeds auf die neuen Resourcen weiter:


`rewrite ^/pebble/atom.xml$ /blog/feeds/atom/ break;rewrite ^/pebble/tags/(.+)/(.+).xml$ /blog/tag/$1/feeds/$2/ break;`


Alle anderen Requests zu den alten Pebble-Urls werden einfach auf die
Blogübersicht weitergeleitet:  
  

`rewrite ^/pebble/.*     /blog/ permanent;`


  [Gist]: https://gist.github.com/xunzi/5603984
