## Most Recent Transaction

#### Level: Medium  
#### Points: 10  

Given a table of customer sales in a retail store with columns `id`, `transaction_value`, and `created_at` representing the date and time for each transaction, write a query to get the last transaction for each day.  

The output should include the ID of the transaction, the datetime of the transaction, and the transaction amount. Order the transactions by `created_at`.  

#### Output Schema:  

| Column Name         | Data Type  |
|---------------------|-----------|
| id                 | INT       |
| created_at         | DATETIME  |
| transaction_value  | FLOAT     |
