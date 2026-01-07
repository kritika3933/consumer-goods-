 Select
             monthname(s.date) as Month ,
             s.fiscal_year as Year,
             sum(sold_quantity*gross_price) as Gross_sales
        from fact_sales_monthly s
        join fact_gross_price g
             on s.product_code = g.product_code
        join dim_customer c
             on s.customer_code = c.customer_code
        where customer = "AtliQ Exclusive"
        group by month,year
        order by year asc 
        ;
