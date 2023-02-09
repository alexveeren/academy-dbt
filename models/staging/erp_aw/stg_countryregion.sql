with
    source_countryregion as(
        select
            countryregioncode
            , name as country_name
            , modifieddate
        from {{ source('aw', 'countryregion') }}
    )

select *
from source_countryregion