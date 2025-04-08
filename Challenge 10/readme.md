## Liker’s Liker

#### Level: Hard  
#### Points: 10  

A dating website’s schema is represented by a table of people that like other people. The table has three columns. One column is the user_id, another column is the liker_id which is the user_id of the user doing the liking, and the last column is the date time that the like occurred.

Write a query to count the number of liker’s likers (the users that like the likers) if the liker has one.

### Output Schema:  

| Column Name | Data Type |
|-------------|-----------|
| user        | STRING    |
| count       | INT       |
