USE finance_tracker;

-- Users
INSERT INTO Users (name) VALUES ('Abhishek'), ('Riya');

-- Categories
INSERT INTO Categories (name, type) VALUES 
('Salary', 'Income'),
('Freelance', 'Income'),
('Food', 'Expense'),
('Rent', 'Expense'),
('Transport', 'Expense');

-- Income
INSERT INTO Income (user_id, category_id, amount, date) VALUES 
(1, 1, 50000, '2025-07-01'),
(1, 2, 10000, '2025-07-10'),
(2, 1, 60000, '2025-07-05');

-- Expenses
INSERT INTO Expenses (user_id, category_id, amount, date) VALUES 
(1, 3, 2000, '2025-07-02'),
(1, 4, 15000, '2025-07-03'),
(1, 5, 1200, '2025-07-06'),
(2, 3, 2500, '2025-07-07'),
(2, 4, 18000, '2025-07-08');