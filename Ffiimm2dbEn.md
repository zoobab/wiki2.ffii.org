1.  1.  -\*- dok: ffiimm2db; lang: en; coding: iso-8859-1; mode:
        fundamental; -\*-

# [FFIIMM2DB](FFIIMM2 "wikilink"): using mailman logfile info to update the ffii database {#ffiimm2db_using_mailman_logfile_info_to_update_the_ffii_database}

\--\> \[ [ ffii projects](FfiiprojEn "wikilink") \| [ project
news](FfiiprojNewsEn "wikilink") \| [ creating
projects](FfiiprojKreEn "wikilink") \| [
projlists.mailman](MailmanProjlistsEn "wikilink") \| [
ffiidists](FfiidistsEn "wikilink") \| [ where in
CVS](CvsdirAdmBinEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-10-05 phm writes and tests the script
-   2004-10-03? discussions in IRC adn polis-parl show that the
    functionality is needed

## Synopsis

The perl script

`   /var/www/adm/bin/ffiimm2db`

explains its commandline options when invoked with option \'-h\'.

ffiimm2db reads the mailman log file

`   genba:/var/log/mailman/subscribe`

either from the start (-b) or at the tail (-t) as it is written, checks
whether the subscribed or unsubscribed mail addresses and mailing lists
are known to the ffii database and updates the database accordingly.

Since synchronisation in the opposite direction is performed by other
scripts (\--\> [ projlists](MailmanProjlistsEn "wikilink")), this allows
ffii database users to subscribe/unsubscribe only once, either via
mailman or via an ffii database frontend such as [
aktiv](AktivEn "wikilink").

The ffiimm2db script is invoked by the user knecht with verbosity level
3 (-v 3), so that the output can be observed with

`   genba$ tail -f /var/www/adm/log/mm2db/nohup.out`

If ever ffiimm2db is not running, it will be reinvoked by the daily
knecht cronjob, see

`   genba:/var/www/adm/bin/daily.knecht`

## To Do {#to_do}

For most cases the solution works, and it is clean and robust. However

-   We are not quite sure whether the logfile carries all information.
    E.g. phm tried to unsubscribe and resubscribe from mailing lists and
    there was no log message after the succeded subscription (only one
    of a pending subscription).
-   The log message format seems arbitrary and there is no guarantee
    that it will stay the same. It would be desirable to work out a
    stable log message format with the mailman team (and also solve the
    previous item\'s problem this way).

To further make perfect the synchronisation between mailman and our
database, a few improvements could help:

-   We need to make sure that ffiimm2db is invoked immediately after
    each reboot of the machine. There should be a script or hook
    somwhere in *etc/init.db*.
-   Some people have proposed that the ffiimm2db functionality should be
    hooked directly into mailman. That could be of interest if there is
    enough support from the mailman side to make seemless upgrades
    possible
