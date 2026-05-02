--   PERSONAL FINANCE ANALYZER — MySQL 8.0+
-- ============================================================

CREATE DATABASE IF NOT EXISTS finance_analyzer;
USE finance_analyzer;

-- ============================================================
-- STEP 1: CREATE TABLES
-- ============================================================

CREATE TABLE accounts (
    account_id   INT AUTO_INCREMENT PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    account_type VARCHAR(50),
    bank_name    VARCHAR(100)
);

CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    type          VARCHAR(20)
);

CREATE TABLE transactions (
    transaction_id   INT AUTO_INCREMENT PRIMARY KEY,
    account_id       INT,
    category_id      INT,
    txn_date         DATE NOT NULL,
    description      VARCHAR(255),
    amount           DECIMAL(10,2) NOT NULL,
    transaction_type VARCHAR(20),
    FOREIGN KEY (account_id)  REFERENCES accounts(account_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE budgets (
    budget_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    month       VARCHAR(7),
    allocated   DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- ============================================================
-- STEP 2: INSERT SAMPLE DATA
-- ============================================================

INSERT INTO accounts (account_name, account_type, bank_name) VALUES
('Main Checking',   'checking', 'HDFC Bank'),
('Savings Account', 'savings',  'SBI'),
('Credit Card',     'credit',   'Axis Bank');

INSERT INTO categories (category_name, type) VALUES
('Salary',        'income'),
('Freelance',     'income'),
('Rent',          'expense'),
('Groceries',     'expense'),
('Transport',     'expense'),
('Entertainment', 'expense'),
('Utilities',     'expense'),
('Health',        'expense'),
('Shopping',      'expense'),
('Investment',    'expense');

-- 2024 Transactions (12 months)
INSERT INTO transactions (account_id, category_id, txn_date, description, amount, transaction_type) VALUES
-- Jan 2024
(1,1,'2024-01-01','Monthly Salary',75000,'income'),
(1,3,'2024-01-03','House Rent',20000,'expense'),
(1,4,'2024-01-07','Big Basket Groceries',3200,'expense'),
(1,5,'2024-01-10','Uber Rides',1500,'expense'),
(1,6,'2024-01-15','Netflix + Dining Out',2800,'expense'),
(1,7,'2024-01-18','Electricity Bill',1800,'expense'),
(2,2,'2024-01-22','Freelance Project A',12000,'income'),
(1,8,'2024-01-25','Pharmacy',600,'expense'),
(1,9,'2024-01-28','Amazon Shopping',4500,'expense'),
-- Feb 2024
(1,1,'2024-02-01','Monthly Salary',75000,'income'),
(1,3,'2024-02-03','House Rent',20000,'expense'),
(1,4,'2024-02-08','Grocery Shopping',2900,'expense'),
(1,5,'2024-02-12','Petrol',1200,'expense'),
(1,8,'2024-02-16','Doctor Visit',2500,'expense'),
(1,6,'2024-02-20','Movie + Dinner',3500,'expense'),
(1,7,'2024-02-22','Internet Bill',1200,'expense'),
(3,9,'2024-02-25','Clothing Purchase',5800,'expense'),
-- Mar 2024
(1,1,'2024-03-01','Monthly Salary',75000,'income'),
(1,3,'2024-03-03','House Rent',20000,'expense'),
(2,2,'2024-03-10','Freelance Project B',18000,'income'),
(1,4,'2024-03-12','Groceries',3600,'expense'),
(1,7,'2024-03-16','Water + Internet',2200,'expense'),
(1,5,'2024-03-20','Cab & Auto',1800,'expense'),
(1,10,'2024-03-25','Mutual Fund SIP',5000,'expense'),
(1,6,'2024-03-28','OTT Subscriptions',1500,'expense'),
-- Apr 2024
(1,1,'2024-04-01','Monthly Salary',75000,'income'),
(1,3,'2024-04-03','House Rent',20000,'expense'),
(1,4,'2024-04-06','Big Basket',3100,'expense'),
(1,5,'2024-04-11','Petrol',1300,'expense'),
(1,6,'2024-04-14','Weekend Trip',8500,'expense'),
(1,8,'2024-04-18','Health Checkup',3500,'expense'),
(1,7,'2024-04-22','Electricity Bill',2100,'expense'),
(1,10,'2024-04-25','Mutual Fund SIP',5000,'expense'),
-- May 2024
(1,1,'2024-05-01','Monthly Salary',75000,'income'),
(2,2,'2024-05-05','Freelance Project C',20000,'income'),
(1,3,'2024-05-03','House Rent',20000,'expense'),
(1,4,'2024-05-08','Groceries',3400,'expense'),
(1,9,'2024-05-12','New Gadget Purchase',12000,'expense'),
(1,5,'2024-05-16','Transport',1600,'expense'),
(1,7,'2024-05-20','Utilities',1900,'expense'),
(1,6,'2024-05-24','Dining & Movies',4200,'expense'),
(1,10,'2024-05-25','Mutual Fund SIP',5000,'expense'),
-- Jun 2024
(1,1,'2024-06-01','Monthly Salary',75000,'income'),
(1,3,'2024-06-03','House Rent',20000,'expense'),
(1,4,'2024-06-07','Grocery Store',3300,'expense'),
(1,8,'2024-06-11','Dental Visit',4000,'expense'),
(1,5,'2024-06-15','Cab Rides',1700,'expense'),
(1,7,'2024-06-19','Electricity + Internet',3000,'expense'),
(1,6,'2024-06-23','Entertainment',2500,'expense'),
(1,10,'2024-06-25','Mutual Fund SIP',5000,'expense'),
-- Jul 2024
(1,1,'2024-07-01','Monthly Salary',80000,'income'),
(1,3,'2024-07-03','House Rent',20000,'expense'),
(2,2,'2024-07-07','Freelance Project D',25000,'income'),
(1,4,'2024-07-09','Groceries',3500,'expense'),
(1,9,'2024-07-13','Clothing Sale',6500,'expense'),
(1,5,'2024-07-17','Petrol + Uber',2000,'expense'),
(1,7,'2024-07-21','Utilities',2100,'expense'),
(1,6,'2024-07-25','Dining Out',3800,'expense'),
(1,10,'2024-07-25','Mutual Fund SIP',5000,'expense'),
-- Aug 2024
(1,1,'2024-08-01','Monthly Salary',80000,'income'),
(1,3,'2024-08-03','House Rent',20000,'expense'),
(1,4,'2024-08-07','Big Basket Order',3700,'expense'),
(1,8,'2024-08-12','Hospital Visit',5000,'expense'),
(1,5,'2024-08-16','Transport',1800,'expense'),
(1,7,'2024-08-20','Electricity Bill',2400,'expense'),
(1,6,'2024-08-24','Movies + Outing',3200,'expense'),
(1,10,'2024-08-25','Mutual Fund SIP',5000,'expense'),
-- Sep 2024
(1,1,'2024-09-01','Monthly Salary',80000,'income'),
(2,2,'2024-09-06','Freelance Project E',22000,'income'),
(1,3,'2024-09-03','House Rent',20000,'expense'),
(1,4,'2024-09-08','Groceries',3200,'expense'),
(1,9,'2024-09-11','Amazon Diwali Sale',9000,'expense'),
(1,5,'2024-09-15','Cab Rides',1500,'expense'),
(1,7,'2024-09-19','Internet + Water',2000,'expense'),
(1,6,'2024-09-23','Dining & Entertainment',4500,'expense'),
(1,10,'2024-09-25','Mutual Fund SIP',5000,'expense'),
-- Oct 2024
(1,1,'2024-10-01','Monthly Salary',80000,'income'),
(1,3,'2024-10-03','House Rent',20000,'expense'),
(1,4,'2024-10-07','Grocery Shopping',3900,'expense'),
(1,9,'2024-10-10','Diwali Shopping',15000,'expense'),
(1,5,'2024-10-14','Petrol',1600,'expense'),
(1,8,'2024-10-18','Pharmacy',900,'expense'),
(1,7,'2024-10-22','Electricity Bill',2600,'expense'),
(1,6,'2024-10-26','Diwali Celebrations',6000,'expense'),
(1,10,'2024-10-25','Mutual Fund SIP',5000,'expense'),
-- Nov 2024
(1,1,'2024-11-01','Monthly Salary',80000,'income'),
(2,2,'2024-11-05','Freelance Project F',30000,'income'),
(1,3,'2024-11-03','House Rent',20000,'expense'),
(1,4,'2024-11-08','Groceries',3300,'expense'),
(1,5,'2024-11-12','Transport',1700,'expense'),
(1,7,'2024-11-16','Utilities',2200,'expense'),
(1,9,'2024-11-20','Year End Shopping',8000,'expense'),
(1,6,'2024-11-24','Dining Out',3600,'expense'),
(1,10,'2024-11-25','Mutual Fund SIP',5000,'expense'),
-- Dec 2024
(1,1,'2024-12-01','Monthly Salary',80000,'income'),
(1,3,'2024-12-03','House Rent',20000,'expense'),
(1,4,'2024-12-07','Grocery Shopping',4200,'expense'),
(1,9,'2024-12-10','Christmas Shopping',11000,'expense'),
(1,5,'2024-12-14','Cab + Petrol',2100,'expense'),
(1,6,'2024-12-18','New Year Party',7500,'expense'),
(1,7,'2024-12-22','Electricity + Internet',2800,'expense'),
(1,8,'2024-12-26','Year End Health Checkup',2500,'expense'),
(1,10,'2024-12-25','Mutual Fund SIP',5000,'expense');

-- Monthly Budgets for 2024
INSERT INTO budgets (category_id, month, allocated) VALUES
(3,'2024-01',20000),(4,'2024-01',4000),(5,'2024-01',2000),(6,'2024-01',3000),(7,'2024-01',2500),(8,'2024-01',1500),(9,'2024-01',5000),(10,'2024-01',5000),
(3,'2024-02',20000),(4,'2024-02',4000),(5,'2024-02',2000),(6,'2024-02',3000),(7,'2024-02',2500),(8,'2024-02',1500),(9,'2024-02',5000),(10,'2024-02',5000),
(3,'2024-03',20000),(4,'2024-03',4000),(5,'2024-03',2000),(6,'2024-03',3000),(7,'2024-03',2500),(8,'2024-03',1500),(9,'2024-03',5000),(10,'2024-03',5000),
(3,'2024-04',20000),(4,'2024-04',4000),(5,'2024-04',2000),(6,'2024-04',3000),(7,'2024-04',2500),(8,'2024-04',1500),(9,'2024-04',5000),(10,'2024-04',5000),
(3,'2024-05',20000),(4,'2024-05',4000),(5,'2024-05',2000),(6,'2024-05',3000),(7,'2024-05',2500),(8,'2024-05',1500),(9,'2024-05',5000),(10,'2024-05',5000),
(3,'2024-06',20000),(4,'2024-06',4000),(5,'2024-06',2000),(6,'2024-06',3000),(7,'2024-06',2500),(8,'2024-06',1500),(9,'2024-06',5000),(10,'2024-06',5000),
(3,'2024-07',20000),(4,'2024-07',4000),(5,'2024-07',2000),(6,'2024-07',3000),(7,'2024-07',2500),(8,'2024-07',1500),(9,'2024-07',5000),(10,'2024-07',5000),
(3,'2024-08',20000),(4,'2024-08',4000),(5,'2024-08',2000),(6,'2024-08',3000),(7,'2024-08',2500),(8,'2024-08',1500),(9,'2024-08',5000),(10,'2024-08',5000),
(3,'2024-09',20000),(4,'2024-09',4000),(5,'2024-09',2000),(6,'2024-09',3000),(7,'2024-09',2500),(8,'2024-09',1500),(9,'2024-09',5000),(10,'2024-09',5000),
(3,'2024-10',20000),(4,'2024-10',4000),(5,'2024-10',2000),(6,'2024-10',3000),(7,'2024-10',2500),(8,'2024-10',1500),(9,'2024-10',5000),(10,'2024-10',5000),
(3,'2024-11',20000),(4,'2024-11',4000),(5,'2024-11',2000),(6,'2024-11',3000),(7,'2024-11',2500),(8,'2024-11',1500),(9,'2024-11',5000),(10,'2024-11',5000),
(3,'2024-12',20000),(4,'2024-12',4000),(5,'2024-12',2000),(6,'2024-12',3000),(7,'2024-12',2500),(8,'2024-12',1500),(9,'2024-12',5000),(10,'2024-12',5000);


-- ============================================================
-- STEP 3: ANALYSIS QUERIES (Run one at a time)
-- ============================================================

-- QUERY 1: Monthly Income vs Expense vs Net Savings
SELECT
  DATE_FORMAT(txn_date, '%Y-%m') AS month,
  SUM(CASE WHEN transaction_type = 'income'  THEN amount ELSE 0 END) AS total_income,
  SUM(CASE WHEN transaction_type = 'expense' THEN amount ELSE 0 END) AS total_expense,
  SUM(CASE WHEN transaction_type = 'income'  THEN amount ELSE -amount END) AS net_savings
FROM transactions
GROUP BY DATE_FORMAT(txn_date, '%Y-%m')
ORDER BY month;

-- QUERY 2: Top 5 Spending Categories
SELECT
  c.category_name,
  COUNT(t.transaction_id) AS num_transactions,
  SUM(t.amount) AS total_spent,
  ROUND(AVG(t.amount), 2) AS avg_per_transaction
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE t.transaction_type = 'expense'
GROUP BY c.category_name
ORDER BY total_spent DESC
LIMIT 5;

-- QUERY 3: Month-over-Month Expense Change (Window Function)
WITH monthly_expense AS (
  SELECT
    DATE_FORMAT(txn_date, '%Y-%m') AS month,
    SUM(amount) AS total_expense
  FROM transactions
  WHERE transaction_type = 'expense'
  GROUP BY DATE_FORMAT(txn_date, '%Y-%m')
)
SELECT
  month,
  total_expense,
  LAG(total_expense) OVER (ORDER BY month) AS prev_month_expense,
  ROUND(total_expense - LAG(total_expense) OVER (ORDER BY month), 2) AS change_amount,
  ROUND(((total_expense - LAG(total_expense) OVER (ORDER BY month))
    / LAG(total_expense) OVER (ORDER BY month)) * 100, 1) AS pct_change
FROM monthly_expense
ORDER BY month;

-- QUERY 4: Budget vs Actual Spending
SELECT
  c.category_name,
  b.month,
  b.allocated AS budget,
  COALESCE(SUM(t.amount), 0) AS actual_spent,
  b.allocated - COALESCE(SUM(t.amount), 0) AS remaining,
  ROUND((COALESCE(SUM(t.amount), 0) / b.allocated) * 100, 1) AS used_pct,
  CASE
    WHEN COALESCE(SUM(t.amount), 0) > b.allocated THEN 'OVER BUDGET'
    WHEN COALESCE(SUM(t.amount), 0) >= b.allocated * 0.9 THEN 'NEAR LIMIT'
    ELSE 'ON TRACK'
  END AS status
FROM budgets b
JOIN categories c ON b.category_id = c.category_id
LEFT JOIN transactions t
  ON t.category_id = b.category_id
  AND DATE_FORMAT(t.txn_date, '%Y-%m') = b.month
  AND t.transaction_type = 'expense'
GROUP BY c.category_name, b.month, b.allocated
ORDER BY b.month, used_pct DESC;

-- QUERY 5: Yearly Financial Summary
SELECT
  YEAR(txn_date) AS year,
  SUM(CASE WHEN transaction_type = 'income'  THEN amount ELSE 0 END) AS total_income,
  SUM(CASE WHEN transaction_type = 'expense' THEN amount ELSE 0 END) AS total_expense,
  SUM(CASE WHEN transaction_type = 'income'  THEN amount ELSE -amount END) AS net_savings,
  ROUND(SUM(CASE WHEN transaction_type = 'income' THEN amount ELSE -amount END)
    / SUM(CASE WHEN transaction_type = 'income' THEN amount ELSE 0 END) * 100, 1) AS savings_rate_pct
FROM transactions
GROUP BY YEAR(txn_date);

-- QUERY 6: Highest Single Expense per Month (Window Function)
WITH ranked AS (
  SELECT
    DATE_FORMAT(txn_date, '%Y-%m') AS month,
    description,
    amount,
    c.category_name,
    RANK() OVER (PARTITION BY DATE_FORMAT(txn_date, '%Y-%m') ORDER BY amount DESC) AS rnk
  FROM transactions t
  JOIN categories c ON t.category_id = c.category_id
  WHERE transaction_type = 'expense'
)
SELECT month, description, category_name, amount
FROM ranked
WHERE rnk = 1
ORDER BY month;

-- QUERY 7: 3-Month Rolling Average Expense
WITH monthly AS (
  SELECT
    DATE_FORMAT(txn_date, '%Y-%m') AS month,
    SUM(amount) AS total_expense
  FROM transactions
  WHERE transaction_type = 'expense'
  GROUP BY DATE_FORMAT(txn_date, '%Y-%m')
)
SELECT
  month,
  total_expense,
  ROUND(AVG(total_expense) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_3mo_avg
FROM monthly
ORDER BY month;

-- QUERY 8: Expense Breakdown by Account
SELECT
  a.account_name,
  a.account_type,
  COUNT(t.transaction_id) AS num_transactions,
  SUM(t.amount) AS total_spent
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
WHERE t.transaction_type = 'expense'
GROUP BY a.account_name, a.account_type
ORDER BY total_spent DESC;

-- QUERY 9: Income Sources Breakdown
SELECT
  c.category_name AS income_source,
  COUNT(*) AS num_payments,
  SUM(t.amount) AS total_earned,
  ROUND(SUM(t.amount) / (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'income') * 100, 1) AS pct_of_total_income
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE t.transaction_type = 'income'
GROUP BY c.category_name
ORDER BY total_earned DESC;

-- QUERY 10: Quarterly Expense Summary
SELECT
  YEAR(txn_date) AS year,
  QUARTER(txn_date) AS quarter,
  SUM(CASE WHEN transaction_type = 'income'  THEN amount ELSE 0 END) AS income,
  SUM(CASE WHEN transaction_type = 'expense' THEN amount ELSE 0 END) AS expense,
  SUM(CASE WHEN transaction_type = 'income'  THEN amount ELSE -amount END) AS net
FROM transactions
GROUP BY YEAR(txn_date), QUARTER(txn_date)
ORDER BY year, quarter;
