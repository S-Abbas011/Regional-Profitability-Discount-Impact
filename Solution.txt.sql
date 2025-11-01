Business Question:
How do discounts affect profitability across regions and product categories?
SQL Task:
•   Join Orders and Regions.
•   Compute correlation between Discount and Profit.
•   Group by Region and Category.
•   Flag regions where higher discounts reduce overall profit.'

WITH region_profit AS (
select c.state AS region,p.category,avg(s.discount) AS avg_discount,
avg(s.profit) AS avg_profit,
corr(s.discount, s.profit) AS discount_profit_corr 
from sales AS s
join customer AS c 
on s.customer_id = c.customer_id
join product AS p 
ON s.product_id = p.product_id
group by c.state, p.category
),

flagged_regions AS (
select region,category,avg_discount,avg_profit,discount_profit_corr,
CASE 
    WHEN discount_profit_corr < 0 THEN '?? Discount reduces profit'
    WHEN discount_profit_corr > 0 THEN '? Discount increases profit'
    ELSE 'No clear relationship'
    END as discount_impact_flag
from region_profit
)
SELECT *
FROM flagged_regions
ORDER BY region, category;

