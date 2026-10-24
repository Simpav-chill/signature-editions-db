-- 1 запрос с использованием оператора DISTINCT;
SELECT DISTINCT type FROM edition;

-- 2 запроса с использованием операторов LIMIT и PERCENT;
SELECT * FROM recipient LIMIT 2;



-- 1 запрос с использованием FETCH FIRST или FETCH NEXT;
SELECT * FROM subscription
OFFSET 4
FETCH FIRST 5 ROWS ONLY;

-- 1 запрос с использованием оператора UPDATE;
SELECT * FROM edition;
UPDATE edition SET price = price + 10 WHERE type = 'журнал';
SELECT * FROM edition;

-- 2 простейших запроса с использованием операторов сравнения WHERE;
SELECT * FROM subscription WHERE recipient_id = 3;
SELECT * FROM edition WHERE price > 100;

-- 3 запроса с использованием логических операторов AND, OR и NOT;
SELECT * FROM edition WHERE price > 50 AND type = 'журнал';
SELECT * FROM subscription WHERE delivery_month = 1 OR term = 6;
SELECT * FROM subscription WHERE NOT edition_id = 3;

-- 1 запрос на использование комбинации логических операторов;
SELECT * FROM subscription
WHERE (delivery_month = 1 OR delivery_month = 2) AND term = 12;

-- 1 запрос с использованием выражения SELECT INTO;
SELECT index, name, price 
INTO edition_copy
FROM edition;

-- 1 запрос с использованием оператора BETWEEN;
SELECT settlement, street, building, phone FROM recipient WHERE id BETWEEN 2 AND 4;

-- 2 запроса с проверкой на принадлежность множеству (оператора IN);
SELECT * FROM recipient WHERE id IN (1, 3, 5);
SELECT * FROM subscription WHERE term IN (3, 6);

-- 2 запроса с проверкой на соответствие шаблону (оператор LIKE);
SELECT * FROM recipient WHERE phone LIKE '+791%';
SELECT * FROM recipient WHERE last_name LIKE 'С%';

-- 1 запрос с проверкой на неопределенное значение.
SELECT * FROM recipient WHERE patronymic IS NULL;