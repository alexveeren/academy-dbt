with
    source_salesreason as(
        select
            salesreasonid as id_salesreason
            , name as salereason
            , reasontype
            , modifieddate
        from {{ source('aw', 'salesreason') }}
    )

select *
from source_salesreason