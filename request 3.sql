    select 
              segment,
              count(distinct product_code) as  Product_count
        from dim_product
        group by segment
        order by Product_count desc
        ;
