1.  1.  -\*- dok: [PolisTask](PolisTask "wikilink"); lang: en; coding:
        iso-8859-1; mode: fundamental; -\*-

# Programming Tasks at FFII.org {#programming_tasks_at_ffii.org}

-\> \[ [ FFII Data Processing](PolisEn "wikilink") \| [ Project
News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

*Programmed workflows of FFII should not be determined by the software
we use. Rather, the software should fulfill our specifications, and we
need to configure or program it so that it does. Here we try to specify
what needs to be done.*

-   [ /var/www/adm/bin/mlhtimport](MlhtImportEn "wikilink") needs MIME
    decoding capabilities \-- Perl module Mail::Message can be used,
    gilles at ffii org has shown how it works but his version of
    mlhtimport is currently outdated. The failure of mlhtimport to
    handle MIME-encoded (quote-printable) texts is frustrating
    translation volunteers
-   need a new wiki which, in addition to being nicer to use than the
    present one, maintains essential features such as [ exchanging
    document metadata with the database](DokDataEn "wikilink") and [
    using FFII user id-s with crypt-ed
    passwords](KwikiEditEn "wikilink"). Advanced preparations for
    implementing this on !MoinMoin have been undertaken by Jochen
    Wiedmann
-   [ urlwatch](UrlWatchEn "wikilink") system (started by Gilles) needs
    to be kept up to date and put into wider use
-   data synchronisation between mailman and the database, largely done
    by phm (Hartmut Pilch) in scripts such as ffiidb2mm and ffiimm2db, a
    better variant by Jochen Wiedmann is finished and nearly deployed,
    further maintenance and improvements may be needed. It would be good
    if dedicated programmers could take over.
