-- This query to search for a product by name 
SELECT * FROM supermarket.products WHERE productName = 'Дверь входная АМ-54 086П'; 

-- This query to search for a product by part of the name
SELECT * FROM supermarket.products WHERE productName LIKE 'Дверь входная Гарант%';

-- This query to search for a product by price, from and to
SELECT * FROM supermarket.products WHERE productPrice BETWEEN 8000 AND 15000;

-- This query to search orders by date, from and to
SELECT * FROM supermarket.orders WHERE salesDate BETWEEN '2021-09-16 22:00:00' AND '2021-09-16 23:00:00';

-- This query to search user by email
SELECT * FROM supermarket.users WHERE email = 'shevchenko@gamil.com';

-- This query to search users by set of emails (multiple emails)
SELECT * FROM supermarket.users WHERE email IN ('shevchenko@gamil.com', 'tarasenko@gamil.com', 'bobrenko@gamil.com');

-- This query to get a list of users from the products they have added
SELECT supermarket.users.*, supermarket.products.productName 
FROM supermarket.users 
LEFT JOIN supermarket.products 
ON supermarket.users.userId=supermarket.products.userСreatedId 
WHERE supermarket.products.productName  IS NOT NULL 
AND supermarket.products.productName  != '' 
ORDER BY supermarket.users.firstName;