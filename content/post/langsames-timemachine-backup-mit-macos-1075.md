---
title: "Langsames TimeMachine-Backup mit MacOS 10.7.5"
date: 2012-10-03
tags: ['macos', 'spotlight', 'backup']
slug: langsames-timemachine-backup-mit-macos-1075
---
Seit ein paar Tagen läuft das TimeMachine Backup auf dem Synology-NAS
grottenlangsam. Ich habe verschiedene Dinge ausprobiert (neues Share
anlegen, Indexdateien von Spotlight löschen, Indizierung für TM-Share
ausschalten), alles ohne Erfolg. Schliesslich hat mich Google auf diesen
[Thread][] geführt, wo der Spotlight-Indexer als Schuldiger benannt
wird. Tatsächlich rennt das Backup wieder, wenn man per

`sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist`

den Indexer stoppt.

Nach erfolgreichem Backup sollte man dann auch mit

`sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist`

den Indexer wieder starten, eventuell dann auch in der Zeit, in der der
Index neu aufgebaut wird, die automatischen Backups abstellen.

**Edit:** Apple hat ein Update für das Problem ausgerollt, das das
Problem behoben zu haben scheint, Spotlight und TM schnurren jetzt
wieder nebeneinander her.


  [Thread]: https://discussions.apple.com/thread/4324046?start=60&tstart=0
