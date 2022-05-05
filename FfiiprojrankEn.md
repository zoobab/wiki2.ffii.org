1.  1.  -\*- dok: [FfiiProjRank](FfiiProjRank "wikilink"); lang: en;
        coding: iso-8859-1; mode: fundamental; -\*-

# ffiiprojrank: sorting the FFII projects {#ffiiprojrank_sorting_the_ffii_projects}

\--\> \[ [ make project menu](AktivMakeProjselEn "wikilink") \| [project
table](http://www.ffii.org/proj/ "wikilink") \| [ mlht
database](MlhtEn "wikilink") \| [ aktiv](AktivEn "wikilink") \| [
project news](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-10-18 phm improves and starts to document this script
-   2004-09-00 phm writes this script in order to produce a more usable
    list of projects in the [ aktiv](AktivEn "wikilink") menu

## Synopsis

See

` genba:/var/www/adm/bin/ffiiprojrank`

This perl script generates the table \'projrank\' in the [ ffii
database](MlhtDbEn "wikilink"). The table consists of two fields

-   proj: project id
-   projrank: project rank string: position in hierarchy top down from
    the trunk to the leaf, with interspersed 2-digit numbers based on
    evaluation of the project by the owner of its upper level project
    (upproj).

To sort projects, we now only need to add \'natural join projrank \...
order by projrank\' to the \'select\' command. Without this auxiliary
table, sorting would cost a lot of time (and coding effort).

## To Do {#to_do}

-   add an integer field for level depth (usable for indenting in tables
    and menus)
