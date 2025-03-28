## Post Completion Rate Analysis

#### Level: Medium  
#### Points: 10  

Consider the `events` table, which contains information about the phases of writing a new social media post.  

The `action` column can have values:  
- `post_enter` → When a user starts to write a post.  
- `post_cancel` → When a user cancels their post.  
- `post_submit` → When a user successfully submits their post.  

Write a query to get the post-success rate for each day in **January 2020**.  

**Note:** Post Success Rate is defined as:  

**Post Success Rate** = (Number of posts submitted `post_submit`) / (Number of posts entered `post_enter`)  

for each day.  

### Output Schema:  

| Column Name    | Data Type |
|---------------|----------|
| date          | DATE     |
| total_enters  | INT      |
| total_submits | INT      |
| success_rate  | FLOAT    |
