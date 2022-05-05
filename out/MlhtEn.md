# [MultiLingual](MultiLingual "wikilink") [HyperText](HyperText "wikilink") (MLHT) System {#multilingual_hypertext_mlht_system}

\--\> \[ [ Metadata](DokDataEn "wikilink") \| [ MLHT
database](MlhtDbEn "wikilink") \| [ Submitting
Translations](SwpatLangtxtEn "wikilink") \| [ Project
News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-08-22 [ translation batch processing
    system](MlhtImportEn "wikilink") now running on [
    genba](GenbaEn "wikilink")
-   2004-08-17 [ database](MlhtDbEn "wikilink") becomes primary source
    of data about documents
-   2004-08-12 bkaindl proposes to use \'screen\' on [
    genba](GenbaEn "wikilink") for collective access to the autoimport
    system (an important step in making mlht more generally usable
    within ffii)
-   2004-07-25 [ metadata structure](DokDataEn "wikilink") documentation
    started
-   2003 translation managment at ffii systematised, people send texts
    in a minimalistic format to mlhtimport at a2e de for automatic batch
    processing, see <http://swpat.ffii.org/group/langtxt/>
-   1997-2000 phm creates the system and initial documentation at
    <http://mlht.ffii.org/>. Purpose is to facilitate managment of large
    multilingual bodies of text.

------------------------------------------------------------------------

As of 2004-09-11, the situation, in a nutshell, is as follows

-   phm\'s simple reference program /var/www/adm/bin/mlhtimport works
    perfectly and does everything that is needed to makevmlht batch
    importing work. It writes the texts into a queue, found in

`       /var/spool/langtxt/*.txt`\
`       /var/spool/langtxt/LASTMAIL`

-   gilles has a richer perl script, mlhtimport2, which should do the
    same things plus, thanks to extensive use of CPAN packages, some
    extra functionality, such as
    -   -   handling all kinds of MIME multipart mail
        -   checking %(xx:\....) expressions

However phm is not sure whether this script produces the same output as
the simple reference program.

Note: the CPAN packages are mostly, except for one or two exceptions
available as debian perl packages and installed this way.

-   Gilles\'s script runs at mlhtimport2 att ffii org and could run at
    any other alias that gilles might prefer, except, for the time
    being, mlhtimport. After the mlhtimport2 script has been verified as
    workable, gilles can also use the mlhtimport alias.

For now, the wiki pages which refer to mlhtimport should mention
mlhtimport2 att ffii org as a beta testing address which should be used
and if there is an error which is fixed by using mlhtimport instead of
mlhtimport2, a notice should be added here with the name of the reporter
and if possible a link or path to the script which triggers the error.
