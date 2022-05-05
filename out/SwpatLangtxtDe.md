\-\--\> \[ [SwpatLangtxtEn](SwpatLangtxtEn "wikilink") - english
version\]

------------------------------------------------------------------------

# Bedienung des Übersetzungssystems \"kurz und knapp\" {#bedienung_des_übersetzungssystems_kurz_und_knapp}

Versuch einer kurzen geschlossenen Darstellung für Neueinsteiger, wie
das Gesamtsystem bedient wird:

-   Account auf aktiv.ffii.org besorgen, der ist später für das
    Mailinterface zum Einstellen der Änderungen nötig.

```{=html}
<!-- -->
```
-   Zu bearbeitende Seite aussuchen.

```{=html}
<!-- -->
```
-   Bei Neuübersetzung (Zielsprache existiert noch nicht): Quellsprache
    auswählen, oben das \"TXT\"-Icon anklicken => Der Seitenquelltext
    erscheint. Ich lade die Datei immer mit \"wget\" direkt herunter,
    indem ich das Linkziel kopiere und direkt dem wget als Parameter
    gebe. Die Datei hat immer die Endung \".txl\".

```{=html}
<!-- -->
```
-   Bei Übersetzungsnachpflege (Zielsprache existiert bereits, ist aber
    falsch/unvollständig): Zielsprache auswählen, dort \"TXT\" drücken
    bzw. Link per wget herunterladen.

```{=html}
<!-- -->
```
-   Die \".txl\"-Datei ist immer UTF-8-kodiert. Ggf. vor der Bearbeitung
    in einem Editor umkodieren, z.B. mit \"recode utf-8..latin1
    XXX.txl\"

# Erklärung des Formats {#erklärung_des_formats}

Die Datei ist absatzweise organisiert. Im HTML-Quelltext stehen für
jeden Textteil nur Platzhalter, sowas wie \"Tjz\" oder \"oOs\", die
Namen sind mehr oder weniger zufällig. Diese Platzhalter finden sich in
der txl-Datei immer am Anfang eines Absatzes, gefolgt von einem
Doppelpunkt. Dahinter steht dann der Text, der tatsächlich später in der
landessprachlichen Version der Seite stehen soll. Dieser Text muss also
einfach ersetzt werden.

In der vom Server heruntergeholten txl-Datei ist jeder Absatz in einer
einzigen (teilweise sehr langen) Zeile. Diese Zeile darf beliebig
umgebrochen werden, solange die Klammerkonstrukte \"%(\...)\" in einer
Zeile bleiben. Vor dem nächsten Absatz muss laut Doku eine Leerzeile
stehen, daran erkennt der Prozessor, dass ein neuer Absatz anfängt.
Zumindest meine Erfahrung ist aber, dass jede Zeile, die mit
\"Wort-Doppelpunkt\" anfängt, als Absatzstart gewertet wird. Neben den
Leerzeilen sollte man also auch darauf achten, dass in keiner Zeile
mitten im Absatz das erste Wort sofort von einem Doppelpunkt gefolgt
wird.

Kommentierte Zeilen beginnen mit \"#\". Für alle bearbeiteten Absätze
muss dieses Doppelkreuz entfernt werden. Für alle anderen sollte das
nicht passieren. Achtung: Wenn ein Absatz auf mehrere Zeilen aufgeteilt
wird und dann trotzdem nicht beachtet werden soll, muss \_\_jeder\_\_
Zeile ein \"#\" vorangestellt werden.

# Eigentliche Arbeit an der Datei {#eigentliche_arbeit_an_der_datei}

-   WICHTIG - Bei Neu-Übersetzung: Die Sprache der Datei muss als
    **allererstes** auf die **Zielsprache** geändert werden - wird es
    vergessen **überschreibt** man die Ausgangssprache mit den
    Übersetzungen!!!

```{=html}
<!-- -->
```
-   Auskommentieren der Stellen die man übersetzen möchte und Löschen
    der Zeilen die man für diese Mail nicht übersetzen möchte

