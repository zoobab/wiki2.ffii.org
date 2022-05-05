# Registering language-specific document information in database table TRAPROP {#registering_language_specific_document_information_in_database_table_traprop}

\--\> \[ [ MLHT](MlhtEn "wikilink") \| [ MLHT
database](MlhtDbEn "wikilink") \| [ Translation
Managment](SwpatLangtxtEn "wikilink") \| [ Document
Metadata](DokDataEn "wikilink") \| [
dokprop](MlhtDbDokpropEn "wikilink") \| [
fmtprop](MlhtDbFmtpropEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-07-17 table traprop created and used as primary data by MLHT

## Outline

By registering a the translator (tradprop.trauid), this translator
becomes authoritative and translations he sends will be recompiled. If
somebody else sends a translation for this page, the translation is
ignored.

The table contains the following fields

-   DOK: document id
-   LANG: language
-   PRELANG: preceding language (used to determine position in sequence
    of languages)
-   TRAUID: translator [ user id](FfiiUidEn "wikilink")
-   TRADAT: date of translation
-   TRAVERS: version of translation: 8-digit integer, 1.3.55 translates
    to 1003055. refers to DOKVERS field of dokprop table

Whishlist:

-   Multible translators for a page?

## Updates for this table: {#updates_for_this_table}

-   currently:
    -   -   via direct db access
        -   via nodes.txt configuration files on Hartmut\'s machine at
            a2e.de
-   in the future maybe also:
    -   -   via [ aktiv](AktivEn "wikilink") and [
            knecht](KnechtEn "wikilink")
        -   by a web-based psql editing tool ?

## Examples

Example to get the list of authoritative translators for the page
swpatnitcu in German:

`select trauid from traprop where dok = 'swpatnitcu' and lang = 'de' ;`
