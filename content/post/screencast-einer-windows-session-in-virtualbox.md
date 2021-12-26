---
title: "Screencast einer Windows-Session in Virtualbox"
date: 2009-02-20
tags: ['helferlein', 'virtualbox']
slug: screencast-einer-windows-session-in-virtualbox
---
Screencasts von Windows-Sessions, die in einer Virtualbox-VM laufen,
sind dank vrdp und pyvnc2swf sehr einfach zu erstellen.

Ein Screencast ist so etwas wie ein animierter Screenshot und in manchen
Fällen einleuchtender als eine lange Kette von Schnappschüssen des
Bildschirms.

Das Tool [pyvnc2swf][] erstellt aus einer Vnc-Session ein Flashfilmchen.
Um nun ein Screencast von einem per [Virtualbox][] in ein Fenster
verbannten Windows zu erstellen, reicht es, in den Einstellungen der
virtuellen Maschine unter "Remote Display" das Häkchen bei "Enable VRDP
Server" zu setzen und die virtuelle Maschine zu starten. Jetzt braucht
es noch einen Vnc-Server (per `vncserver -geometry 800x600` einfach zu
starten) und sich per `vncviewer :1` mit dem Vncserver zu verbinden.
Unter Ubuntu startet die Vnc-Session ohne Fenstermanager aber mit einem
Terminal. (Um einen sehr schlanken Desktop in der Vnc-Session
hinzubekommen, empfiehlt sich das Paket [twm][]. Der Terminal ist aber
auch völlig ausreichend, um sich per `rdesktop -k de localhost` mit der
laufenden virtuellen Maschine zu verbinden.

Parallel dazu muß dann das Programm pyvnc2swf gestartet werden, es
bekommt als Parameter die Display-Nummer der Vnc-Session, also etwa so:
`pyvnc2swf :1`. Um die Aufnahme zu starten, muß man in der
übersichlichen Gui den Start-Knopf drücken und das Passwort der
Vnc-Session angeben. Danach kann man dann seine Vorführung auf dem
Windows-Desktop abspulen und hernach den Stop-Knopf drücken. Das
Ergebnis wird in zwei Dateien abgespeicher, einer Flash-Datei und einer
html-Datei, die den Flash-Film mit einer Pause-Taste ausstattet.

Das Ergebnis sieht dann [so aus][].

Das ganze setzt neben der ["Personal Use and Evaluation License"-Version
von Virtualbox][] (nur die beherrscht VRDP) noch [rdesktop][] und
[pyvnc2swf][1] aus den Universe-Repositories voraus.

  [pyvnc2swf]: http://www.unixuser.org/~euske/vnc2swf/
  [Virtualbox]: http://www.virtualbox.org/
  [twm]: http://packages.ubuntu.com/hardy/twm
  [so aus]: /static/favourites-screencast.html
  ["Personal Use and Evaluation License"-Version von Virtualbox]: http://www.virtualbox.org/wiki/VirtualBox_PUEL
  [rdesktop]: http://packages.ubuntu.com/hardy/rdesktop
  [1]: http://packages.ubuntu.com/hardy/graphics/pyvnc2swf
