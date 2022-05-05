1.  1.  -\*- dok: [FfiiprojKre](FfiiprojKre "wikilink"); lang: en;
        coding: iso-8859-1; -\*-

# How to Create and edit an FFII project group in the Database {#how_to_create_and_edit_an_ffii_project_group_in_the_database}

\--\> \[ [ FFII Projects](FfiiprojEn "wikilink") \| [ regional
groups](FfiiRegioEn "wikilink") \| [ aktiv](AktivEn "wikilink") \| [
Mailman DB](MailmanDbEn "wikilink") \| [
ffiidists](FfiidistsEn "wikilink") \| [
ffiidb2mm](Ffiidb2mmEn "wikilink") \| [
projlists](MailmanProjlistsEn "wikilink") \| [ Project
News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2005-01-25 added section \'What\'s in a project\'

```{=html}
<!-- -->
```
-   2004-12-01 feklee assumes that the news server infrastructure is
    stable (it has been heavily tested). Please start using it. If there
    are any problems, report them to newsserver-help(@)ffii.org.

```{=html}
<!-- -->
```
-   2004-11-11 feklee adds information about setting up news group
    gateways. Note that **news group gateway functionality** is still in
    the developement phase, i.e. it **should not be used for non-testing
    projects**. To be more precise: Modification of gated news group
    setups should work; However, user authentication to the news server
    doesn\'t work correctly, as of this writing.

```{=html}
<!-- -->
```
-   2004-10-17 phm simplifies project creation by incorporating
    functionality from [ ffiidists](FfiidistsEn "wikilink") into [
    ffiidb2mm](Ffiidb2mmEn "wikilink")

## No-Nos {#no_nos}

Do **not rename or delete projects**. Instead terminate a project (set
the database field \[=ffii.proj.finito\] to the value \[=True\]) and, if
desired, create a new project as a substitute.

## What\'s in a project? {#whats_in_a_project}

A project consists of a contact person and up to three newsgated mailing
lists. It may have a webpage.

### Contact person {#contact_person}

In a grassroots organisation, it can be helpful to have a minimum of
accountability or at least a contact person, so each has a supporter
registered in aktiv, who acts as contact person and gets the initial
password for the mailing lists (the mailing lists have a mailman
interface, so he/she can assign to others). This date is in the table
**proj**.

### Mailing lists {#mailing_lists}

Each project has up to three mailing lists, tables in **projhlp**, these
are called -help, -parl, -news. Eg:

-   muenchen-help: this is an internal helpdesk list for answering
    helpdesk requests and confidential things
-   muenchen-parl: from \'parl\' = \'parlare/parler\': speak, this is
    the main public mailing list, where subscribers can post and read
    what others post
-   muenchen-news: low-volume list for news to eg journalists or other
    observers, you can subscribe, but subscribers cannot post

Typically most traffic is on the -parl list, some projects don\'t use
the -news list at all, and also the -help list is only optional.

The activity on mailing lists differs widely from project to project,
and of course the project also might do physical events. Doing this
autonomously is very much welcome. Most projects are either regional or
national, or activity-focused (patdb, sarji) or event-focused.

# Creating a project {#creating_a_project}

## Preparatory Steps {#preparatory_steps}

Contact proj-help before you go ahead. If you are creating a regional
group, contact regio-help instead.

You need an account on [ genba](GenbaEn "wikilink") and write access to
the \'ffii\' database tables \'proj\', \'projhlp\' and \'projprm\'.
Alternatively, you can use the \'proj\' verb in the [
knecht](KnechtEn "wikilink") system.

To get the work done quickly (without waiting for cronjobs to execute
it), you also need access to the account of user \'list\'.

Quite a few people have all these access rights, ask proj-help or
regio-help if needed.

## Edit the Database {#edit_the_database}

New groups are created as projects in the ffii database, tables
\'proj\', \'projhlp\' and \'projprm\'. E.g. for the regional group
\'franken\' the project \'franken\' is created in \'proj\' and helpers
are assigned to it at different help levels in \'projhlp\' and given
permission for this helplevel in \'projprm\'.

`$ psql ffii`\
`> insert into proj ( uid, proj, upproj, projurl, lang ) values ( 'cschulte', 'franken', 'regio', '`[`http://kwiki.ffii.org/FfiiFrankenDe`](http://kwiki.ffii.org/FfiiFrankenDe)`', 'de' ) ;`

This means that ffii user \'cschulte\' is leader of the \'franken\'
project which is a sub-project of the \'regio\' project and has its home
page at <http://kwiki.ffii.org/FfiiFrankenDe>.

The same can be achieved by sending the following command to the [
knecht mail processor](KnechtEn "wikilink"):

` proj franken  upproj = regio  lang = de   projurl = `[`http://kwiki.ffii.org/FfiiFrankenDe`](http://kwiki.ffii.org/FfiiFrankenDe)

Next, you may want to insert records for helpers:

`> insert into projhlp values ( 'bkaindl', 'franken', 4 ) ;`

This means that ffii user \'bkaindl\' wants to participate in the
\'franken\' project at responsibility level 4, i.e. co-responsible,
ready to be the sole responsible when needed.

You can not send this command via the [ knecht mail
processor](KnechtEn "wikilink"). Rather you must ask bkaindl to send the
following:

`  projhlp  franken     hlplvl = 4  `

`> insert into projprm values ( 'cschulte', 'franken', 'bkaindl', 4 ) ;`

This means that project leader \'cschulte\' permits user \'bkaindl\' to
participate in project \'franken\' at responsibility level 4.

The same, as [ Knecht mail processor](KnechtEn "wikilink") commands:

`  projprm franken  prmuid = bkaindl prmlvl = 4 `

Once a group franken exists in the database, the \'ffiidb2mm\' script
need to be run by user \'list\' so that the mailing lists
franken-{news,parl,help} are created. This script is invoked via the
\'list\' cronjob every night.

If \'franken-parl\' was already created manually before the project
existed in the database, supplying the project afterwards won\'t do any
harm.

After the mailig lists have been created, the \[=update_gated_ngs\]
program needs to be run by the user news in order to update the
creation/activation of news groups and corresponding gateways (note that
this process may take dozens of minutes - be very patient if you
initiate it manually). The program is run automatically each night by
the user news\' cron job.

### Optionally disable mailing list creation {#optionally_disable_mailing_list_creation}

If you do not want your project to have mailing lists (for the time
being), you can set the field \'projmlp\' of table \'proj\' to
\'false\', or, via knecht:

` proj  irctalk projmlp = 0`

By default, the value of projmlp is \'true\' (1).

The project mailing lists will also not be updated if the \'finito\'
field is true or if the \'projfin\' field is set to a date in the past.

### Controlling the setup of news groups {#controlling_the_setup_of_news_groups}

As explained below, managing gated news groups is quite simple. For more
information, visit [NewsServerEn](NewsServerEn "wikilink").

-   Projects without mailing lists don\'t have gated news groups.
-   To disable a project\'s news group or to disable creation of it, set
    the value of the field \[=nggate\] in the table \[=proj\] to
    \[=FALSE\].
-   To make the actual news group setup match the settings in the
    database, run the program \[=run_update_gated_ngs\] as user
    \[=news\] (note that this process may take dozens of minutes - be
    very patient) or wait for the nightly cron job (see above). This
    program automatically creates/activates, moves, or removes news
    group gateways. Note that, actually, no groups are removed by this
    program: During removal or movement, groups are merely deactived and
    gateways are removed. That way, messages in \"removed\" or old
    \"moved\" news groups stay available for reading (until someone
    decides to remove them manually).

## Giving the project a title and description {#giving_the_project_a_title_and_description}

Once you have created a project in this system, it will be advertised in
the menu of the [ FFII participation system (aktiv)](AktivEn "wikilink")
on the next day, provided that you provide a title and a description.

These can be inserted through either one of the following three ways.

### database meta documentation: table \'flddes\' {#database_meta_documentation_table_flddes}

A title can be inserted as follows:

` > insert into flddes values ( 'proj', 'de', 'franken', 'Aktivitaeten in Franken' ) ;`\
` > insert into flddes values ( 'proj', 'en', 'franken', 'Activities in Franconia' ) ;`

It might also help to edit the \'proj\' table in order to point to a
project URL, e.g.

` > update proj set projurl = '`[`http://franken.ffii.org/`](http://franken.ffii.org/)`' where proj = 'franken' ;`

If you do not do this, it will be assumed that your project homepage is

` `[`http://kwiki.ffii.org/FrankenEn`](http://kwiki.ffii.org/FrankenEn)\
` `[`http://kwiki.ffii.org/FrankenFr`](http://kwiki.ffii.org/FrankenFr)

etc, depending on the language of the \'aktiv\' user interface.

## project-specific documentation strings: table projtxt (optionally via knecht) {#project_specific_documentation_strings_table_projtxt_optionally_via_knecht}

There are other ways of creating a title:

`> insert into projtxt values ( 'cschulte', 'franken', 'title', 'en', 'Activities in Franconia' ) ;`\
`> insert into projtxt values ( 'cschulte', 'franken', 'descr', 'en', 'Organization of activities in Franconia' ) ;`

or, for the [ knecht mail processor](KnechtEn "wikilink"):

`projtxt franken    title   en  'Activities in Franconia'`\
`projtxt proj = franken  mlid = descr   lang = de   mltxt = 'Organisation von Aktivitaeten in Franken'      `

### document-specific strings: table \'langtxts\' (via mlht import or knecht) {#document_specific_strings_table_langtxts_via_mlht_import_or_knecht}

Moreover, if there is an mlht document of the same name as the project,
you can send the text tags to the \'langtxts\' table through the [ mlht
translation mechanism](SwpatLangtxtEn "wikilink") as entries in a txl
file:

`   title: Activities in Franconia`\
`   descr: Organising activities around Nuremberg`\
`   `\
`   # Local Variables: ;`\
`   # dok: franken ;`\
`   # txtlang: en ;`\
`   # ...`\
`   # Local Variables: ;`

The same can be achieved via the [ knecht mail
processor](KnechtEn "wikilink"):

`   langtxts    franken title   fr  Activtés en Franconie`\
`   langtxts    dok = franken   mlid = descr    lang = it\`\
`       mltxt = Organizzare le attività della FFII nella regione di Franconia`

again provided that a document called \'franken\' is already known in
the system.

### daily automatic update of aktiv interface {#daily_automatic_update_of_aktiv_interface}

The aktiv interface is updated from the database once per day by the
script

`   /var/www/adm/bin/daily-aktiv.knecht`

which reads out values from the projtxt, langtxts and flddes tables.

Each of these methods has its advantages and is convenient for different
people. Therefore the system is likely to continue collecting text
chunks from all of these three sources for some time to come.

If you can not wait for the daily cronjob to update the aktiv system,
invoke \'daily-aktiv.knecht\' from the command line as user knecht, or
ask the people at proj-help to do it for you.

## Optionally invoke the cronjob scripts yourself {#optionally_invoke_the_cronjob_scripts_yourself}

If you want to speed things up, invoke the scripts as follows. First [
ffiidists](FfiidistsEn "wikilink"):

` $ su - list;`\
` list$ source .bashrc`\
` list$ ffiidb2mm franken`

For this script to work, there need to be entries for the project in the
tables =projhlp and =projprm.

Contact proj-help if you don\'t have and urgently need access to user
list. Otherwise just wait for the nightly cronjob.

This creates the distribution files and statistics such as

` /var/www/ffii/assoc/home/franken-{news,parl,help}.stat`\
` /var/www/ffii/assoc/home/nenri/franken-{news,parl,help}/dist`

and creates+populates the corresponding mailman list.

## Things to do {#things_to_do}

Remind [ kwiki-help at ffii org](KnechtEn "wikilink") that you would
like to enable project sign-on/off directly on your project-related wiki
page, i.e. let people sign on/off after they have logged in as \"ffii
editor\".

Remind [ aktiv-help at ffii org](AktivEn "wikilink") that we need to
further simplify project creation by providing a web interface for it.
