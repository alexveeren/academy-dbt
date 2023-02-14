with
    address as (
        select *
        from {{ ref('dim_address') }}
    )

    , creditcard as (
        select *
        from {{ ref('dim_creditcard') }}
    )

    , customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , product as (
        select *
        from {{ ref('dim_product') }}
    )
        
    , reason as (
        select *
        from {{ ref('dim_reason') }}
    )

    , orderdetals as (
        select *
        from {{ ref('int_sales__orderdetails') }}
    )

    
    , juncao as (
        select
            orderdetals.id_salesorder as fk_salesorder
            , orderdetals.id_customer as fk_customer
            , orderdetals.id_product as fk_product
            , orderdetals.id_salesperson
            , orderdetals.id_territory
            , orderdetals.id_billtoaddress
            , orderdetals.id_shiptoaddress
            , orderdetals.id_shipmethod
            , orderdetals.id_creditcard
            , orderdetals.id_currencyrate
            , orderdetals.orderdate
            , orderdetals.duedate
            , orderdetals.shipdate
            , orderdetals.status
            , orderdetals.subtotal
            , orderdetals.taxamt
            , orderdetals.freight
            , orderdetals.totaldue
            , orderdetals.orderqty
            , orderdetals.unitprice
            , orderdetals.unitpricediscount
        from orderdetals

        left join address on orderdetals.id_billtoaddress = address.id_address and orderdetals.id_shiptoaddress = address.id_address
        left join creditcard on orderdetals.id_creditcard = creditcard.id_creditcard
        left join customer on orderdetals.id_customer = customer.sk_customer
        left join product on orderdetals.id_product = product.id_product
        left join reason on orderdetals.id_salesorder = reason.id_salesorder
    )

    , transformed as (
        select
        {{ dbt_utils.surrogate_key(['fk_salesorder', 'fk_product']) }} as sk_sales
        , *
        , unitprice * orderqty as total_gross
        , (1 - unitpricediscount) * unitprice * orderqty as total_net
        from juncao
    )

select *
from transformed