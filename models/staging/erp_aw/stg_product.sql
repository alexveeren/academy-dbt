with
    source_product as(
        select
            productid as ip_product
            , productsubcategoryid as id_productsubcategory
            , productmodelid as id_productmodel
            , name as productname
            , productnumber
            , makeflag
            , finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , "size" as product_size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , weight as product_weight
            , daystomanufacture
            , productline
            , class
            , style
            , sellstartdate
            , sellenddate
            , discontinueddate
            , rowguid
            , modifieddate
        from {{ source('aw', 'product') }}
    )

select *
from source_product