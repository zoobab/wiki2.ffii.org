1.  1.  -\*- dok: [AktivMakeProjsel](AktivMakeProjsel "wikilink"); lang:
        en; coding: iso-8859-1; mode: fundamental; -\*-

# aktiv_make_projsel: generating the project selection menu for aktiv.ffii.org {#aktiv_make_projsel_generating_the_project_selection_menu_for_aktiv.ffii.org}

\--\> \[ [ aktiv](AktivEn "wikilink") \| [ make aktiv
menus](AktivMakeEn "wikilink") \| [ creating
projects](FfiiprojKreEn "wikilink") \| [ project
news](FfiiprojNewsEn "wikilink") \| [ mlht
database](MlhtDbEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronolgy {#news_chronolgy}

-   2004-10-18 phm improves and documents the script (in particular the
    choice of the right title and description in the right language for
    each project is refined and thereby the nuymber of appearing
    projects is increased)
-   2004-09-00 phm adds the [ ffiiprojrank](FfiiProjRankEn "wikilink")
    script that puts project into an automatic order based on their
    hierarchical structure (upproj field) and peer evaluation.
-   2004-08-00 phm creates the script and puts it to use

## Synopsis

The Perl script

` genba:/var/www/adm/bin/aktiv_make_projsel`

is invoked from \'daily-aktiv.knecht\', either by hand or by cronjob
every night. It writes html text to standard output that is used by the
[ ffii participation system (aktiv)](AktivEn "wikilink") to let people
subscribe to a project at various participation levels. The html text
belongs into one of the files

`   /var/www/ffii/verein/spende/newdb/mc/en/projsel.en.html`\
`   /var/www/ffii/verein/spende/newdb/mc/fr/projsel.fr.html`\
`   /var/www/ffii/verein/spende/newdb/mc/de/projsel.de.html`

which are read by the aktiv.ffii.org program and found in its main menu
(via an item labelled \'participate in projects\' or similar). Once the
text is stored there, it is immediately used by aktiv, as soon as the
menu page is loaded/reloaded.

Without any commandline argments, the scripts writes the english
version. An two-letter iso language code can be supplied to change the
language. Currently translations are available mainly for \'de\' and
\'fr\', to a lesser degree also \'pt\', \'se\', \'nl\' and others.

Project participation and signoff decision can also be taken implicitely
in the related mailman mailing lists. Both decisions are translated to
one another with help of the [ ffiidb2mm](Ffiidb2mmEn "wikilink") and [
ffiimm2db](Ffiimm2dbEn "wikilink") scripts.

The script reads both the project titles and descriptions and all other
texts from the [ mlht database](MlhtDbEn "wikilink"). Texts that do not
belong to projects but to the page itself are stored in the table
\'langtxts\' under the virtual document ID \'projsel\'. They are
retrieved by the sql command

`   $ select * from langtxts where dok = 'projsel' ;`

Currently translations that are sent to the localisation system used by
mwas are not automatically stored in this database.

The script has a few commandline options which are mostly interesting
for debugging purposes and not yet further documented here.

## To Do {#to_do}

-   write some more similar scripts, e.g. for \'selevent\' (event
    participation). In fact this model may be efficient for the majority
    of applications on the aktiv menu.
-   Integrate mwas localisation system with mlht database
