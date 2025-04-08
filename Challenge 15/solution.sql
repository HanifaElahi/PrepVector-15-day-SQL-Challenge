CREATE TABLE transactions (
id INT PRIMARY KEY,
credit_card VARCHAR(20),
merchant VARCHAR(50),
amount DECIMAL(10, 2),
transaction_time DATETIME
);

INSERT INTO transactions (id, credit_card, merchant, amount, transaction_time)
VALUES
(1, '1234-5678-9876', 'Amazon', 50.00, '2025-01-23 10:15:00'),
(2, '1234-5678-9876', 'Amazon', 50.00, '2025-01-23 10:20:00'),
(3, '5678-1234-8765', 'Walmart', 30.00, '2025-01-23 11:00:00'),
(4, '1234-5678-9876', 'Amazon', 50.00, '2025-01-23 10:30:00'),
(5, '5678-1234-8765', 'Walmart', 30.00, '2025-01-23 11:05:00'),
(6, '8765-4321-1234', 'BestBuy', 100.00, '2025-01-23 12:00:00'),
(7, '1234-5678-9876', 'Amazon', 50.00, '2025-01-23 12:10:00');

-- Do not modify the schema or data definitions above

-- Implement your SQL query below, utilizing the provided schema


with ordered_transactions as (
  select *
  from transactions
),
repeated_payments as (
  select t1.id
  from ordered_transactions t1
  join ordered_transactions t2
    on t1.credit_card = t2.credit_card
    and t1.merchant = t2.merchant
    and t1.amount = t2.amount
    and t2.transaction_time < t1.transaction_time
    and strftime('%s', t1.transaction_time) - strftime('%s', t2.transaction_time) <= 600
)
select count(*) as repeated_payment_count
from repeated_payments