```{=html}
<!-- -->
```
-   Übersetzen der Zeilen die noch übrig sind und löschen von Zeilen die
    man jetzt doch nicht übersetzen kann

```{=html}
<!-- -->
```
-   Wenn die Übersetzung fertig ist, in den Footer (also die Zeilen ganz
    unten) Accountname und Passwort vom aktiv.ffii.org-Account
    eintragen. Dann das Dokument wie beschrieben per Mail an den
    Prozessor schicken. Ich lasse dabei immer die ISO-Latin-1-Kodierung
    und ändere die entsprechenden Angaben im Dokument. Wichtig (und
    entscheidend) ist aber insbesondere die Kodierungsangabe im Subject
    der Mail.

```{=html}
<!-- -->
```
-   Der Prozessor sollte eine Bestätigungsmail schicken, wenn die Datei
    bearbeitet wurde.

```{=html}
<!-- -->
```
-   Etwa 15 Minuten später sollte die neue Version auf ffii.org
    erscheinen.

```{=html}
<!-- -->
```
-   Wenn nach der Ersteinstellung weitere Änderungen am Dokument folgen,
    sollte \_\_immer\_\_ wieder eine frische txl-Datei vom Server geholt
    werden. Sonst gehen eventuell die Änderungen von anderen
    Mitarbeitern verloren. Ausnahme ist natürlich, wenn man weiß, dass
    man allein am Dokument arbeitet und innerhalb eines
    Übersetzungsdurchganges bereits Zwischenergebnisse verfügbar machen
    will.

```{=html}
<!-- -->
```
-   Zur Koordination der Übersetzer untereinander (damit nicht mehrere
    dieselbe Arbeit gleichzeitig machen) bietet sich die
    traduk-Mailingliste an. Leider hat sich aber meines Wissens noch
    kein Konsens darüber entwickelt.

------------------------------------------------------------------------

## Senden mit E-Mail-Programm {#senden_mit_e_mail_programm}

z.B. MS-Outlook unter Windows:

`An/To: mlhtimport at ffii.de`\
`Betreff/Subject: coding: iso-8859-1`\
`Nachrichtentext/Body: <Die Zeilen der neuen Version incl. Sprach-Code.>`

Sie können (vermutlich) keine Attachments verwenden, weil sie damit das
richtige Encoding nicht sicherstellen können!

Die Angabe der Codierung muss im Titel stehen, weil dies die einzige
uncodierte Zeile ist. Ist der Fussteil zum Beispiel in 16 bittigem
UTF-16, so kann eine entsprechende Optionszeile im Nachrichtentext schon
rein prinzipiell nicht dekodiert werden.

### Spezielle Tips für MS-Outlook-Express 6.0 {#spezielle_tips_für_ms_outlook_express_6.0}

MS-Outlook-Express 6.0 bietet bei neuen E-Mails die Option das Format zu
ändern. Dabei ist z.B. Westeuropäisch (ISO = iso-8859-1) voreingestellt.
In den erweiterten Einträgen findet sich auch ein Eintrag Unicode
(UTF-8). Wenn sie die Codierung umgestellt haben, dann erscheint ein
Vermerk \"(UTF-8)\" am Ende der Kopfzeile ihres Mail-Fensters. Sie
können sich eine derart konfigurierte Mail auch als Template, z.B. auf
den Desktop, abspeichern. Verwenden sie hierzu \"Speichern unter\".

MS-OE kann so konfiguriert werden, dass es die Zeilen für gesendete
Mails bis zu einer grössten Länge von 132 umbricht. Versuchen sie diesen
Wert auf das Maximum zu setzen und benutzen sie so viele manuelle
Zeilenumbrüche wie nötig vor und nach einem %(\...) Konstrukt. Viel
Glück, damit sie niemals ein Statement verwenden müssen, das eine Länge
von 132 Zeichen übersteigt.

