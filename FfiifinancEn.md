1.  1.  -\*- dok: ffiifinanc; lang: en -\*-

# Crediting and Debiting for FFII {#crediting_and_debiting_for_ffii}

-\> \[ [ Priorities](FfiiprojPriorEn "wikilink") \| [
fundraising](SarjiEn "wikilink") \| [discussion mailing
list](http://lists.ffii.org/mailman/listinfo/financ-parl/ "wikilink") \|
[news mailing
list](http://lists.ffii.org/mailman/listinfo/financ-news/ "wikilink") \]

------------------------------------------------------------------------

*monitoring the financial situation of FFII, generating regular
reports.*

## News & Chronology {#news_chronology}

-   [Konto0510En](Konto0510En "wikilink"): accounting work for GA 2005

## People in charge {#people_in_charge}

-   current data & reporting: lacreigh, jahleff
-   legacy data until 2005-07: blasum
-   financial controllers Roland Orre and Christoph Pinkel
-   external accounting experts
-   (volunteers welcome)

## Further documentation {#further_documentation}

-   <http://www.ffii.org/money/>

## Database Structure {#database_structure}

Data are in the [ ffii database](MlhtDbEn "wikilink") in tables
\'ledger\' et al.

### Tables

-   ledger
    -   -   id \| amount \| local \| uid \| cc \| event \| bookdate \|
            settdate \| voucher \| ispublic \| corrects \| utid \| rmk
            \| budget \| fix
        -   id: transaction identifier as automatically assigned by
            database (used nowhere else)
        -   amount: amount in currency (usually eur since 2002-01-01,
            except for paypalgb, paypalus)
        -   local: mode of payment, using which kind of payment media
            (savings: savings account; giro: giro account; paypaleu: EUR
            bookings on paypal account; paypalgb: GBP bookings on paypal
            account; paypalus: USD bookings on paypal account;
            moneybookers: moneybookers account; dtaus: direct debit;
            cash: Munich cash box; eccard: Brussels cash card; ccard:
            credit card)
        -   uid: ffii user id, should be referencing pnom, partially
            uses finaddr
        -   cc: category/account
        -   event: event to which transaction is related
        -   bookdate: date at which transaction was booked
        -   settdate: date at which transaction was settled
        -   voucher: identifier of a piece of paper that testifies a
            transaction
        -   ispublic: in case of donations, whether they can be
            publicised
        -   corrects: unused?
        -   utid: reference symbol used internally by bank
        -   rmk: remark, either from the bank transaction\'s remark
            field or, in case of cash, from ffii accountants
        -   budget: unused? (attempt of a second categorisation that
            might be needed for reporting to sponsors)
        -   fix: \<0 if the receipt should be improved, else \>0
        -   contactperson: where to get better documentation
        -   contactstatus: contact status
        -   ledger_lexware_number: number (Belegnummer) in lexware
            system (C Schuster import 26 Nov 2005)
        -   ledger_lexware_numberrange: number range (Belegnummernkreis)
            in lexware system
        -   printed: helper field (printed and signed by Jochen Ahleff
            before 18 Jan 2006)
        -   olduid: helper field (uid before uid cleanup 23 Jan 2006)
-   ledger_addr (reduplication of pnom etc for purposes of ledger)
    -   -   uid
        -   finpnom, finland, finplz, finurb, \...
-   ledger_balance: (redundant) balance information to check integrity
    of ledger data
    -   -   local: see explanation of \'local\' in ledger
        -   amount: amount in currency
        -   date: date of balance
-   ledger_cc: \'old\' (non-numeric) cost types of ledger, superseded by
    ledger_lexware_accountsystem
    -   -   cc category/account primary key
        -   ccrem remark explaining this category
        -   sign -1 if this is an expense-only category, +1 if this is
            an income-only category (mixing income and expenses is not
            ok)
-   ledger_event: \'old\' (non-numeric) cost centers of ledger,
    superseded by ledger_lexware_costcenter
-   ledger_giro: numbering of giro account bookings as done by C
    Schuster ca 15 Nov 2005
-   ledger_lexware_accountsystem: four-digit account system of lexware
    (cost types), defined as extension/adaptation of
    [SKR03](SKR03 "wikilink") on 25 Nov 2005
-   ledger_lexware_book: raw lexware data reimported into database 27
    Nov 2005
-   ledger_lexware_costcenter: four-digit cost centers, defined 25 Nov
    2005
-   ledger_vocabulary: de/en vocabulary of some accounting terms

### Scripts
