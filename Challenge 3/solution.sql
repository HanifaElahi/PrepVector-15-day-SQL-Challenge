CREATE TABLE job_postings (
    id INT PRIMARY KEY,
    user_id INT,
    job_id INT,
    posted_date DATETIME
);

INSERT INTO job_postings (id, user_id, job_id, posted_date) VALUES
    (1, 1, 101, '2024-01-01'),
    (2, 1, 102, '2024-01-02'),
    (3, 2, 201, '2024-01-01'),
    (4, 2, 201, '2024-01-15'),
    (5, 2, 202, '2024-01-03'),
    (6, 3, 301, '2024-01-01'),
    (7, 4, 401, '2024-01-01'),
    (8, 4, 401, '2024-01-15'),
    (9, 4, 402, '2024-01-02'),
    (10, 4, 402, '2024-01-16'),
    (11, 5, 501, '2024-01-05'),
    (12, 5, 502, '2024-01-10');

-- Do not modify the schema or data definitions above

-- Implement your SQL query below, utilizing the provided schema

with jobs_postings_by_user as(
  SELECT user_id, COUNT(job_id) as jobs_posted
  FROM job_postings
  GROUP BY 1
)

SELECT 
  COUNT(DISTINCT CASE WHEN jobs_posted = 1 THEN user_id END) single_post_users, 
  COUNT(DISTINCT CASE WHEN jobs_posted > 1 THEN user_id END) multiple_post_users 
FROM jobs_postings_by_user

