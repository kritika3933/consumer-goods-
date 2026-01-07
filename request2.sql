with cte1 as (
         select count(distinct product_code) as unique_product_2020
         from fact_sales_monthly
         where fiscal_year = 2020
         ), 
         cte2 as (
         select count(distinct product_code) as unique_product_2021
         from fact_sales_monthly
         where fiscal_year = 2021 
         )
        select 
              unique_product_2020,
              unique_product_2021,
              (unique_product_2021-unique_product_2020)*100/unique_product_2020 as pct_change
        from cte1
        cross join cte2
        ;