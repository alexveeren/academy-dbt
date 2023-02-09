with
    source_address as(
        select
            addressid as id_address
            , addressline1
            , addressline2
            , city
            , stateprovinceid as id_stateprovince
            , postalcode
            , spatiallocation
            , rowguid
            , modifieddate
        from {{ source('aw', 'address') }}
    )

select *
from source_address
