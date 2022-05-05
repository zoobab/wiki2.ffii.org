# Hotels and Related Tables in FFII/MLHT Database {#hotels_and_related_tables_in_ffiimlht_database}

\--\> \[ [ PgSQL Database ffii](FfiiPgSqlDatabaseEn "wikilink") \| [
MLHT Database](MlhtDbEn "wikilink") \| [ Aktiv](AktivEn "wikilink") \| [
Events](SwpatpenmiEn "wikilink") \]

------------------------------------------------------------------------

Users only fill in the table HOTNOKTS. The other tables define what is
offered. An [ aktiv](AktivEn "wikilink") application will mainly have to
use HOTNOKTS and HOTRMS, but all others are useful too.

## Table VENDOK {#table_vendok}

Primary table for defining events

-   VEN: event ID (8 characters)
-   DOK: related mlht document (defined in table MLHTDOK + DOKPROP etc)
-   VENDAT: date when the event begins
-   VENDATZ: date when the event ends (optional)
-   VENPUB: whether the event can be published for subscription in [
    aktiv](AktivEn "wikilink"), default \'true\'
-   LAND: country where the event takes place (two-digit ISO code)
-   LOK: location (address) wihin country where the event takes place

## Table HOTELS {#table_hotels}

Primary table for defining possibly available hotels

-   HOTEL: hotel ID (8 characters)
-   HOTNOM: name of the hotel (text)
-   VALUT: currency used for paying (default \'eur\')
-   HOTURL: hotel\'s website (text)
-   HOTREM: remarks about the hotel (text)

## Table HOTRMS {#table_hotrms}

Primary table for defining types and instances of hotel rooms

-   HOTEL: refers to HOTEL of table HOTELS
-   HOTRM: room type or instance ID (maximum 8 characters)
-   NBEDS: number of used beds in room
-   HRMSZ: size of hotel room
-   BEDPR: price per used bed
-   NETPR: additional price of internet/wlan (null if not available, 0
    if included)

## Table VENHOTS {#table_venhots}

How many rooms in which hotels are available for an event?

-   VEN: event, refers to VEN in table VENDOK
-   HOTEL: hotel, refers to HOTEL in table HOTELS
-   HOTRM: hotel room (class or instance), refers to HOTRM in table
    HOTRMS
-   HOTNOKT: date when the room becomes available for staying over night
-   NHOTRMS: number of rooms of this class that become available
-   DELTAKM: distance from event location in km

## Table HOTNOKTS {#table_hotnokts}

Who stays where on which days?

-   UID: person (refers to table PNOM, add a record there if the person
    is not known to the system yet)
-   HOTEL: hotel, refers to HOTEL of table HOTELS
-   HOTRM: hotel room, refers to HOTRM of table HOTRMS
-   HOTNOKT: date when the room becomes available for staying over night
