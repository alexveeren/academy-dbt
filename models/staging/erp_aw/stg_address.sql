with
    source_address as(
        select
            addressid as id_address
            , stateprovinceid as id_stateprovince
            , addressline1
            , addressline2
            , city
            , postalcode
            , spatiallocation
            , rowguid
            , modifieddate
        from {{ source('aw', 'address') }}
    )

select *
from source_address
