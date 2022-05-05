1.  1.  -\*- dok: ffiidists; lang: en; coding: iso-8859-1; -\*-

# ffiidists: generating mailing lists from the database {#ffiidists_generating_mailing_lists_from_the_database}

\--\> \[ [ Mailman Project Lists](MailmanProjlistsEn "wikilink") \| [
MLHT DB](MlhtDbEn "wikilink") \| [ Creating
Projects](FfiiprojKreEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-10-15 ffiidists has been inoperant since 08, causing the [
    projlists script](MailmanProjlistsEn "wikilink") to resubscribe
    people who have already unsubscribed. phm fixes the bug and makes
    projlists.mailman more robust, so this can\'t happen again.

## Synposis

The script

` genba:/var/www/adm/bin/ffiidists`

tells you about its commandline options when you invoke it with the -h
option:

` $ ffiidists -h`

By \"mailing list\" here we mean a list of e-mail addresses, one on each
line, written into a text file.

There are other scripts, owned by the user \'list\' and placed in

`   /home/list/ffii/bin`

in particular

`   /home/list/ffii/bin/projlists.mailman`

which use this information for updating mailman.

The \"ffiidists\" script gives out mailing lists not only for projects
but also based on all kinds of criteria, such as ffii members of a
certain region, without duplicates.

The mailing lists are usually written into subdirectories of

`   /var/www/www/verein/home/`

and in particular of the subdirectory

`   /var/www/www/verein/home/nenri`

which can be read from the web after htaccess authentication.

Separating the generation of such lists from their use is not always
appropriate.

E.g. for the projlists.mailman application, it would be desirable to
integrate the ffiidists functionality in the future, so that the
time-span between generating each mailing list and updating mailman with
it is minimised.

The ffiidists script is invoked by daily.knecht at near 02:00 CET each
night. The projlists.mailman uses the data at 04:00 each night. It is
crucial that projlists.mailman should use only new data. There is now an
age limit of 4 hours. In the past it has happened that ffiidists was not
invoked or failed to write the mailing lists for some reason, so that
mailman was fed with old data, causing people who had already
unsubscribed be resubscribed.

#### Create one project mailing list {#create_one_project_mailing_list}

` $ ffiidists -v 3 proj uk-parl`

\'-v 3\' stands for \'verbosity level 3\'.

#### Create all mailing lists for one project {#create_all_mailing_lists_for_one_project}

` $ ffiidists -v 3 proj uk`

## Limitations
