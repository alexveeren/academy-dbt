with
    header as (
        select *
        from {{ ref('stg_salesorderheader') }}
    )


    , orderdetals as (
        select *
        from {{ ref('stg_salesorderdetail') }}
    )

    , joined as (
        select
            row_number() over (order by id_customer) as sk_salesorder
            , header.id_salesorder
            , header.id_customer
            , orderdetals.id_product
            , header.id_salesperson
            , header.id_territory
            , header.id_billtoaddress
            , header.id_shiptoaddress
            , header.id_shipmethod
            , header.id_creditcard
            , header.id_currencyrate
            , header.orderdate
            , header.duedate
            , header.shipdate
            , header.status
            , header.subtotal
            , header.taxamt
            , header.freight
            , header.totaldue
            , orderdetals.orderqty
            , orderdetals.unitprice
            , orderdetals.unitpricediscount
        from header
        left join orderdetals on header.id_salesorder = orderdetals.id_salesorder
    )

select *
from joined