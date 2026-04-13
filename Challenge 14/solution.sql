CREATE TABLE transactions (
id INT PRIMARY KEY,
product_id INT,
quantity INT,
created_at TIMESTAMP,
FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO transactions (id, product_id, quantity, created_at) VALUES
(1, 101, 2, '2019-01-15 10:00:00'),
(2, 102, 1, '2019-01-20 12:30:00'),
(3, 101, 3, '2019-02-10 14:00:00'),
(4, 103, 1, '2019-02-25 16:15:00'),
(5, 102, 4, '2019-03-05 09:30:00'),
(6, 101, 1, '2019-03-18 13:45:00');

CREATE TABLE products (
id INT PRIMARY KEY,
price DECIMAL(10, 2)
);

INSERT INTO products (id, price) VALUES
(101, 20.00),
(102, 15.00),
(103, 30.00);

-- Do not modify the schema or data definitions above

-- Implement your SQL query below, utilizing the provided schema


with revenue_per_month as (
  select 
    cast(strftime('%m', t.created_at) as int) as month,
    sum(t.quantity * p.price) as total_revenue
  from transactions t
  join products p on t.product_id = p.id
  where strftime('%Y', t.created_at) = '2019'
  group by month
),
revenue_with_previous as (
  select 
    month,
    total_revenue,
    lag(total_revenue) over (order by month) as previous_revenue
  from revenue_per_month
)
select 
  month,
  round(
    case 
      when previous_revenue is null then null
      when previous_revenue = 0 then null
      else (total_revenue - previous_revenue) * 100.0 / previous_revenue
    end, 2
  ) as month_over_month
from revenue_with_previous
