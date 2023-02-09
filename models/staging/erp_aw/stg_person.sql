with
    source_person as(
        select
            businessentityid as id_businessantity
            , persontype
            , namestyle
            , title
            , firstname
            , middlename
            , lastname
            , suffix
            , emailpromotion
            , additionalcontactinfo
            , demographics
            , rowguid
            , modifieddate
        from {{ source('aw', 'person') }}
    )

select *
from source_person