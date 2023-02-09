with
    source_creditcard as(
        select
            creditcardid as id_creditcardid
            , cardtype
            , cardnumber
            , expmonth
            , expyear
            , modifieddate
        from {{ source('aw', 'creditcard') }}
    )

select *
from source_creditcard