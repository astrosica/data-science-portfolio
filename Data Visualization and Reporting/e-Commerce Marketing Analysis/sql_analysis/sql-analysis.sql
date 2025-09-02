-- Are there certain products that are getting refunded more frequently than others?

-- Join orders and order_status tables to match products with refund status.
-- Consolidate and validate product names using CASE.
-- Create helper column to identify refunds (1 = refund, 0 = no refund).
-- Sum helper column for total number of refunds.
-- Average helper column for refund rate; convert to percent (x 100) and convert to integer.
-- Order by descending refund rate to see products with highest refund rates.

SELECT
  CASE
    WHEN orders.product_name LIKE '%gaming monitor' THEN '27in 4K Gaming Monitor'
    WHEN orders.product_name LIKE 'bose%' THEN INITCAP(orders.product_name, ' ')
    ELSE orders.product_name
  END AS product_cleaned,
  SUM(CASE
      WHEN order_status.refund_ts IS NOT NULL THEN 1
      ELSE 0 END) AS refunds,
  CAST(ROUND(AVG(CASE
      WHEN order_status.refund_ts IS NOT NULL THEN 1
      ELSE 0 END)*100,0) AS INTEGER) AS refund_rate
FROM core.orders
JOIN core.order_status
ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 3 DESC;

-- Within each region, what is the most popular product?

-- Join orders, customers, and geo_lookup tables to match regions and orders.
-- Use a CTE to add total number of orders and total price sold per region.
-- Use another CTE and ROW_NUMBER() to rank the results by descending number of orders within each region.
-- Filter results to show top product sold in each region (i.e., where rank = 1).

WITH sales_by_product AS (
  SELECT geo_lookup.region,
    orders.product_name,
    COUNT(orders.product_name) AS orders,
    ROUND(SUM(orders.usd_price),2) AS price
  FROM core.orders
  JOIN core.customers
  ON orders.customer_id = customers.id
  JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country
  GROUP BY 1, 2
  ORDER BY 1, 3 DESC),

 product_ranking AS (
  SELECT *,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY orders DESC) AS ranking
  FROM sales_by_product)

SELECT region,
  product_name,
  orders,
  price
FROM product_ranking
WHERE ranking = 1
ORDER BY 3 DESC;

-- What are the quarterly trends for order count, sales, and AOV for all products sold in North America across all years?

-- Join orders, customers, and geo_lookup to match orders with regions.
-- Filter to North American region.
-- Use a CTE to count total number of orders, total sales, and AOV per quarter and average across all quarters.
-- Round averages to two decimal places and cast average number of orders to an integer.

WITH quarterly_trends AS(
  SELECT EXTRACT(quarter FROM orders.purchase_ts) AS quarter,
    COUNT(orders.customer_id) AS N_orders,
    SUM(orders.usd_price) AS sales,
    AVG(orders.usd_price) AS AOV
  FROM core.orders
  JOIN core.customers
  ON orders.customer_id = customers.id
  JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country
  WHERE geo_lookup.region = 'NA'
  GROUP BY 1
  ORDER BY 1
  )

SELECT
  CAST(ROUND(AVG(N_orders),0) AS INTEGER) AS avg_orders,
  ROUND(AVG(sales),2) AS avg_sales,
  ROUND(AVG(AOV),2) AS avg_AOV
FROM quarterly_trends
ORDER BY 1;

-- For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver?

-- Join order_status, orders, customers, and geo_lookup tables to match regions, delivery times, and marketing channels.
-- Use DATE_DIFF() to find the average delivery time per region in days and filter the results to website purchases made in 2022 or any mobile purchases.
-- Order the results by descending delivery time and limit to the top record to see region with the highest delivery time.

SELECT geo_lookup.region,
  ROUND(AVG(DATE_DIFF(order_status.delivery_ts,order_status.ship_ts,day)),2) AS avg_delivery_time,
FROM core.order_status
JOIN core.orders
ON order_status.order_id = orders.id
JOIN core.customers
ON orders.customer_id = customers.id
JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country
WHERE EXTRACT(year FROM order_status.purchase_ts) = 2022
  AND customers.marketing_channel = 'direct'
OR customers.marketing_channel LIKE 'mobile%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Which marketing channel has the highest average signup rate for the loyalty program,
-- and how does this compare to the channel that has the highest number of loyalty program participants?

-- Use CASE to group unknown and NULL marketing channel records together.
-- Average the loyalty_program column for the loyalty signup rate per marketing channel, converting to a percentage (x100) and rounding to two decimals.
-- Count the total number of loyalty participants per marketing channel.
-- Order the results by descending number of loyalty participants.

SELECT 
  CASE
    WHEN marketing_channel IS NULL THEN 'unknown'
    ELSE marketing_channel
  END AS marketing_channel_cleaned,
  ROUND(AVG(loyalty_program)*100,2) AS loyalty_signup_rate,
  SUM(loyalty_program) AS loyalty_participants
FROM core.customers
GROUP BY marketing_channel_cleaned
ORDER BY 2 DESC;
