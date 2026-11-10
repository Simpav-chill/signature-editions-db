-- 1 запрос с использованием объявления переменной и выводом на экран результата запроса
DO $$
DECLARE
    var VARCHAR := 'some var';
BEGIN
    RAISE NOTICE 'Var = %', var;
END $$;

-- 2 запроса с использованием условной конструкции IF без ELSE;
DO $$
DECLARE
    var INT := 4;
BEGIN
    IF var >= 3 THEN
        RAISE NOTICE 'Var is > or = 3';
    END IF;
END $$;



DO $$
DECLARE
    var VARCHAR := 'I am 17';
BEGIN
    IF var = 'I am 18' THEN
        RAISE NOTICE 'All set';
    END IF;
END $$;

-- 2 запроса с использованием условной конструкции IF с ELSE;
DO $$
DECLARE
    var INT := 2;
BEGIN
    IF var >= 3 THEN
        RAISE NOTICE 'Var is > or = 3';
    ELSE 
        RAISE NOTICE 'Var is < 3';
    END IF;
END $$;



DO $$
DECLARE
    var VARCHAR := 'Lucy';
BEGIN
    IF var = 'Lucy' THEN
        RAISE NOTICE 'It is Lucy!';
    ELSE 
        RAISE NOTICE 'It is not Lucy';
    END IF;
END $$;

-- 1 запрос с использованием агрегатных функций и использованием условной конструкции IF 
DO $$
DECLARE
    var INT;
BEGIN
    SELECT avg(price) AS avg_price 
    FROM edition
    INTO var;

    IF var < 100 THEN
        RAISE NOTICE 'Okay';
    END IF;
END $$;

-- 1 запроса с использованием цикла WHILE;
DO $$
DECLARE
    var INT := 0;
BEGIN
    WHILE var < 40 LOOP
        RAISE NOTICE 'Now, var is %', var;

        var := var + 1;
    END LOOP;
END $$;

-- 1 запроса с использованием операторов BREAK и CONTINUE
DO $$
DECLARE
    var INT := 0;
BEGIN
    WHILE var < 40 LOOP

        var := var + 1;

        CONTINUE WHEN var BETWEEN 11 AND 18 OR var = 20;
            
        EXIT WHEN var = 27;

        RAISE NOTICE 'Now, var is %', var;
    END LOOP;
END $$;

-- 1 запрос на обработку ошибок
DO $$
DECLARE
    var INT;
BEGIN
    var := 'Hi';
EXCEPTION WHEN OTHERS
THEN
    RAISE NOTICE 'Du hast etwas Falsches getan';
END $$;