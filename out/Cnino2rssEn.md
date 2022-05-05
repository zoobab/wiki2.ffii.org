1.  1.  -\*- dok: cnino2rss; lang: en; coding: iso-8859-1; mode:
        fundamental; -\*-

# cnino2rss: a Perl script that generates RSS newsfeeds from ffii kwiki pages {#cnino2rss_a_perl_script_that_generates_rss_newsfeeds_from_ffii_kwiki_pages}

\--\> \[ [ FFII RSS](FfiiRssEn "wikilink") \|
[Newsfeeds](http://www.ffii.org/news/rss/ "wikilink") \]

------------------------------------------------------------------------

How to invoke and extend cnino2rss, a script that produces RSS newsfeeds
from certain pages on the kwiki.ffii.org website.

## News & Chronology {#news_chronology}

-   2004-10-29 dietvu provides version 0.01 of [
    cnino2rss](Cnino2rssEn "wikilink"), the script that immediately
    starts producing [FFII RSS
    newsfeeds](http://www.ffii.org/news/rss/ "wikilink"). mond and phm
    add some refinements, phm produced initial documentation.

## How to invoke the script {#how_to_invoke_the_script}

It is found on [ genba](GenbaEn "wikilink") in the directory
*var/www/adm/bin*.

It is normally invoked with the name of the kwiki page (e.g.
\'SwpatcninoEn\') as its only paramter. However it can take several
others for purposes of flexibility. To be documented.

The script usualy does not need to be invoked manually. Instead it is
invoked through the cronjob of the user \'knecht\' every hour. The
cronjob is found at /var/www/adm/bin/hourly.knecht.

## How to extend the script {#how_to_extend_the_script}

-   cvs.ffii.org:/var/cvs/mlht/prg/cnino2rss

You need access to the [ FFII CVS](CvsadmEn "wikilink") system.

## Where to ask further questions {#where_to_ask_further_questions}

Contact org ffii users dietvu or phm or webstyl-parl

## To Do {#to_do}

-   install XML::RSS, Date::Parse, LWP::!UserAgent on [
    genba](GenbaEn "wikilink") \-- last time phm tried with \'cpan\',
    XML::RSS didn\'t build correctly
-   write a kwiki extension that uses the [ kwiki document metabase
    files](KwikiDokDataEn "wikilink") for generating informative html
    headers (for use by Googel et al). Pester mwas to do this ASAP.
-   Use Perl modules such as XML::RSS, Date::Parse, LWP::!UserAgent etc
    to make cnino2rss more elegant and extensible
-   create newsfeeds for different versions of RSS
-   write a script that parses kwiki files, identifies document
    metadata, writes them into the [ ffii database](MlhtDbEn "wikilink")
    and, when needed, rewrites the [ kwiki document metadata
    files](KwikiDokDataEn "wikilink")
-   create some parser/rss-generator scripts for websites on which FFII
    swpat news production depends, e.g. EPO
    -   -   Try to coordinate this with gilles\'s [
            [UrlWatch](UrlWatch "wikilink")
            project](UrlWatchEn "wikilink") if possible.
-   Give different feeds different titles

## Perl RSS Ressources {#perl_rss_ressources}

-   [RSS-USPTO: an RSS script for the USPTO
    website](http://varchars.com/sw/rss-uspto.pl "wikilink")
-   [XML::RSS
    documentation](http://search.cpan.org/~kellan/XML-RSS-1.02/lib/RSS.pm "wikilink")
