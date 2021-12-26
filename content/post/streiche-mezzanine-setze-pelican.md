---
title: "Streiche Mezzanine, setze Pelican"
date: 2013-11-30
tags: ['web', 'rootserver', 'mezzanine', 'pelican']
slug: streiche-mezzanine-setze-pelican
---
Da [Mezzanines]({filename}blogtransfer-von-pebble-zu-mezzanine.md)
Funktionsumfang für meine bescheidenen Bedürfnisse doch zu groß war,
habe ich das Blog auf [Pelican] umgestellt, einen Generator für
statische Webseiten. Denn Text kann man in [reStructuredText] oder
[Markdown] verfassen und es gibt eine große Auswahl an [Themes] und
[Plugins], so dass bei Bedarf das Aussehen des Blogs schnell mal
umgestellt werden kann. Ein weiterer Vorteil ist, dass die Inhalte
dann einfach unter Versionskontrolle gestellt werden können, es sind
ja nur Textdateien.

Praktischerweise kann Pelican auch von einem Rss-Feed [importieren],
so dass der erneute Transfer des Inhalts schnell und schmerzfrei über
die Bühne ging.


[Pelican]:  http://getpelican.com/
[reStructuredText]: http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html
[Markdown]: http://daringfireball.net/projects/markdown/
[Themes]: https://github.com/getpelican/pelican-themes
[Plugins]: https://github.com/getpelican/pelican-plugins
[importieren]: http://docs.getpelican.com/en/3.3.0/importer.html
