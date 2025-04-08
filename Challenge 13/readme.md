## Click-Through Rate by Age

#### Level: Hard  
#### Points: 10  

Given two tables, search_events and users, write a query to find the three age groups (bucketed by decade: 0-9, 10-19, 20-29, …,80-89, 90-99, with the end point included) with the highest clickthrough rate in 2021. If two or more groups have the same clickthrough rate, the older group should have priority.

**Hint:** if a user that clicked the link on 1/1/2021 who is 29 years old on that day and has a birthday tomorrow on 2/1/2021, they fall into the [20-29] category. If the same user clicked on another link on 2/1/2021, he turned 30 and will fall into the [30-39] category.

### Output Schema:  

|  Column Name  | Data Type |
|---------------|-----------|
| age_group     | STRING    |
| ctr           | FLOAT     |