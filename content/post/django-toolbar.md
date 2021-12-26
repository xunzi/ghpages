---
title: "Django-Toolbar"
date: 2010-06-24
tags: ['django', 'helferlein', 'web']
slug: django-toolbar
---
Bei meinen Experimenten mit [Django][] ist mir letztlich die
[Django-Toolbar] unter die Finger gekommen. Hierbei handelt es sich um
eine Django-Middleware, die zusätzlich zu der normalen Ausgabe ein
Overlay erzeugt, dem man so interessante Details wie die Http-Header des
aktuellen Requests oder die SQL-Queries, die für den aktuellen Request
ausgeführt wurden. Das ist schon cool, fast noch cooler ist, daß
Django mittlerweile sehr gut und vollständig in [Ubuntu] verfügbar
ist (und auch die Toolbar ein aptitude install
python-django-debug-toolbar entfernt ist). [So] sieht das Ganze in
Aktion aus.


  [Django]: http://www.djangoproject.com/
  [Django-Toolbar]: http://rob.cogit8.org/blog/2008/Sep/19/introducing-django-debug-toolbar/
  [Ubuntu]: http://packages.ubuntu.com/lucid/python-django
  [So]: /static/screenshot-django-toolbar.png
