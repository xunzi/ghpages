---
title: "Snmp unter Ubuntu"
date: 2011-06-19
tags: ['snmp', 'ubuntu']
slug: snmp-unter-ubuntu
---
Falls mal jemand unter Ubuntu die net-snmp-Utilities (snmpwalk etc.)
einsetzen will, ist zu beachten, daß zusätzlich zm Paket *snmp* auch
noch *snmp-mibs-downloader* installiert werden muss, dann werden die
MIBs automatisch heruntergaladen und integriert. Zusätzlich muß noch in
der Datei /etc/snmp/snmp.conf die Zeile mibs : auskommentiert werden.
Grund für das Gehmpel sind wohl Lizenzprobleme, die die Auslieferung der
MIBs seit [Ubuntu 10.4 als Teil der Distribution verhindern][].



  [Ubuntu 10.4 als Teil der Distribution verhindern]: http://www.m8in.de/?p=427