### Commandline Recoding Tool for Windows {#commandline_recoding_tool_for_windows}

Auf der Homepage des freien universellen Packprogramms 7zip findet sich
das kleine Kommandozeilenprogramm [Convert Text
1.00](http://www.7-zip.org/dl/utils/ct100zip "wikilink") zum Download.
Seine Beschreibung kann man Online auf der Links-\>Utils Seite der [7zip
Homepage](http://www.7-zip.org "wikilink") nachlesen.

------------------------------------------------------------------------

Setzen sie Name und Passwort in den Optionen ihres Textes. Die
zugehörigen Accounts werden unter <http://aktiv.ffii.org> eingerichtet.

------------------------------------------------------------------------

Grosses Achtung:

Wenn sie Klammern öffnen, dann schliessen sie diese unbedingt wieder.
Dies kann die Übersetzung ihres Beitrags zum Abbruch bringen - sie
erhalten derzeit(!) aus technischen Gründen leider keine Rückmeldung des
Dienstes.

------------------------------------------------------------------------

## FAQ

Fragen:

-   1\. Bekommt man eine Bestätigung oder einen Reject vom Service?
-   2\. Sind die #-Zeichen und das Leerzeichen bei den Optionen auch
    wichtig?
-   3\. Welche Optionen sollte man unbedingt im Text haben? Welche soll
    man weglassen?
-   4\. Ist die HTML-Kopfzeile wichtig oder nicht?

Antworten:

-   1\. Ja, aber nur wenn die Software ohne Absturz über die Datei
    läuft.

Beispiel:

`From: mlhtimport at ffii.de`\
`Subject: compilation result`\
`Records title, sWW, ror and lpi were successfully imported into the database.`\
`Document cecms040202 was recompiled successfully in languages en and de.`

Anzumerken ist hierbei, dass sowohl die gänderte Seite (de) gemeldet
wird, wie auch Seiten die davon abhängig sind (en), hier weil dies eine
neue Seite ist und der entsprechende Link mit der Flagge noch nicht
existiert hat.

-   2\. Wichtig ist das führende \# + Leer, sowie der abschlieessende
    Strichpunkt.
-   3\. Kopieren sie alle Optionen, ändern sie Name, Passwort und
    (wichtig!) bei Bedarf die Sprache. Das Ziel-Encoding wird derzeit
    per Server-Einstellung auf utf-8 fixiert und sollte generell auch
    nicht geändert werden.
-   4\. Die HTML-Kopfzeile ist offenbar nicht wichtig, oder stört
    möglicherweise sogar die Bearbeitung. Lassen sie diese besser weg.

------------------------------------------------------------------------

### Fehler des mlhtimport Dienstes und des txl Datei Generators: {#fehler_des_mlhtimport_dienstes_und_des_txl_datei_generators}

-   Es gibt keine Antwort bei einem falschem Passwort, die Mail wird
    ignoriert.
-   Wenn sie eine txl Datei über das web-Interface (welches
    Web-Interface?) erhalten, dann werden (\...) nicht immer in
    %(pe:\...) stil umcodiert.
-   Wenn ihre E-Mail Software die Zeilen umbricht, und zwar zwischen
    einem %(\...) Ausdruck, dann könnte ihr Beitrag ohne weitere
    Nachricht schief gehen
-   Wenn ihre gesendete E-Mail Kommentar-Zeilen mit ( oder ) enthält und
    diese Zeile umgebrochen wird dass die Zeichen auf eigene Zeilen
    gelangen, dann könnte es passieren, das ihr Beitrag ohne Meldung vom
    Server fehlschlägt.
-   Wenn sie ihre Sprache neu erstellen, dann kann es vorkommen, dass
    sie die mlhtimport Bestätigung in einer völlig anderen Sprache
    erhalten. Wurde z.B. die Webseite für de, en und fr gändert - so
    wundern sie sich bitte nicht, wenn die E-Mail-Antwort ggf. in
    Englisch oder Französisch verfasst ist.
