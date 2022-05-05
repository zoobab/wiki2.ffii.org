# Administrative Infos about Aktiv {#administrative_infos_about_aktiv}

\--\> \[ [ Aktiv](AktivEn "wikilink") \]

------------------------------------------------------------------------

## Querying the database for mailings to our support base {#querying_the_database_for_mailings_to_our_support_base}

You must restrict your query to uids that have a confirmed email
address!

`select * from pnom natural join persist where pstvar='idconfirmed';`

## Querying the database for membership fees {#querying_the_database_for_membership_fees}

You must restrict your query to uids with a member status of 2 or
higher!

`select * from pnom natural join asoc where asolvl>=2;`

-   Users with asolvl=-1 e.g. have terminated their membership
-   Users with asolvl=0 or 1 may have downgraded they member status
    after having been a paying member
-   See <http://www.ffii.org/verein/profil/profil.de.txt> for asolvl
    documentation

## Automatic transfer of Aktiv user logins for Kwiki Editor use {#automatic_transfer_of_aktiv_user_logins_for_kwiki_editor_use}

See [AktivLoginsForKwiki](AktivLoginsForKwiki "wikilink") (private page)
