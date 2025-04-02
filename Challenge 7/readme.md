## Multi-Day Customer Count

#### Level: Medium  
#### Points: 10  

We’re given a table of product purchases. Each row in the table represents an individual user product purchase.

Write a query to get the number of customers that were upsold by purchasing additional products.

Note: If a customer purchased multiple products on the same day, it does not count as an upsell. An upsell is considered only if they made purchases on separate days

### Output Schema:  

| Column Name           | Data Type |
|-----------------------|-----------|
| upsold_customer_count | FLOAT     |

