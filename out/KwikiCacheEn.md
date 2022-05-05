1.  1.  -\*- dok: [KwikiCache](KwikiCache "wikilink"); lang: en; coding:
        iso-8859-1; mode: fundamental; -\*-
    2.  datum: 2005-07-07

# Automatic Caching of hot Kwiki Pages {#automatic_caching_of_hot_kwiki_pages}

-\> \[ [ Kwiki](KwikiEn "wikilink") \| [ ADP](PolisEn "wikilink") \| [
FFII Project News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

*7th July 2004 by phm \-- FFII needs a system for automatically caching
the kwiki news items that go into the RSS stream and are likely to
attract attention.*

We need a script that parses either the news page
[SwpatcninoEn](SwpatcninoEn "wikilink")
[SwpatcninoDe](SwpatcninoDe "wikilink") etc themselves or or the [latest
RSS wiki newsstreams generated
therefrom](http://www.ffii.org/news/rss/SwpatcninoEn-ffii.rss "wikilink")
and assures that the news pages therein are cached.

For that, it needs to write to the files /var/www/kwiki/pages.lst and
/etc/apache-ssl/vhost.conf.

Search for \"SwpatcninoEn\" in the latter file and you\'ll see a rewrite
rule for all the caching pages. That rule should contain the 20 most
recent news items, and pages.lst also should contain them.

This script can save our server a lot of load.
