# Regional-Profitability-Discount-Impact

# Project Overview

* This project explores the relationship between discount levels and profit margins using SQL correlation analysis. By grouping data by region (state) and product category,    the project highlights where discount strategies are effective — and where they might be hurting profits.

* The final results are visualized in a dashboard to make insights easy to interpret.

## SQL Logic Summary

* The solution is built using CTEs (Common Table Expressions) for clarity and modularity:

## region_profit CTE: 
* Joins the Sales, Customer, and Product tables.
## Calculates:
* Average Discount and Profit per region and category.
* Correlation between Discount and Profit (corr() function).
## flagged_regions CTE:
* Flags regions based on the correlation value:
* ⚠️ Discount reduces profit → Negative correlation
* ✅ Discount increases profit → Positive correlation
* ❕ No clear relationship → Neutral correlation

## Final Output:
* Displays Region, Category, Average Discount, Average Profit, Correlation, and Impact Flag.
* Results sorted by Region and Category.

## Key Insights
* Identifies regions where discounts harm profitability.
* Highlights categories where discounts boost sales and profit.
* Provides data-driven guidance for pricing and promotion strategies.
