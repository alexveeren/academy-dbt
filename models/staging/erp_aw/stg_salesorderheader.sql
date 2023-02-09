with
    source_salesorderheader as(
        select
            salesorderid as id_salesorder
            , customerid as id_custumer
            , salespersonid as id_salesperson
            , territoryid as id_territory
            , billtoaddressid as id_billtoaddress
            , shiptoaddressid as id_shiptoaddress
            , shipmethodid as id_shipmethod
            , creditcardid as id_creditcard
            , currencyrateid as id_currencyrate
            , orderdate
            , duedate
            , shipdate
            , revisionnumber
            , status
            , onlineorderflag
            , purchaseordernumber
            , accountnumber
            , creditcardapprovalcode
            , subtotal
            , taxamt
            , freight
            , totaldue
            , comment
            , rowguid
            , modifieddate
        from {{ source('aw', 'salesorderheader') }}
    )

select*
from source_salesorderheader