---
title: "Neuer Jabber-Server"
date: 2009-07-13
tags: ['jabber', 'prosody', 'rootserver']
slug: neuer-jabber-server
---
Im Zuge der [Server-Renovierung][] habe ich auch den Jabberserver von
[Openfire][]auf [Prosody][] umgestellt.

Prosody ist sehr klein und braucht nur sehr wenige Resourcen. Außerdem
ist es sehr sehr einfach aufzusetzen (obwohl Openfire mit der
Weboberfläche da auch recht simpel ist). Was noch fehlt sind die
Gateway-Plugins zu anderen IM-Systemen, mit denen man einen
Jabber-Account beispielsweise mit einem MSN-Account verknüpfen kann,
aber das ist mir momentan nicht so wichtig. Zum Ausgleich ist Prosody
Virtualhost-fähig und in Lua geschrieben, eine Sprache, die ich mir
sowieso immer schon mal ansehen wollte.

  [Server-Renovierung]: http://www.drexler-online.net/pebble/2009/07/12/upgrade_auf_lenny_und_umstellung_auf_dovecot.html
  [Openfire]: http://www.igniterealtime.org/projects/openfire/index.jsp
  [Prosody]: http://prosody.im/
