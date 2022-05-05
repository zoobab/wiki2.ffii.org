# Maintaining the FFII News Group Gateway Setup {#maintaining_the_ffii_news_group_gateway_setup}

\--\> \[ [ ffii computing](PolisEn "wikilink") \| [
genba](GenbaEn "wikilink") \| [
Administrivia](AdministriviaEn "wikilink") \]

------------------------------------------------------------------------

## Information for Users {#information_for_users}

See [The FFII News Server user
portal](http://news.ffii.org/ "wikilink"). Requests and questions
concerning the newsserver should be directed to
newsserver-help_at_ffii.org.

## Modifying the gateway configuration {#modifying_the_gateway_configuration}

### Adding a gateway {#adding_a_gateway}

-   If the gateway is for groups associated with a project, see
    [FfiiprojKreEn](FfiiprojKreEn "wikilink").
-   If the gateway is for a non-project mailing list, proceed as
    follows.

00 Set the values of the database fields \[=ffii.lists.gnggrpr\] and
\[=ffii.lists.gnggrpw\] accordingly (see their description in the table
\[=ffii.flddes\]). 00 Wait for user news\' nightly cron job to update
news group gateways, or - if you\'re impatient and if you have the
necessary permissions - run
\[=/usr/local/lib/news/bin/run_update_gated_ngs\] as user \[=news\].
However, note that this process may take **dozens** of minutes. If you
interrupt it, please remove the lock file(s) (extension \[=.lock\])
stored in the directory \[=/tmp\] so that the nightly cron job can run.

### Removing a gateway {#removing_a_gateway}

For more information see the documentation for adding a gateway. Note
that when a gateway is removed, the news group is not removed: It is
merely diabled so that messages stay available for reading.

1.  Modify the database values influencing the set up of a gateway.
2.  Rerun \[=run_update_gated_ngs\], or wait for the nightly cron job.

### Moving a gateway {#moving_a_gateway}

For more information see the documentation for adding a gateway. Note
that when a gateway is moved, the \"old\" news group is not removed: It
is merely diabled so that messages stay available for reading.

1.  Modify the position of the mailing list or project in the
    corresponding hierarchy. For mailing lists, this means setting the
    desired list group; for projects, this means setting the desired
    parent project.
2.  Rerun \[=run_update_gated_ngs\], or wait for the nightly cron job.

### Changing the description of a gated news group {#changing_the_description_of_a_gated_news_group}

For more information see the documentation for adding a gateway.

1.  Modify the description of the project or mailing list in the
    appropriate database fields. For projects, the tables \[=flddes\] or
    \[=projdes\] (lower priority than \[=flddes\]) are relevant; for
    mailing lists the table \[=flddes\] is relevant. To find which
    fields are actually used and in which order, see the usage
    instructions of the program \[=/usr/local/lib/news/bin/description\]
    which may need to be run from a login shell of the user news.
2.  Rerun \[=run_update_gated_ngs\], or wait for the nightly cron job.

### Tuning INN and procmail configuration (rarely needed) {#tuning_inn_and_procmail_configuration_rarely_needed}

As of this writing, among other things, the following INN and Procmail
configuration files are recreated when the gateway configuration is
updated by \[=run_update_gated_ngs\]:

-   \[=/etc/news/news2mail.cf\]
-   \[=/etc/news/newsfeeds\]
-   \[=/etc/news/procmailrc\]
-   \[=/var/lib/news/newsgroups\]

The files are created from configuration stored in the table
\[=ffii.gatedngs\] and from files \[=head\] and \[=foot\] stored in the
source directory corresponding to each file (e.g.
\[=/etc/news/procmailrc.src\]). After changes to the head and foot files
either

-   run [cr](=/usr/local/lib/news/bin/config_gate "wikilink"), or
-   if gateway configuration has changed, wait for the nightly cron job
    or run \[=run_update_gated_ngs\].

In general, however, updating the head and foot files should rarely be
necessary.

### Adding INN wildmat patterns (rarely needed) {#adding_inn_wildmat_patterns_rarely_needed}

Adding INN wildmat patterns should be added to \[=projmltwildmats\] in
case one of the scenarios explained below happens. In general, it isn\'t
wise to remove wildmat patterns from \[=projmltwildmats\] since that may
block access to news groups.

-   A new project mailing list type has been added.
-   Relevant changes have been made to the news group hierarchy.

## Administration Miscellanea {#administration_miscellanea}

### Maintainers

Paul Marques Mota (pmota_at_ffii.org) and Felix E. Klee
(feklee_at_ffii.org)

### Communication

Discussion concerning the newsserver should take place in
newsserver-parl_at_ffii.org, in the corresponding NG, or in
#ffii-newsserver on irc.freenode.net. Announcements are posted to the
list newsserver-news_at_ffii.org.

### When the news server was down {#when_the_news_server_was_down}

When the server is not available, then messages posted with \[=rnews\]
are spooled into a special file (see \[=rnews\]\' man page). To repost
these messages, [-U](=rnews "wikilink") should be run after the server
is restarted. However, this doesn\'t have to be done manually since
INN\'s cron job takes care of it (see \[=/etc/cron.d/inn2\]).

### When messages have been lost {#when_messages_have_been_lost}

Every night a cron job is run that checks for messages that were not
synchronized between mailing lists and news groups. It does so by
comparing archives. To do this check manually, run the program
\[=/usr/local/lib/news/bin/find_lost_messages\] with appropriate
options. There are numerous reasons for messages being lost, also there
are numerous possibilities to recover lost messages. Read
\[=/usr/local/lib/news/doc/lost_messages\] for more information.

### Statistics

See <http://news.ffii.org/innreport/>

### Further documentation {#further_documentation}

-   Introduction to documentation concerning maintenance: See
    !news\@genba.ffii.org:\~/README
-   How the system works (as of this writing, this info is outdated):
    [article available in Google Groups
    An](http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&safe=off&threadm=ciqnj1%241ihb%241%40FreeBSD.csie.NCTU.edu.tw&prev=/groups%3Fhl%3Den%26lr%3D%26ie%3DUTF-8%26safe%3Doff%26group%3Dmailing.unix.inn-workers "wikilink")
-   ML and NG database structures:
    [FfiiPgSqlDatabaseMlNgEn](FfiiPgSqlDatabaseMlNgEn "wikilink")
-   [IETF working
    group](http://www.ietf.org/html.charters/nntpext-charter.html "wikilink")
