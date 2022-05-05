1.  acl [TrustedGroup](TrustedGroup "wikilink"):read All:

# Redefinition of [FFIIs](FFIIs "wikilink") computing structure and definition of admin processes {#redefinition_of_ffiis_computing_structure_and_definition_of_admin_processes}

(DRAFT) (this doc is out of sync with the more current
[ComputingRestructuring](ComputingRestructuring "wikilink"))

## Intro

In the past 3-4 years FFII computing services have experienced an
enormous increase in load/usage and the number of services has grown
substantially. Uninterrupted availability of these services has become
critical to our mission. After thorough consideration, the FFII board
has come to the conclusion, that further fixing of the current computing
structure (mainly relying on the \"genba\" server) is not efficient
anymore. It is therefore planned to set up new server(s) from scratch
and incrementally migrate all existing services to these. The migration
should happen in a way that minimizes service downtime during the
transition. An important consideration will be to keep fixed costs as
small as possible whithout sacrifying quality.

## Goal

Maximize availability of FFII core computing services to active members
and supporters

## Team

Responsible: N.N.

Team members:

-   Michael Wasmeier
-   Bernhard Kaindl(load expert)
-   Lars Noschinski(schinski/cebewee) (bkaindl: müsste einmal mit ihm
    darüber sprechen, grundsätzlich qualifiziert, SQL, beherrscht python
    relativ gut)
-   Christian Schulte (dg1nsw) (bkaindl: qualifiziert für webserver,
    statistik, programmierung, auch SQL, aber nicht perl)
-   Ask \"verein\" / the supporters which indicated that they have time
    to ask deputies if they can provide technical administration help in
    the areas we need.

## Tasks

### Identify hosting company and specifiy minimum required hardware {#identify_hosting_company_and_specifiy_minimum_required_hardware}

-   Establish key parameters (bandwidth, xfer volume, HDD capacity etc.)
    [MigrHostingKeyParams](MigrHostingKeyParams "wikilink")
-   Obtain offers, fathom possible rebates (assumption: approx. 5
    offers)
-   Evaluate available offers
-   Decide if hardware will be rented or purchased
    -   -   Kurt Jaeger, <http://LF.net>
        -   dg1nsw will ask franken.de
        -   mwas will ask hostsharing.net
        -   jmaebe recommended <http://server4you.de>
        -   In case of buying Hardware, possible configuration:

`    * Which type of CPU? (Athon, Athlon XP, Pentium 4)?`\
`    * HDD: Should be at least 80 GB (what we have now) `

### Define and document system components and admin procedures {#define_and_document_system_components_and_admin_procedures}

-   Create documentation of existing services + interaction
    -   -   Apache (just conceptual overview - things not easily gleaned
            from httpd.conf vhost.conf)
        -   Postgres (incl. Aktiv+MEP databases, adding table+column
            [COMMENTs](COMMENTs "wikilink"))
        -   SMTP server (qmail,postfix,exim)
        -   Mailman (or other mailing list manager)
        -   System backup (DB, documents, \... ,home dirs)
        -   Knecht
        -   Aktiv
        -   Email-based feedback system
        -   urlwatch
        -   Addenda system (Kwiki)
        -   Lots of cronjobs

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
    find acceptance
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

-   Decide if various kinds of quota need to be implemented (e.g. disk,
    CPU)
-   Implement watchdog scripts for http, SMTP, CGI/mod_perl/DB running
    on external server
-   \"Throttling\" for outgoing email campaigns (or separate mail server
    for such)
-   Spam rejection and filtering
-   Ready-to-run backup server at a different provider
-   Implement log rotation

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

-   run bind chrooted (for security reasons)
