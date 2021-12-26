---
title: "Konsolenhelfer (1): dstat"
date: 2008-07-05
tags: ['helferlein', 'dstat']
slug: konsolenhelfer-1-dstat
---
Auf der Suche nach Performance-Engpässen ist es öfter notwendig, die
Ausgaben der Kommandos `vmstat`, `iostat` und `nfsstat` miteinander zu
vergleichen. Einfacher als drei Terminalfenster mit den jeweiligen
Kommandos ist das Tool `dstat`, das zusätzlich noch eine
augenfreundlich kolorierte Ausgabe erzeugt. `Dstat` von [Dag Wieers]. `dstat` misst eine konfigurierbare Auswahl von
Betriebssystem-Parametern und zeigt sie kontinuierlich an. Wird `dstat`
ohne weitere Parameter aufgerufen, zeigt es Statistiken zu Cpu, Blockdevice, Netzwerk, Paging und System (Context switches und Interrupts) an:
![dstat screenshot](/static/dstat.png "dtstat screenshot")


`Dstat` ist durch Plugins erweiterbar, eine Liste der verfügbaren
Plugins gibt das Kommando `dstat -M list`.  
So ist es zum Beispiel möglich, zusätzlich zu den erwähnten
Default-Statistiken den "most expensive"-Pozeß anzeigen zu lassen,
gemessen in Hundertstel-Sekunden, die der Prozess im user-Mode und im
Kernel-Mode verbracht hat (siehe `man 5 proc`).
Außerdem ist dstat in Python geschrieben, so dass es sehr einfach ist,
neue Plugins zu schreiben.


  [Dag Wieers]: http://dag.wieers.com/home-made/dstat/
  


