CREATE TABLE events (
user_id INT,
created_at DATETIME,
action VARCHAR(20)
);

INSERT INTO events VALUES
(1, '2020-01-01 10:00:00', 'post_enter'),
(1, '2020-01-01 10:05:00', 'post_submit'),
(2, '2020-01-01 11:00:00', 'post_enter'),
(2, '2020-01-01 11:10:00', 'post_canceled'),
(3, '2020-01-01 15:00:00', 'post_enter'),
(3, '2020-01-01 15:30:00', 'post_submit'),
(4, '2020-01-02 09:00:00', 'post_enter'),
(4, '2020-01-02 09:15:00', 'post_canceled'),
(5, '2020-01-02 10:00:00', 'post_enter'),
(5, '2020-01-02 10:10:00', 'post_canceled'),
(10, '2020-01-15 14:00:00', 'post_enter'),
(10, '2020-01-15 14:30:00', 'post_submit'),
(6, '2019-12-31 23:55:00', 'post_enter'),
(6, '2020-01-01 00:05:00', 'post_submit'),
(7, '2020-02-01 00:00:00', 'post_enter'),
(7, '2020-02-01 00:10:00', 'post_submit'),
(8, '2019-01-15 10:00:00', 'post_enter'),
(8, '2019-01-15 10:30:00', 'post_submit'),
(9, '2021-01-01 09:00:00', 'post_enter'),
(9, '2021-01-01 09:10:00', 'post_canceled');

-- Do not modify the schema or data definitions above

-- Implement your SQL query below, utilizing the provided schema

WITH post_enters AS (
    SELECT 
        strftime('%Y-%m-%d', created_at) AS date,
        SUM(CASE WHEN action = 'post_enter' THEN 1 ELSE 0 END) AS total_enters
    FROM events
    WHERE strftime('%Y-%m', created_at) = '2020-01'
    GROUP BY date
)
  
, post_submits AS (
    SELECT 
        strftime('%Y-%m-%d', created_at) AS date,
        SUM(CASE WHEN action = 'post_submit' THEN 1 ELSE 0 END) AS total_submits
    FROM events
    WHERE strftime('%Y-%m', created_at) = '2020-01'
    GROUP BY date
)
SELECT 
    pe.date,
    pe.total_enters,
    ps.total_submits,
    ROUND(CAST(ps.total_submits AS FLOAT) / NULLIF(pe.total_enters, 0), 2) AS success_rate
FROM post_enters pe
LEFT JOIN post_submits ps ON pe.date = ps.date
ORDER BY pe.date;


