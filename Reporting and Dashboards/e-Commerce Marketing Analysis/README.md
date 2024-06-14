# e-Electronics Sales Analysis

e-Electronics is an e-commerce company that sells popular electronics to customers worldwide, having sold more than 100K orders since its inception in 2019. I performed an exploratory analysis of their under-utilized core marketing data to investigate yearly sales trends, product performance, marketing channel performance, and loyalty program efficacy for presentation to cross-functional teams and to drive company recommendations.

The SQL scripts and entity relation diagram (ERD) can be found [here](./sql_analysis/). The Excel workbook can be found [here](./excel_workbook/).

## Interactive Tableau Dashboard

The interactive dashboard can be found in Tableau Public [here](https://public.tableau.com/app/profile/astrosica/viz/e-ElectronicsSales/Dashboard). This dashboard enables users to filter by customer region, country, and country code, focusing on sales and marketing metrics.

![tableau-dashboard](https://github.com/jessicacampbell-astro/e-Electronics_sales_analysis/assets/23153120/33be2c24-cdeb-4f77-9b89-b8b4a4f59a32)

## Summary of Insights

**Yearly trends:** Between 2019 and 2022, the total revenue exceeded $28 million over 100K orders with an AOV of $260. In particular, 2020 saw the highest growth across the board along with the greatest revenue ($10.2 million) and highest AOV ($300), potentially related to increased pandemic spending. Meanwhile, 2021 saw the highest number of orders (36K).

**Seasonality:** November and December tend to see the highest growth in orders and revenue while January and February see the lowest growth, possibly related to trends in holiday spending. March 2020 saw the highest growth in the number of orders and total revenue, possibly due to pandemic purchases.

**Product performance:** The Apple AirPods Headphones were consistently the most popular product, with 48K sales for a total revenue of $7.7 million. The 27in 4K Gaming Monitor consistently brought in the most revenue for a total of $9.9 million over 23K sales. In contrast, the Bose Soundsport Headphones were consistently the least popular product, bringing a total revenue of $3.3K over 27 sales.

![product_performance](https://github.com/jessicacampbell-astro/e-Electronics_analysis/assets/23153120/77ccc229-490d-4a53-af9d-b2b3ee5daca4)

**Product performance by region:** The AirPods Headphones are the most popular product across all regions, having sold 18,574 items ($3.1 million) in NA, 11,227 items ($1.7 million) in EMEA, 4,226 items ($0.6 million) in APAC, and 1,911 items ($0.3 million) in LATAM.

**Marketing channel performance:** The direct marketing channels brought in both the highest number of orders (84K) and total revenue ($23.2 million) while social media brought in both the lowest number of orders (1.3K) and total revenue ($300K). While direct marketing channels brought in the highest number of loyalty members (23K), the email marketing channel had the highest loyalty program signup rate (58%), second to those that were unknown (59%). 

**Loyalty program efficacy:** The loyalty program is gaining popularity, increasing from 12% of customers in 2019 to 52% in 2022. Last year, loyalty members made 1K more purchases than non-loyalty customers, spending $30 more on average and bringing in $500K more in revenue.

**Refund rates:** The ThinkPad Laptop (12%) and Macbook Air Laptop (11%) have the highest refund rates, while the Apple Airpods Headphones (2,636) and 27in 4K Gaming Monitor (1,444) have the highest number of refunds.

## Recommendations

The team provides the following recommendations:

- Prioritize marketing incentives on high-performing items like the Apple AirPods Headphones and 27in 4K Gaming Monitor.
- Work with the products team to investigate the poor product performance of the Bose Soundsport Headphones and identify a replacement.
- Incentivize email marketing channels to increase customer loyalty signup rate.
- Continue the loyalty program and work with data analyst teams to monitor yearly growth and revenue.
- Work with the products team to investigate the high refund rates of the ThinkPad Laptop and Macbook Air Laptop while improving product descriptions and photos.

## Contact

Feel free to contact me on [LinkedIn](https://www.linkedin.com/in/jessicacampbell-astro/)!
