with cte1 as(
              select 
                    p.division,
                    s.product_code,
                    concat(p.product," (", p.variant,")") as product, 
                    sum(s.sold_quantity) as total_sold_qty,
                    rank() over(partition by p.division order by sum(s.sold_quantity) desc) as  rank_order
         from dim_product p
         join fact_sales_monthly s 
                    on p.product_code = s.product_code
         where fiscal_year = 2021
         group by p.division,s.product_code,p.product
         )
         select 
                *
         from cte1
         where rank_order in (1,2,3)
         order by division, rank_order asc
         ;