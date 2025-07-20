USE finance_tracker;

-- Total income per user
SELECT u.name, SUM(i.amount) AS total_income
FROM Income i
JOIN Users u ON i.user_id = u.user_id
GROUP BY i.user_id;

-- Total expense per user
SELECT u.name, SUM(e.amount) AS total_expense
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
GROUP BY e.user_id;

-- Monthly balance
SELECT u.name,
    (SELECT IFNULL(SUM(i.amount), 0) FROM Income i WHERE i.user_id = u.user_id) - 
    (SELECT IFNULL(SUM(e.amount), 0) FROM Expenses e WHERE e.user_id = u.user_id) AS balance
FROM Users u;

-- Expense by category
SELECT c.name AS category, SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
GROUP BY e.category_id;

-- View: Monthly summary per user
CREATE OR REPLACE VIEW monthly_summary AS
SELECT u.name,
       (SELECT IFNULL(SUM(i.amount), 0) FROM Income i WHERE i.user_id = u.user_id) AS total_income,
       (SELECT IFNULL(SUM(e.amount), 0) FROM Expenses e WHERE e.user_id = u.user_id) AS total_expense,
       ((SELECT IFNULL(SUM(i.amount), 0) FROM Income i WHERE i.user_id = u.user_id) - 
        (SELECT IFNULL(SUM(e.amount), 0) FROM Expenses e WHERE e.user_id = u.user_id)) AS balance
FROM Users u;

-- Use the view
SELECT * FROM monthly_summary;