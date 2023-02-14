with
    source_customer as(
        select
            customerid as id_customer
            , personid as id_person
            , storeid as id_store
            , territoryid id_territory
            , rowguid
            , modifieddate
        from {{ source('aw', 'customer') }}
    )

select *
from source_customer