1.  1.  -\*- dok: [ParsKwikipag](ParsKwikipag "wikilink"); lang: en;
        coding: iso-8859-1; mode: fundamental; -\*-
    2.  keyws: FFII, computing, kwiki, hypertext, metadata,
        administration, script

# parskwikipag: Provide Metadata for an FFII Kwiki Page {#parskwikipag_provide_metadata_for_an_ffii_kwiki_page}

\--\> \[ [ metadata](DokDataEn "wikilink") \| [
kwiki](KwikiEn "wikilink") \| [kwiki mailing
list](http://lists.ffii.org/mailman/listinfo/kwiki-parl/ "wikilink") \|
[ genba](GenbaEn "wikilink") \| [ ffii computing](PolisEn "wikilink") \|
[ project news](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

This Perl script scans a page from kwiki.ffii.org, as stored in
\$kwikidir/database/\$node, extracts metadata and writes these to the
corresponding metadata file under \$kwikidir/nodebase/\$node.n according
to a syntax which makes these metadata appear in the HTML header of the
kwiki page, with help of adapted display routines in
\$kwikidir/locallib/Mwlib/{Display.pm,!FfiiNodes.pm}. As a result, we
get better structured pages of which all kinds of search robots can make
more sense. Below we explain how it works and how you must write kwiki
pages in order to take full advantage of this mechanism.

## News & Chronology {#news_chronology}

-   2004-12-12 [ phm](HartmutPilchEn "wikilink") can\'t wait any longer,
    creates the script inmidst of other urgent tasks
-   2004-00-00 phm creates various kwiki pages and tools for improvement
    of document structures and metadata, repeatedly calls on mwas and
    others to build this functionality into kwiki.ffii.org.

## Concerned scripts {#concerned_scripts}

Conformant kwiki pages are equipped with full-fledge HTML headers once
an hour through the cronjob of user knecht which invokes hourly.knecht.
By reading through these scripts, you get the full documentation. Read
the sections below, ask kwiki-help and subscribe to the [ffii kwiki
mailing
list](http://lists.ffii.org/mailman/listinfo/kwiki-parl/ "wikilink") to
get maximal information.

-   \$admbindir/parswikipag
-   \$admbindir/parswikipags
-   \$admbindir/hourly.knecht
-   \$kwikidir/local/template/\_header.html
-   \$kwikidir/locallib/Mwlib/Display.pm
-   \$kwikidir/locallib/Mwlib/FfiiNodes.pm
-   \$kwikidir = /var/www/cgi-bin/kwikimj04
-   \$admbindir = /var/www/adm/bin

## Supported Syntax {#supported_syntax}

A Kwiki page should typically have the following syntax:

` # -*- dok: `[`ParsKwikipag`](ParsKwikipag "wikilink")`; lang: en; coding: iso-8859-1; mode: fundamental; -*-`\
` # keyws: FFII, computing, kwiki, hypertext, metadata, administration, script`\
` = parskwikipag: Provide Metadata for an FFII Kwiki Page`\
` -->`\
` [ `[` ``metadata`](DokDataEn "wikilink")\
` | `[` ``kwiki`](KwikiEn "wikilink")\
` | [...]`\
` ]`\
` ------------`

` This Perl script scans a page from kwiki.ffii.org, as stored in $kwikidir/database/$node, extracts metadata and writes these to the corresponding metadata file under $kwikidir/nodebase/$node.n according to ...`

` [...]`

We explain one by one.

### Metadata in the 1st line {#metadata_in_the_1st_line}

The first line should contain something like

` # -*- dok: `[`ParsKwikipag`](ParsKwikipag "wikilink")`; lang: en; coding: iso-8859-1; mode: fundamental; -*-`

The notation is used also by Emacs for setting document metadata.

Here the first three items (dok, lang, coding) are required, the rest
(mode, \...) is optional and currently ignored.

\'dok\' is the document identifier without the language suffix. This
identifier is often but not always identical to the wiki page name
without language suffix. Some examples where it is not identical:

`   EubsaProgEn  --> dok: eubsa-prog; lang: en`\
`   SwpatcninoEn --> dok: swpatcnino; lang: en`

Such divergences occur mainly in old document names that existed in the
mlht system of <http://swpat.ffii.org> before kwiki was used.

\'lang\' is the language of the document. \'coding\' is the ISO name of
the coding system. As of 2004-12-12, kwiki only supports \'iso-8859-1\'.
Newer versions support \'utf-8\' and we must install one soon.

### Metadata after the 1st line {#metadata_after_the_1st_line}

Using the notation

` # keyws: FFII, computing, kwiki, hypertext, metadata, administration, script`

keywords and other useful items (including \'title\' and \'descr\' ) can
be supplied. These items are not seen by the reader but appear in the
HTML header.

Explicit Metatags specified here override the implicit metatags that are
gathered from the text.

### Document Title {#document_title}

The title

` = parskwikipag: Provide Metadata for an FFII Kwiki Page`

is seen by the user and also, as an implicit metatag, used in the HTML
header, provided there is no explicit metatag of the same meaning.

### Top Links Section {#top_links_section}

The links in the top section have the form

` --> `\
` [ [.......]`\
` | [.......]`\
` ]`\
` --------------`

This form must be adhered to.

In particular the links sectio must be closed by \'\-\-\-\-\-\--\' (5 or
more hyphens).

The links themselves are currently not used for metatags but may be in
the future.

### Description

After the links section, there is a one-line paragraph that is used for
the description metatag, unless an explicit \'\# descr: \...\' metatag
was found at the top.

This description paragraph must not contain any links or other special
markup characters. It may contain the kwiki-specific \'!\' escape
characters.

The description paragraph can be preceded by blank lines or lines that
contain nothing but an URL (used for an image).

After the description paragraph, there are no more implicit metadata and
the parsing stops. But it is advisable to let the description be
immediately be followed by a second-level heading, such as

` == News & Chronology`

and to use some standardised forms for such headings and sections. In
the future, further scripts may be looking for implicit markup in these
sections as well.
