with
    source_salesorderheadersalesreason as(
        select
            salesorderid as id_salesorder
            , salesreasonid as id_salesreason
            , modifieddate
        from {{ source('aw', 'salesorderheadersalesreason') }}
    )

select *
from source_salesorderheadersalesreason