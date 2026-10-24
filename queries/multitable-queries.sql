-- 1 запрос с использованием декартового произведения двух таблиц;
SELECT recipient.first_name, edition.name FROM recipient CROSS JOIN edition;

-- 2 запроса с использованием соединения двух таблиц по равенству (Оператор JOIN);
SELECT first_name, last_name, term, delivery_month
FROM subscription
INNER JOIN recipient
ON recipient.id = subscription.recipient_id;

SELECT name, delivery_month, delivery_year
FROM subscription
INNER JOIN edition
ON edition.id = subscription.edition_id;

-- 1 запроса с использованием соединения двух таблиц по равенству более сложным по составу с фильтрацией, сортировкой и условием (Оператор JOIN);
SELECT first_name, last_name, term
FROM subscription 
INNER JOIN recipient
ON recipient.id = subscription.recipient_id
WHERE last_name LIKE 'С%'
GROUP BY first_name, last_name, term
HAVING term > 3
ORDER BY term;

-- 1 запрос с использованием соединения двух таблиц по равенству и условием отбора;
SELECT name, price, delivery_month
FROM subscription
INNER JOIN edition
ON edition.id = subscription.edition_id
WHERE price < 100;

-- 1 запрос с использованием соединения по трем таблицам;
SELECT phone, name, term 
FROM subscription
INNER JOIN recipient
ON recipient.id = subscription.recipient_id
INNER JOIN edition
ON edition.id = subscription.edition_id;

-- 1 запрос с использованием левого внешнего соединения;
SELECT first_name, phone, delivery_month
FROM subscription
LEFT JOIN recipient
ON recipient.id = subscription.recipient_id;

-- 1 запрос на использование правого внешнего соединения;
SELECT type, name, delivery_month
FROM subscription
RIGHT JOIN edition
ON edition.id = subscription.edition_id;

-- 4 запроса с использованием ROLLUP, CUBE, GROUPING SETS и OVER.
SELECT settlement, street, AVG(term) 
FROM subscription
JOIN recipient
ON recipient.id = subscription.recipient_id
GROUP BY ROLLUP (settlement, street);

SELECT settlement, street, AVG(term) 
FROM subscription
JOIN recipient
ON recipient.id = subscription.recipient_id
GROUP BY CUBE (settlement, street);

SELECT settlement, street, AVG(term) 
FROM subscription
JOIN recipient
ON recipient.id = subscription.recipient_id
GROUP BY GROUPING SETS ((settlement), (street), ());

SELECT first_name, last_name, term, AVG(term) OVER (PARTITION BY last_name) 
FROM subscription 
JOIN recipient
ON recipient.id = subscription.recipient_id;

-- 1 запрос с использованием оператора HAVING


-- 1 запрос с комбинацией Inner Join и Outer Join


-- 1 запрос с использованием оператора UNION


-- 1 запрос с использованием оператора EXCEPT


-- 1 запрос с использованием оператора INTERSECT
