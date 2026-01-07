 with unique_products as(
           select
                 p.segment, 
                 count(distinct(case when fiscal_year = 2020 then s.product_code end)) as product_count_2020,
                 count(distinct(case when fiscal_year = 2021 then s.Product_code end)) as product_count_2021
           from fact_sales_monthly s
           join dim_product p
                on s.product_code = p.product_code
           group by p.segment
           )
        select 
               *,
               product_count_2021-product_count_2020 as difference
        from unique_products
        order by difference desc
        ;