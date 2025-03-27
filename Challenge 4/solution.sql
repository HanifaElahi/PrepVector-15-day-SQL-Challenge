CREATE TABLE customer_sales (
id INT PRIMARY KEY,
transaction_value DECIMAL(10, 2),
created_at DATETIME
);

INSERT INTO customer_sales (id, transaction_value, created_at)
VALUES
(1, 50.00, '2025-01-23 10:15:00'),
(2, 30.00, '2025-01-23 15:45:00'),
(3, 20.00, '2025-01-23 18:30:00'),
(4, 45.00, '2025-01-24 09:20:00'),
(5, 60.00, '2025-01-24 22:10:00'),
(6, 25.00, '2025-01-25 11:30:00'),
(7, 35.00, '2025-01-25 14:50:00'),
(8, 55.00, '2025-01-25 19:05:00');

-- Do not modify the schema or data definitions above

-- Implement your SQL query below, utilizing the provided schema

with transactions_history as(
  SELECT 
    id, 
    created_at, 
    transaction_value, 
    row_number() over(partition by date(created_at) order by created_at desc) rn
  FROM customer_sales
)

, latest_day_transaction as(  
  SELECT 
    * 
  FROM transactions_history
  WHERE rn = 1
)

SELECT 
  id, created_at, transaction_value
FROM latest_day_transaction
ORDER BY created_at



