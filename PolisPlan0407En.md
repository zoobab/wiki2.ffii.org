# Restructuring of FFII computing structure and definition of admin processes {#restructuring_of_ffii_computing_structure_and_definition_of_admin_processes}

\--\> \[ [ FFII Computing](PolisEn "wikilink") \]

------------------------------------------------------------------------

## Intro

In the past 3-4 years FFII computing services have experienced an
enormous increase in load/usage and the number of services has grown
substantially. Uninterrupted availability of these services has become
critical to our mission. After thorough consideration, the FFII board
has come to the conclusion, that further fixing of the current computing
structure (mainly relying on the [ genba](GenbaEn "wikilink") server) is
not efficient anymore. It is therefore planned to set up new server(s)
from scratch and incrementally migrate all existing services to these.
The migration should happen in a way that minimizes service downtime
during the transition. An important consideration will be to keep fixed
costs as small as possible whithout sacrifying quality.

## Goals

-   Maximize availability of FFII core computing services to active
    members and supporters
-   Make possible and facilitate admin job-rotation

## Team

Responsible: to be determined

Team members: to be determined

## News

-   Wednesday, 2004-August-04: Schlund&Partner and/or 1&1 still haven\'t
    said whether they\'ll sponsor a root server. Thus, the deadline
    found in the time Time plan has passed.

## Time plan {#time_plan}

-   Wednesday, 2004-August-04: Schlund&Partner and/or 1&1 need to tell
    us whether they\'ll (partially) sponsor a server. If they don\'t
    want to, or if they don\'t reply, then we\'ll focus on a different
    solution.

## The new server {#the_new_server}

### Minimum Requirements {#minimum_requirements}

Note that those are just preliminary values - they need to be agreed
upon.

-   HD space: 60GB (120GB would be better)
-   RAM: 640MB (1GB would be better)
-   Backup: Complete backup of HD
-   Processor: 1.5!GHz
-   Raid: not required
-   BW: 100GB (can always be upgraded)

### Stuff that needs to be hosted on the new server {#stuff_that_needs_to_be_hosted_on_the_new_server}

Please also add how much space the services need.

-   patdb.ffii.org (needs, AFAIK, around 20 GB HD space)
-   mail setup (space requirements?)

### Possible hostig solutions {#possible_hostig_solutions}

-   A root server sponsored from Schlund&Partner or 1&1 (feklee is in
    contact with them)
-   A root server from Hetzner Online AG (according to a [C\'T
    article](http://hetzner.de/pdf/CTServertest_1204.pdf "wikilink"),
    that is a good low cost solution)

## Tasks

### Identify hosting company and specifiy minimum required hardware {#identify_hosting_company_and_specifiy_minimum_required_hardware}

-   Establish key parameters (bandwidth, xfer volume, HDD capacity etc.)
    [MigrHostingKeyParams](MigrHostingKeyParams "wikilink")
-   Obtain offers, fathom possible rebates (assumption: approx. 5
    offers)
-   Evaluate available offers
-   Decide if hardware will be rented or purchased
    -   -   In case of buying Hardware, possible configuration:

`    * Which type of CPU? (Athon, Athlon XP, Pentium 4)?`\
`    * HDD: Should be at least 80 GB (what we have now) `

### Define and document system components and admin procedures {#define_and_document_system_components_and_admin_procedures}

-   Create documentation of existing services + interaction
    -   -   Apache (just conceptual overview - things not easily gleaned
            from httpd.conf vhost.conf)
        -   Postgres (incl. Aktiv+MEP+amend databases, adding
            table+column !COMMENTs)
        -   SMTP server (current: qmail, future maybe exim)
        -   Mailman - update to 2.1.4 - Patches from breiter:
            <ftp://ftp.intevation.de/users/bernhard/mailman/>
        -   System backup (DB, documents, \... ,home dirs)
        -   Knecht
        -   Aktiv
        -   Email-based feedback system
        -   urlwatch
        -   Addenda system (Kwiki)
        -   Lots of cronjobs
        -   (Reserve for additional services that were not taken care of
            during planning)

```{=html}
<!-- -->
```
-   Define admin-procedures to ensure\...
    -   -   that all changes to the system are documented
        -   that changes affecting others are communicated in advance

```{=html}
<!-- -->
```
-   Determine if use of a tracking system would increase efficiency and
    be acceptable to admins
-   Analyze past system failures to avoid future ones
-   Define emergency-procedures (e.g. hardware failure)
-   (all this without creating a bloated bueraucracy)

### Match admin responsibilities to available prospects (i.e. offers for help) {#match_admin_responsibilities_to_available_prospects_i.e._offers_for_help}

-   Identify recovery admin (has physical access to server hardware)
-   Identify security expert
-   Identify system-load expert
-   Identify service-specific admins
-   Define backups for admins (people are meant here 8\^)
-   Consider job-rotation for service-specific admin jobs
-   Identify recurring or frequently requested actions that could be
    handled by scripts

### Define preventive measures {#define_preventive_measures}

-   Decide if disk quota needs to be implemented
-   Implement watchdog scripts for http, SMTP, CGI/mod_perl/DB running
    on external server
-   \"Throttling\" for outgoing email campaigns (or separate mail server
    for such)
-   Spam rejection and filtering
-   Ready-to-run backup server at a different provider
-   Log file rotation

### Transfer the following services to the new platform {#transfer_the_following_services_to_the_new_platform}

-   Apache
-   Postgres (incl. Aktiv+MEP databases)
-   SMTP server (qmail,postfix,exim)
-   Mailman (or other mailing list manager)
-   System backup (DB, documents, \... ,home dirs)
-   Knecht
-   Aktiv
-   Email-based feedback system
-   urlwatch
-   Addenda system (Kwiki)
-   Lots of cronjobs
-   (Reserve for unexpected service issues)

Not included in this round:

-   Patent database
-   Patent download engine (OCR)
-   What about mlht-related stuff??
-   ..what else?..

Other Servers:

-   Plone and swpatwiki are currently provided at different sites, not
    on genba, this should stay this way, the separation of load is a
    good idea.
-   demo.ffii.org seems to be not anymore maintained by bram, so it
    should be migrated to an ffii-controlled server(on genba for now)

### Miscellaneous tasks {#miscellaneous_tasks}

-   monitor traffic: <http://ffii.org/~schinski/ipac-ng/>

### Optional tasks {#optional_tasks}

No decision yet, if these will be included in the current time-frame

-   Alternative patent DB (via Erik/Carsten)
    <http://gauss.bacon.su.se/> - now got an A record on ffii.org:
    <http://patdb.ffii.org> (you can use this name from now on)

### Excluded tasks {#excluded_tasks}

These will be maintained and hosted completely independently

-   Conference Planning System built on CAPS
    <http://www.strakt.com/sol_caps.html>
