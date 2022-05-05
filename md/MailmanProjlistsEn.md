1.  1.  -\*- dok: [MailmanProjlists](MailmanProjlists "wikilink"); lang:
        en; coding: iso-8859-1; -\*-

# projlists.mailman: update mailman based on project member mail address lists {#projlists.mailman_update_mailman_based_on_project_member_mail_address_lists}

\--\> \[ [ ffiidb2mm](Ffiidb2mmEn "wikilink") \| [
ffiimm2db](Ffiimm2dbEn "wikilink") \| [
ffiidists](FfiidistsEn "wikilink") \| [ creating
projects](FfiiprojKreEn "wikilink") \| [ mailman](MailmanEn "wikilink")
\| [ mlht db](MlhtDbEn "wikilink") \| [ aktiv](AktivEn "wikilink") \| [
genba](GenbaEn "wikilink") \| [ computing](PolisEn "wikilink") \| [
project news](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-10-17 phm makes the script generate the mailadr lists on its
    own, renames it to [ ffiidb2mm](Ffiidb2mmEn "wikilink")
-   2004-10-16 phm adds mailaddress list (dist) age check after a
    disaster that could have been prevented by such a check
-   2003-00-00 phm creates the script

## Synopsis

This script is outdated, see the newer version [
ffiidb2mm](Ffiidb2mmEn "wikilink").

The text here may soon disappear.

The script

`   /home/list/ffii/bin/projlists.mailman`

gives out some info on its usage when invoked with commandline option
\'-h\'

`   $ projlists.mailman -h`

Typical invocations are

`   $ projlists.mailman -v 3 /var/www/ffii/verein/home/nenri/uk-help/dist`\
`   $ projlists.mailman -v 3 /var/www/ffii/verein/home/nenri/uk-*/dist`\
`   $ projlists.mailman -v 3  `

Line 1 will update the uk-help project list based on mailing addresses
found in the file.

Line 2 does the same for all uk-\* project lists, line 3 for all
projects.

\'-v 3\' means verbosity level 3.

When mailing lists belong to projects and do not yet exist, the script
creates them with default configurations. There are also commandline
options for reconfiguring existing lists.

When a mailaddress list file is too old (more than 4h by default, this
can be changed with the -a option), the script skips it and sends a
warning to the administrator (to be changed with -M).

## Todo

The script should (optionally) generate the mailaddress lists by itself
rather than taking possibly outdated ones from the file system. This
should be easy to do, given that the script already reads the ffii
database anyway.
