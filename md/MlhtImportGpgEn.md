1.  1.  -\*- dok: [MlhtImportGpg](MlhtImportGpg "wikilink"); lang: en;
        coding: iso-8859-1; mode: fundamental; -\*-
    2.  datum: 2005-10-11

# Guarding Privacy of Passwords/Messages sent to Mlhtimport {#guarding_privacy_of_passwordsmessages_sent_to_mlhtimport}

-\> \[ [ Mlht Import](MlhtImportEn "wikilink") \| [ Translation
Managment](SwpatLangtxtEn "wikilink") \| [ Project
News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

Translation mails sent to mlhtimport at ffii org need to specify a user
and password. These are checked and discarded before they are entered
into the queue of the emacs-based mlht import batch processor. Moreover,
the mails can be encrypted with pgp or gpg. We explain how this works.

## Password Check {#password_check}

The program genba:/var/www/adm/bin/mlhtimport checks login and password
based on the crypt-ed password that is stored in the ffii database. If
the check succedes, the password is removed and the mail is stored on
disk. If it does not succeded, the mail is discarded and an error
reported.

## Encryption Using GPG {#encryption_using_gpg}

In order to provide additional safety for your password, you may want to
encrypt your message with PGP or GPG, using the [public key of
knecht](http://www.ffii.org/assoc/knecht/pubkey.asc "wikilink") which
you must have imported into your keyring.

You would send an encrypted french translation restart0501.fr.txl as
follows:

` $ gpg -ea -r knecht -o - restart0501.fr.txl | mailx -s coding:iso-8859-1 mlhtimport@ffii.org`

See

` $ gpg --help`

for explanations of what the commandline options mean.

You can also register your own public key in the knecht keyring by
simply enclosing it in a translation mail.
