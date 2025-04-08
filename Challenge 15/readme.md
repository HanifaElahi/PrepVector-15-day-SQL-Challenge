## Duplicate Transaction

#### Level: Hard  
#### Points: 10  

Using the transactions table, identify any payments made at the same merchant with the same credit card for the same amount within 10 minutes of each other. Count such repeated payments.

### Assumption:

The first transaction of such payments should not be counted as a repeated payment. This means that if a merchant performs 2 transactions with the same credit card and for the same amount within 10 minutes, there will only be 1 repeated payment.

### Output Schema:  

|  Column Name           | Data Type |
|------------------------|-----------|
| repeated_payment_count | INT       |