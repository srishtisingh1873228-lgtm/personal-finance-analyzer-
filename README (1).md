# Personal Finance Analyzer — SQL Project

A MySQL project analyzing 12 months of personal finance data (2024) using SQL queries to track income, expenses, savings trends, and budget performance across 8 spending categories.

---

## Tools Used
- **Database:** MySQL 8.0
- **IDE:** MySQL Workbench
- **Language:** SQL

---

## Database Schema

4 tables were created to store and analyze financial data:

| Table | Description |
|---|---|
| `accounts` | Bank account details (account_id, account_name, account_type, bank_name) |
| `categories` | Expense and income categories (category_id, category_name, type) |
| `transactions` | All 103 transactions for 2024 (txn_date, description, amount, transaction_type) |
| `budgets` | Monthly budget allocations per category (category_id, month, allocated) |

---

## SQL Concepts Used

- `JOIN` (2-table and 3-table joins)
- `GROUP BY` and aggregate functions (`SUM`, `COUNT`, `AVG`, `ROUND`)
- `CASE WHEN` for conditional aggregation
- `DATE_FORMAT` for monthly grouping
- `CTE` (Common Table Expression) using `WITH`
- Window Functions (`LAG`) for month-over-month analysis
- `ORDER BY`, `LIMIT`, `WHERE` filters

---

## Analysis Queries & Key Findings

### Query 1: Monthly Income vs Expenses
Tracks total income, total expenses, and net savings for each month using `CASE WHEN` conditional aggregation.

**Finding:** Savings were positive all 12 months. Best savings month was November (₹1,10,000). Average monthly savings ≈ ₹44,767.

---

### Query 2: Top 5 Spending Categories
Ranks categories by total annual spending using a JOIN between `transactions` and `categories`.

**Finding:** Rent is the biggest expense at ₹2,40,000, the highest among all categories. Shopping (₹71,800) and Entertainment (₹51,600) are the next biggest drains.

---

### Query 3: Month-over-Month Expense Change
Uses a CTE and `LAG` window function to compare each month's expenses to the previous month, showing both absolute and percentage change.

**Finding:** Biggest expense spike in October (+₹9,800). June had the largest drop (-₹8,600). December jumped by ₹11,300, likely due to festive season spending.

---

### Query 4: Budget vs Actual Spending
Compares monthly allocated budget against actual spending per category using a 3-table JOIN (`budgets`, `categories`, `transactions`) with `LEFT JOIN` and `COALESCE` to handle months with no spending.

**Finding:** Shopping overspent by ₹31,800 (79% over budget). Entertainment overspent by ₹15,600. Groceries and Transport stayed within budget throughout the year.

---

### Query 5: Top 10 Biggest Single Expenses
Retrieves the 10 highest individual expense transactions sorted by amount using `ORDER BY` and `LIMIT`.

**Finding:** All top 10 largest expenses are House Rent payments of ₹20,000 each — confirming it as the biggest fixed monthly expense.

---

### Query 6: Income vs Expense Summary
Summarizes total transaction count, total amount, and average per transaction by type using `COUNT`, `SUM`, and `AVG`.

**Finding:** Total income of ₹10,57,000 vs total expenses of ₹5,19,800 — resulting in a **50.8% annual savings rate**. Average income transaction (₹58,722) is 9.6x higher than average expense transaction (₹6,115).

---

## How to Run This Project

1. Open MySQL Workbench and connect to your local instance
2. Open `finance_analyzer.sql`
3. Press `Ctrl + Shift + Enter` to run the full script
4. The `finance_analyzer` database will be created with all tables and data
5. Run each analysis query from `Query.docx` to view results and screenshots

---

## Project Files

| File | Description |
|---|---|
| `finance_analyzer.sql` | Full database schema, sample data, and all 10 analysis queries |
| `Query.docx` | All 6 core analysis queries with output screenshots and findings |
| `README.md` | Project overview, schema details, and key findings summary |
