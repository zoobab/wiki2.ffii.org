1.  1.  -\*- dok: wine05; lang: en; coding: iso-8859-1; mode:
        fundamental; -\*-

# Windows Emulation on GNU/Linux (Wine) hampered by Borland Patent {#windows_emulation_on_gnulinux_wine_hampered_by_borland_patent}

-\> \[ [ Patents in Action](SwpikxraniEn "wikilink") \| [
Borland](SwpatborlandEn "wikilink") \|
[EP1188110](http://swpat.ffii.org/patents/txt/ep/1188/110/ "wikilink")
\| [ EP Amendments](Amends05En "wikilink") \| [ Patent
News](SwpatcninoEn "wikilink") \]

------------------------------------------------------------------------

*In May 2005 it became apparent to a large public that some Microsoft
Windows programs could not be brought to run on Linux because of a
patent held by Borland. Affected GNU/Linux components were GCC and Wine.
A public dialogue with Borland began. Although Borland\'s
representatives repeated Borland\'s traditional attitude that patents
\"suck\" and are collected for defensive purposes only, the problem
appeared difficult to solve. The question moreover arises, which of the
legislative means currently under discussion in Europe would solve it.*

## News & Chronology {#news_chronology}

-   2005-05-12 US [ Borland: patents suck, no general solution for OSS
    available](Borland050512En "wikilink")
-   2005-05-12 US [Slashdot: Winelib Hobbled by Exception-Handling
    Patent](http://yro.slashdot.org/yro/05/05/12/1947213.shtml "wikilink")
-   2005-05-12 US [ZDNet: Wine development stifled by software
    patent](http://news.zdnet.co.uk/software/developer/0,39020387,39198258,00.htm "wikilink")
-   2005-05-12 US [Builder: Wine development stifled by software
    patent](http://uk.builder.com/programming/unix/0,39026612,39246157,00.htm "wikilink")
-   2005-05-01 DE [ Wine Conference](WineConf050501En "wikilink") \-- In
    a talk at the Developer Conference in Stuttgart Wine developer
    Dimitri O. Paun points out restrictions of Winelib development due
    to a Borland software patent. FFII\'s report about the conference
    sparks further media echo.

## Summary

In May 2005 it became apparent to a large public that the Windows
Emulator Wine can not function properly because of a patent held by
Borland. Wine emulates the Microsoft Windows environment under Linux, so
that programs such as Microsoft Office, that would normally not run
under Linux, can be run there. Wine is thus a crucial component for
bridging the compatibility barriers and enabling a fair competition of
the operating systems.

A public uproar on media such as Slashdot prompted a reaction from
Borland. As usual in such cases, previous contact attempts led nowhere
and if Borland grants a license this time, the free software projects
will still have a problem, because they will in some way have to
restrict the four freedoms associated with their code:

The Wine case can also be used as a test case for various provisions
proposed in the European Parliament, e.g. which interoperability
provision would solve it? which patentability provisions would kill the
patent? Under the Council\'s proposal, the full impact of the US
problems would come through to Europe.

## Links

-   [USPTO patent
    #5,628,016](http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=/netahtml/srchnum.htm&r=1&f=G&l=50&s1=5,628,016.WKU.&OS=PN/5,628,016&RS=PN/5,628,016 "wikilink")
-   [Gnu Compiler Collection](http://gcc.gnu.org/ "wikilink")
-   [Wine](http://www.winehq.com "wikilink")

## Claims of the US Patent {#claims_of_the_us_patent}

### Claim 1 {#claim_1}

In a development system for compiling source listings into program code
for operating a digital computer, said digital computer having a
microprocessor and a system memory, said source listings comprising data
and functions operative on said data, some of said data being stored in
stack-based variables which are local to a particular function, an
improved method for registering an exception handler with the computer,
the method comprising:

-   allocating a portion of said system memory to be stack memory, for
    last-in, first-out storage of stack-based variables associated with
    functions; and
-   for at least one function executed during runtime operation of the
    program code, registering an exception handler with the computer by:
    -   -   storing in said stack memory all stack-based variables
            associated with said at least one function, and
        -   after storage of all stack-based variables associated with
            said at least one function, pushing an exception
            registration record onto said stack memory describing a
            particular exception handler which is to be invoked upon
            occurrence of any exceptions which arise during operation of
            said at least one function, paid exception registration
            record storing a pointer to a previous exception
            registration record registered for another function whose
            execution has begun but has yet to complete, wherein said
            exception registration record describing a particular
            exception handler is stored on one end of said stack memory
            during execution of said at least one function.

## Borland patents at the EPO {#borland_patents_at_the_epo}

According to [Depatisnet](http://www.depatisnet.de/ "wikilink") family
search, the [US patent
#5,628,016](http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=/netahtml/srchnum.htm&r=1&f=G&l=50&s1=5,628,016.WKU.&OS=PN/5,628,016&RS=PN/5,628,016 "wikilink")
was applied for in the USA only and thus does not have any European
cousins.

A search in the FFII\'s epat database yielded a few similar patents
owned by Borland which show that the European Patent Office\'s
technicity requirements are no serious obstacle to the granting of
similar patents in Europe. In fact the Borland patents are precisely the
kind of software patents which the EPO would like to be seen as
granting: improvements in speed and use of data space for computing in
general (without much of a drift toward specific application in the area
of business processes). The most recent granted Borland application
[EP1188110](http://swpat.ffii.org/patents/txt/ep/1188/110/ "wikilink")
(about use of variables in programming languages) directly uses the
EPO\'s new magic formula \"computer-implemented invention\", which was
introduced in 2000 and written into the examination guidelines in 2001.

-   [EP1188110](http://swpat.ffii.org/patents/txt/ep/1188/110/ "wikilink")
-   [EP0615200](http://swpat.ffii.org/patents/txt/ep/0615/200/ "wikilink")
-   [EP0483664](http://swpat.ffii.org/patents/txt/ep/0483/664/ "wikilink")
-   [EP0528599](http://swpat.ffii.org/patents/txt/ep/0528/599/ "wikilink")
-   [EP0602790](http://swpat.ffii.org/patents/txt/ep/0602/790/ "wikilink")
-   [EP0602790](http://swpat.ffii.org/patents/txt/ep/0602/845/ "wikilink")
-   [EP0588502](http://swpat.ffii.org/patents/txt/ep/0588/502/ "wikilink")

## Effects of the EP Amendments {#effects_of_the_ep_amendments}

Various groups of the European Parliament have proposed [
amendments](Amends05En "wikilink") which reinstate a meaningful
interpretation of the European Patent Convention. The effects of these
on the above example patents could be that

-   the patents are not granted/upheld because
    -   -   the claimed objects are regarded as programs for computers
            in the context of patent law (Kauppi/Zwiefka/NGL definition
            of program for computers)
        -   improvements in processing speed are not technical
            contributions (Art 4B)
        -   data processing is not a field of technology (Art 3A)
-   the use of the patents for making MS Windows programs run on Linux
    falls under the interoperability exemption of Art 6a and is not an
    infringment
    -   -   However it is unsure whether SEH is introduced \"for the
            sole purpose of ensuring interoperability\", since it also
            improves compilation efficiency
        -   The interoperability exception would thus be useless if
            program claims (Art 5(2)) are allowed
        -   Even if the Borland patents are upheld without program
            claims, Winelib would still have to restrict the scope of
            use of their SEH-related code and thereby violate provisions
            of the GNU GPL. In a strict sense, Wine would become
            non-free software.

This short cursory analysis shows that the interoperability amendment
(in some of its variants) can alleviate the problem but only the
patentability amendments can solve it.
