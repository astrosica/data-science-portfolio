![ERD](https://github.com/jessicacampbell-astro/e-Electronics_sales_analysis/assets/23153120/cec1b2b6-8f79-42d5-af9f-20c6c3d63abf)

```
+-------------------------------------------------------------------+
| ORDERS                                                            |
+-------------------------------------------------------------------+
| customer_id                                           | STRING    |
| id                                                    | STRING    | 
| purchase_ts                                           | DATE      | 
| product_id                                            | STRING    |
| product_name                                          | STRING    |
| currency                                              | STRING    |
| local_price                                           | FLOAT64   |
| usd_price                                             | FLOAT64   |
| purchase_platform                                     | STRING    |
+--------------------------------------------+----------------------+

+-------------------------------------------------------------------+
| GEO_LOOKUP                                                        |
+-------------------------------------------------------------------+
| country                                               | STRING    |
| region                                                | STRING    | 
+--------------------------------------------+----------------------+

+-------------------------------------------------------------------+
| CUSTOMERS                                                         |
+-------------------------------------------------------------------+
| id                                                    | STRING    |
| marketing_channel                                     | STRING    |
| account_creation_platform                             | STRING    |
| country_code                                          | STRING    | 
| loyalty_program                                       | INT64     | 
| created_on                                            | DATE      |
+--------------------------------------------+----------------------+

+-------------------------------------------------------------------+
| ORDER_STATUS                                                      |              
+-------------------------------------------------------------------+
| order_id                                              | STRING    |
| purchase_ts                                           | DATE      |
| ship_ts                                               | DATE      |
| delivery_ts                                           | DATE      |
| refund_ts                                             | DATE      |
+--------------------------------------------+----------------------+
```
