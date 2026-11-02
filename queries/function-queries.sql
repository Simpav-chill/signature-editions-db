-- 4 запроса с использованием функции со строками;
SELECT first_name, LEFT(last_name, 1), LEFT(patronymic, 1)
FROM recipient;

SELECT CONCAT(first_name, ' ', last_name, ' ', patronymic) as full_name, phone
FROM recipient;

SELECT UPPER(type), name
FROM edition;

SELECT REPLACE(first_name, first_name, 'Вася'), REPLACE(last_name, last_name, 'Пупкин')
FROM recipient;

-- 2 запроса с использованием ЧисловыХ функциЙ;
SELECT name, RANDOM() as random_number
FROM edition;

SELECT phone, FLOOR(AVG(term) OVER (PARTITION BY phone)) 
FROM subscription
JOIN recipient
On recipient.id = subscription.recipient_id;

-- 2 запроса с использованием функций с ДАТАМИ;
SELECT name, NOW() from edition;

SELECT extract(month from CURRENT_DATE), NOW();

-- 2 запроса с использованием Функции CASE и IIF
SELECT first_name, last_name, 
    CASE term
        WHEN 6 THEN 'middle'
        WHEN 12 THEN 'long'
        WHEN 3 THEN 'short'
    END
FROM subscription
JOIN recipient
ON recipient.id = subscription.recipient_id;

SELECT first_name, last_name, 
    CASE WHEN term >= 6 THEN 'profitable' ELSE 'unprofitable' END
FROM subscription
JOIN recipient
ON recipient.id = subscription.recipient_id;

-- 2 запроса с использованием функций ISNULL и COALESCE

SELECT first_name, last_name, COALESCE(patronymic, 'отсутствует')
FROM recipient;

SELECT first_name, COALESCE(last_name, patronymic, 'отсутствует') 
FROM recipient;