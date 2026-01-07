  with cte1 as(
          SELECT 
                   *
          from fact_pre_invoice_deductions
          join dim_customer c
               using (customer_code)
          where fiscal_year = 2021
          and c. market = 'india'
          )
        select 
             customer_code,
             customer,
             concat(round(avg(pre_invoice_discount_pct)*100,2),"%") as avg_discount_pct
        from cte1
        group by customer_code, customer
        order by avg(pre_invoice_discount_pct)*100 desc
        limit 5
        ;
