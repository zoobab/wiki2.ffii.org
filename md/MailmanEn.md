# Documentation of Mailman installation on Genba.ffii.org {#documentation_of_mailman_installation_on_genba.ffii.org}

\--\> \[ [ FFII Mailing List FAQ](ListinfoEn "wikilink") \| [ Mailman
Archives](MailmanArchiveEn "wikilink") \| [
Abmeldung](MailmanUnsubDe "wikilink") \| [ ffii
computing](PolisEn "wikilink") \| [ genba](GenbaEn "wikilink") \| [
Administrivia](AdministriviaEn "wikilink") \| [ ML and NG Database
Structures](FfiiPgSqlDatabaseMlNgEn "wikilink") \]

------------------------------------------------------------------------

## Maintainer

-   From 1999 to Spring 2004: Bernhard Reiter (breiter at ffii org)
    -   -   Bernhard may still be available to support his successor
-   From Summer 2004 to ? (today for now): Jeroen Dekkers
-   phm is maintaining [ scripts for interfacing between database and
    mailman](MailmanDbEn "wikilink") (allowing project subscription
    through aktiv et al)

## Mailinglist archives {#mailinglist_archives}

-   [MailmanArchiveEn](MailmanArchiveEn "wikilink")

## Mailman paths {#mailman_paths}

*`var/lib/mailman`*`: All list information and archives, owned by group 'list' and user 'list' or 'root'.`\
*`usr/lib/mailman`*` and `*`usr/share/mailman`*`: The debian Mailman installation.`\
*`etc/mailman`*`: site-wide mailman configuration files`\
` `

## Deleting Lists {#deleting_lists}

Being root or in group \'list\':

Delete a list with archives:

`/usr/sbin/rmlist ``<listname>`{=html}

use

`/usr/sbin/rmlist -a ``<listname>`{=html}

to also delete the archive

Further commands apply as documented at <http://www.list.org/site.html>
