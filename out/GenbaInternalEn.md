1.  acl [TrustedGroup](TrustedGroup "wikilink"):read All:

\-\--\> \[ [GenbaEn](GenbaEn "wikilink") \]

## Daemons on Genba {#daemons_on_genba}

PostgreSQL database:

-   The daemons are named postmaster, one is the master daemon which
    accepts connections, forks and the childs do the work. They also
    change their process argv array and show who is logged in to this
    backend instance and what kind of SQL command it is running
    currently
-   the main postmaster listens on 127.0.0.1 and on the external
    Ethernet IP of genba, but it only accepts users from the same IP.
    For authentication, it uses the local ident port then, so this needs
    identd.
-   having this setup is needed to allow remote SQL from phm tunneled
    over ssh for now.

identd:

-   Needs to provide ident (or port name auth) service to postgres for
    authentication
-   is run by inetd, so that identd does not need to be started by root
    but can run as user
-   identd can also useful for other things (Jeroen).

inetd:

-   is started to run identd if neccesary for postgresql authentication,
    it should not be a security risk at all because the inetdand identd
    source code is old and well-known and should not have any possiblity
    of exploitation. However, we could choose to filter the inetd,
    identd and postgresql ports by netfilter for remote IP addresses.

inetd and identd are so old and so small that one would be very
surprised if there were any security bug in it.

exim:

blacklists for mail servers (anti-spam measure, the most efficient form,
in terms of CPU cost) are used in the exim config (like it was before
with qmail, but not good maintained). these are as of Sep 07 2004:

` dnslists  = dnsbl.sorbs.net!=127.0.0.10 : list.dsbl.org : \`\
`             dnsbl.njabl.org: sbl-xbl.spamhaus.org : \`\
`             psbl.surriel.com`

` dnslists  = rhsbl.sorbs.net/$sender_address_domain : \`\
`             dsn.rfc-ignorant.org/$sender_address_domain`

(From a mail of Jeroen to admins\@ffii.org)

innd:

-   The news server is run by Mota from ARPIL, it has an entry in
    /etc/inetd.conf
