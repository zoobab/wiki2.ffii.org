1.  1.  -\*- dok: [KwikiEdit](KwikiEdit "wikilink"); lang: fr; coding:
        iso-8859-1; mode: fundamental; -\*-

# Comment devenir éditeur du KWiki de la FFII {#comment_devenir_éditeur_du_kwiki_de_la_ffii}

\--\> \[ [ deutch](KwikiEditDe "wikilink") \| [
english](KwikiEn "wikilink") \] \[ [ kwiki](KwikiEn "wikilink") \| [
FFII UID](FfiiUidEn "wikilink") \| [
ffiiuidpass](FfiiUidPassEn "wikilink") \| [
kwikiprot](KwikiProtEn "wikilink") \| [ actualités des
projets](FfiiprojNewsEn "wikilink") \| [ actualités des brevets
logiciels](SwpatcninoFr "wikilink") \]

------------------------------------------------------------------------

L\'accès en écriture à différentes pages du site <http://kwiki.ffii.org>
est maintenant restreint. Vous devez vous enregistrer. Voici comment
faire.

## L\'espace utilisateur {#lespace_utilisateur}

Vous êtes toujours libres de créer une nouvelle page kwiki juste en
tapant son adresse dans votre navigateur.

Cependant, après un certain temps, cette page pourrait être protégée en
écriture. Vous ne pouvez alors y accéder qu\'avec un identifiant
utilisateur et un mot de passe.

C\'est ainsi car les spammers wiki abusent du kwiki pour accélerer leur
classement google.

Il y a trois moyens d\'obtenir un identifiant utilisateur.

-   s\'enregistrer comme membre actif de la FFII sur
    <http://aktiv.ffii.org/>
-   write to buero at ffii org and ask for kwiki write access (there is
    one catch to this, if you change your aktiv password, at the moment,
    as of 10 March 2005, your editor password still remains the old
    one - so if you have forgotten your aktiv password **first** have a
    new password sent to you by asking for it in aktiv.ffii.org and
    **then** ask buero - if that is not possible either ask buero anyway
    \... ;))
-   (en cas d\'urgence) envoyer un sms au +49 174 7313590 \"uid \$UID\"
    où \$UID est votre idantifiant utilisateur de aktiv.ffii.org

Vous devez néanmoins avoir un [ identifiant ffii](FfiiUidEn "wikilink")
avec une addresse et un numéro de téléphone, même si vous ne devenez pas
membre actif.

Nous pourront retirer cet accès en écriture au kwiki dès que nous auront
les moyens de résoudre le problème du spam wiki.

## The Administrator Perspective {#the_administrator_perspective}

The user:password files are created by the [
ffiiuidpass](FfiiUidPassEn "wikilink") script, invoked from aktiv2kwiki
every night. For Kwiki, the file /var/www/adm/auth_asolvl3 is used.

Input comes alternatively from the

-   [ ffii database](MlhtDbEn "wikilink"): users with asoc.asolvl \> 2
    (active users) have access by default
-   hand-edited files in the /var/www/adm directory
    -   -   auth_extra: these users have access at all levels
        -   auth_extra3: these users have access at level 3

To put someone\'s user and password into auth_extra, ask for that
person\'s [ ffii user id](FfiiUidEn "wikilink"). All user ids of the
database can be found in auth_asolvl0. Just copy the concerned line from
there. It might be sensible to briefly explain in auth_changelog when
and why you did it.

## Why by default only for active members? {#why_by_default_only_for_active_members}

The system becomes bloated and slow when the password files are big.
They must reside in memory or be searched in linear (line by line)
fashion. The current user:password file already contains nearly 200
records.

The entry barrier for FFII is very low. Membership fees are below 20 eur
per year. If someone wants to spend some time help maintain a page in
our documentation, he is likely to qualify as an \"active member\". Yet
there are far many more people who merely morally support us but do not
have the time to maintain kwiki pages. Thus setting the default
threshhold at asolvl \> 2 and having manual addition procedures for the
others is probably a reasonable procedure.

## How do pages become write-protected? {#how_do_pages_become_write_protected}

This is done by the [ kwikiprot](KwikiProtEn "wikilink") script which is
found on [ genba](GenbaEn "wikilink") in /var/www/adm/bin. kwikprot is
invoked via monthly.knecht from the knecht cronjob once per month.

## To Do {#to_do}

-   The procedure could be further improved by transferring the
    auth_extra information into the database. An extra table with a
    boolean field \"I wish to edit kwiki\" and a comment field plus a
    boolean field for administrator approval could do it. This could
    then also be edited via <http:aktiv.ffii.org>. Btw we also need an
    approval field for membership levels. Apart from this, the
    information as to whether someone is legally a member (has paid his
    fees etc) is also not well maintained yet.
-   We may need some anonymous accounts. In the current system everybody
    is identified. This eliminates not only wiki spammers but also
    blocks direct participation for anonymized informants.
