-- Для созданной базы данных, согласно номеру варианта, самостоятельно создать на  языке P-SQL 12 запросов и представления:
-- 3 запроса с использованием переменных;
DO $$
DECLARE 
    name VARCHAR := 'John';
    age INTEGER := 18;
BEGIN
    RAISE NOTICE 'name is %, age is %', name, age;
END $$;

DO $$
DECLARE
    name VARCHAR;
BEGIN
    SELECT first_name INTO name FROM recipient WHERE id = 4;
    RAISE NOTICE 'The name is %', name;
END$$;



DO $$
DECLARE
    show_type VARCHAR;
    show_name VARCHAR;
BEGIN
    SELECT type INTO show_type 
    FROM edition 
    WHERE id = 3;

    SELECT name INTO show_name 
    FROM edition 
    WHERE id = 2;
    
    RAISE NOTICE 'Selected values: %, %', show_type, show_name;
END$$;



DO $$
DECLARE
    sum INTEGER;
BEGIN
    SELECT (1 + 1) INTO sum;

    RAISE NOTICE 'The sum of 1 and 1 is %', sum;
END$$;

-- 3 запрос для создания временной таблицы через переменную типа TABLE;

-- В PostgreSQL не получится создать полноценную временную таблицу через переменную
-- Это делает через отдельное создание временной таблицы с помощью CREATE TEMP TABLE
-- Временность заключается в указании в запросе ON COMMIT DROP - временная таблица удалится в конце текущей транзакции
DO $$
DECLARE
    r record;
BEGIN
    CREATE TEMP TABLE tmp_edition ON COMMIT DROP AS
    SELECT * FROM edition
    WHERE type = 'журнал';
    
    FOR r IN SELECT * FROM tmp_edition LOOP
        RAISE NOTICE 'id = %, index = %, type = %, name = %, price = %', 
        r.id, r.index, r.type, r.name, r.price;
    END LOOP;
END$$;



DO $$
DECLARE
    r record;
BEGIN
    CREATE TEMP TABLE tmp_edition ON COMMIT DROP AS
    SELECT * FROM recipient
    WHERE id < 4;
    
    FOR r IN SELECT * FROM tmp_edition LOOP
        RAISE NOTICE 'id = %, first_name = %, last_name = %', 
        r.id, r.first_name, r.last_name;
    END LOOP;
END$$;



DO $$
DECLARE
    r record;
BEGIN
    CREATE TEMP TABLE tmp_edition ON COMMIT DROP AS
    SELECT * FROM subscription
    WHERE recipient_id = 1 OR recipient_id = 2;
    
    FOR r IN SELECT * FROM tmp_edition LOOP
        RAISE NOTICE 'id = %, term = %, delivery_month = %', 
        r.id, r.term, r.delivery_month;
    END LOOP;
END$$;
-- 3 запроса создания локальной временной таблицы;
-- Те же самые запросы, что и в предыдущем пункте 

-- 3 запроса для создания глобальных временных таблиц использую промежуточные данные и выборку данных из таблиц ваших БД (Сохранить в отчете скрины созданных временных таблиц в таблице tempdb);
CREATE TEMP TABLE tmp_edition (
    id INT,
    index INT,
    type VARCHAR,
    name VARCHAR,
    price INT
) ON COMMIT PRESERVE ROWS;

INSERT INTO tmp_edition (id, index, type, name, price)
SELECT e.id, e.index, e.type, e.name, e.price
FROM edition e
WHERE e.price < 100;

SELECT * FROM tmp_edition;



CREATE TEMP TABLE tmp_recipient AS
SELECT * FROM recipient
WHERE apartment < 10;

SELECT * FROM tmp_recipient;



CREATE TEMP TABLE tmp_sub (
    id INT,
    recipient_id INT,
    edition_id INT,
    term INT,
    delivery_month INT,
    delivery_year INT
) ON COMMIT PRESERVE ROWS;

INSERT INTO tmp_sub (
    id, 
    recipient_id, 
    edition_id, term, 
    delivery_month, 
    delivery_year
)

SELECT 
    s.id, 
    s.recipient_id, 
    s.edition_id, 
    s.term, 
    s.delivery_month, 
    s.delivery_year 
FROM subscription s
JOIN recipient r 
ON r.id = s.recipient_id
JOIN edition e
ON e.id = s.edition_id
WHERE delivery_month < 6;

SELECT * FROM tmp_sub;