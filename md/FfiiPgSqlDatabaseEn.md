# The PostgreSQL database ffii on Genba {#the_postgresql_database_ffii_on_genba}

\--\> \[ [ ffii computing](PolisEn "wikilink") \]

------------------------------------------------------------------------

The !PostgreSQL database \[=ffii\] on genba stores stores information
concerning the FFII such as supporters and projects.

## Database Structure {#database_structure}

-   Mailing Lists and News Groups:
    [FfiiPgSqlDatabaseMlNgEn](FfiiPgSqlDatabaseMlNgEn "wikilink")
-   The Project Infrastructure as used by Knecht:
    <http://www.ffii.org/assoc/profil/profil.en.txt>
-   How to set up projects: [FfiiprojKreEn](FfiiprojKreEn "wikilink")
-   MLHT database for describing multilingual documents (comprises a
    selection of the tables in the database ffii):
    [MlhtDbEn](MlhtDbEn "wikilink")
-   Database Meta Data: [MlhtDbEn](MlhtDbEn "wikilink")
-   Hotels: [MlhtDbHotelsEn](MlhtDbHotelsEn "wikilink")

Some interesting tables and views related to structure:

-   \[=ffii.tmp_columns\]: An overview over table columns.
-   \[=ffii.tmp_locked_tables\]: An overview over locks on tables.

## Naming Convention {#naming_convention}

phm: For convenience of programming in Knecht and MLHT, I try to keep
table and field names limited to 8 a-z characters, and for convenience
of natural joins I want fields that are suitable for such joining to
have the same name and others not. Such constraints are a reason not to
use descriptive english words such as \'name\' or \'sum\', but thanks to
the pgsql documentation feature, this less intuitive naming should no
longer entail much of a drawback.

## Maintenace

When dumping the database for later import into a newer version of
!PostgreSQL, it is recommended to use the pg_dump tool from the
**newer** version.

## PostgreSQL Groups {#postgresql_groups}

-   \"basic_users\": This group is nice to have when adding new users
    that should not have write access to all tables right away, but that
    can be trusted read access (to all except the table pass). Note that
    when new tables are added to the database, \"basic_users\" doesn\'t
    automatically have read access to them. That needs to be set
    separately using \"GRANT\". Members of this group also have
    permissions to modify the database \"sandbox\" (they can e.g. create
    new tables, but they don\'t necessarily have access to all tables in
    that database!).

## [PhpPgAdmin](PhpPgAdmin "wikilink")

The FFII\'s !PostgreSQL databases can be accessed via the web using
!PhpPgAdmin:

<https://www.ffii.org/phppgadmin/>

In order for a user to log into !PhpPgAdmin, authentication needs to be
set to md5 (see \[=/etc/postgresql/pg_hba.conf\]) for the corresponding
user ID. Note that with authentication set to md5 the user cannot access
databases locally without specifying a password anymore: !PostgreSQL
allows only one authentication method to be specified per user and
connection type.
