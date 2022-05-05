Original text: <http://www.april.org/~mota/ffii/Feedback040610Fr>

------------------------------------------------------------------------

# Mailing de la manifestation en ligne contre les brevets logiciels 2004-06-10 {#mailing_de_la_manifestation_en_ligne_contre_les_brevets_logiciels_2004_06_10}

-\> [AT](http://kwiki.ffii.org/?FeedbackAt040610De "wikilink"),
[DE](http://kwiki.ffii.org/?FeedbackDe040610De "wikilink"),
[EN](http://kwiki.ffii.org/?Feedback040610En "wikilink")

------------------------------------------------------------------------

`#! /bin/bash`\
`me=${0##*/}`\
`if [ $# -ne 0 ]; then`\
` cat >&2 <<END`\
`Usage: $me <<EOF`\
`UID E_MAIL`\
`...`\
`EOF`\
`END`\
` exit 2`\
`fi`

`# Some systems may need sendmail options like -t -oi -oem or -o8`\
`: ${SENDMAIL:=/usr/sbin/sendmail -t -oi -oem}`

`CHARSET=iso-8859-15`\
`SUBJECT="Appel urgent & manifestation web"`\
`SUBJECTCODE="eleg0406_fr"`

`while read U_ID E_MAIL; do`\
` echo "Sending to: $U_ID <$E_MAIL>" >&2`\
` case $U_ID in`

-   -   \[!a-z0-9\_\]\*)

``    echo "$me: \`$U_ID': invalid user id" >&2 ``\
`   continue`\
`   ;;`\
` esac`\
` case $E_MAIL in`\
` ?*@?*.?*)`\
`   ;;`

-   -   )

``    echo "$me: \`$E_MAIL': invalid e-mail address" >&2 ``\
`   continue`\
`   ;;`\
` esac`

` RECIPIENTCODE=$U_ID`\
` OPENING="Cher soutien de la FFII"`

` # This is used to recognize replies by the In-Reply-To header`\
` MESSAGE_ID="<$RANDOM.$SUBJECTCODE.$RECIPIENTCODE.$USER@$HOSTNAME>"`

` $SENDMAIL <<EOF`\
`MIME-Version: 1.0`\
`From: feedback@ffii.org`\
`To: $E_MAIL`\
`Subject: $SUBJECT`\
`Message-ID: $MESSAGE_ID`\
`Content-type: text/plain; charset=$CHARSET`\
`Content-Transfer-Encoding: 8bit`

`$OPENING,`

`Les éléctions du parlement européen ont commencé.`

`Comme vous le savez, le parlement européen peut nous sauver de la`\
`directive sur les brevets logiciels et autres projets de loi négatifs.`\
`Vous pouvez vous informer sur`

`        `[`http://kwiki.ffii.org/ElectAct0405Fr`](http://kwiki.ffii.org/ElectAct0405Fr)

`avant de voter. Cette page liste quelques actions que vous pouvez faire`\
`en plus, y compris la participation à la`

`        Manifestation en ligne contre les brevets logiciels`\
`        `[`http://kwiki.ffii.org/ElectWebdemo0406Fr`](http://kwiki.ffii.org/ElectWebdemo0406Fr)

`Il y a aussi l'autre`

`        Appel urgent`\
`        `[`http://swpat.ffii.org/letters/cons0406/index.fr.html`](http://swpat.ffii.org/letters/cons0406/index.fr.html)

`à signer et à distribuer. Cet appel peut nous aider à empêcher que la décision`\
`récente du conseil soit décrétée.`

`Pour nous aider à coordoner les actions, veuillez `**`répondre`**` à ce`\
`courrier éléctronique (le forward ne marchera pas) et le remplir ('+'`\
`pour oui, '-' pour non ou completez le texte requis):`

`[] Je soutiens la FFII et donc les messages comme celui-ci sont`\
`   les bienvenus.`\
`[] Je participerait à la manifestation en ligne ce week-end et je`\
`   bloquerait temporairement ma page web `[`http://__`](http:// "wikilink")\
`[] Je signe l'Appel Urgent.`\
`[] Je suis d'accord pour que ma signature soit publiée.`

`Merci pour votre compréhension et votre soutien.`

`Sincèrement,`

`le conseil d'administration de la FFII.`

`EOF`\
`sleep 1`\
`done`
