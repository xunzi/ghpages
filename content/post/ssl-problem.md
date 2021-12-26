---
title: "SSL-Problem"
date: 2008-06-09
tags: ['ssl', 'apache']
slug: ssl-problem
---
Ein Verweis auf die Zertifikatskette (certificate chain) läßt
https-Verbindungen von IE oder Opera zu Apache scheitern. Geholfen bei
der Fehlersuche haben openssl und [google.][] Das [erwähnte][] Problem
mit SSL-Verbindungen von IE7 und Opera unter WIndows hat sich nun auch
gelöst: Schuld war ein Eintrag in einer Apache-Konfigurationsdatei, der
auf die Zertifikatskette verweist:   
	`SSLCertificateChainFile /etc/ssl/certs/ca-certificates.crt`  
Auch wenn in weiteren Direktiven die Überprüfung von
Client-Zertifikaten explizit abgeschaltet ist, versucht Apache dennoch,
ein Client-Zertifikat anzufordern.  
Das sieht beim Debugging mit openssl dann so aus:  

	[0]xpc:~% openssl s_client -connect hostname.domainname.tld:443 CONNECTED(00000003) 8634:error:1408E098:SSL routines:SSL3_GET_MESSAGE:excessive message size:s3_both.c:449:

Unter Firefox hat es wunderbar funktioniert, weil ich da tatsächlich ein
Client-Zertifikat installiert habe.

  [google.]: http://www.google.de
  [erwähnte]: http://www.drexler-online.net/blog/serverkonfiguration/
