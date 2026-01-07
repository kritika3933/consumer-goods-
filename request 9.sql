 with cte1 as (
               select
                     c.channel,
                     round(sum((s.sold_quantity*g.gross_price)/1000000),2) as gross_sales_mln
                     from dim_customer c
         join fact_sales_monthly s
                     on c.customer_code = s.customer_code
         join fact_gross_price g
                     on s.product_code = g.product_code
         where s.fiscal_year = 2021
         group by c.channel
         )
         select 
               *,
               concat(round(gross_sales_mln*100/ (select sum(gross_sales_mln) from cte1),2)," %") as pct_contribution
         from cte1
         order by pct_contribution desc
         ;
