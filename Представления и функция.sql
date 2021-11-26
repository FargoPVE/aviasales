USE aviasales;

-- представление, в котором предоставляется инфомрация о рейсах из конкретного города(город прибытия, врмея/дата вылета, время/дата прибытия и номер самолета)

CREATE OR REPLACE VIEW flights_from_cairo (arrival_city, departure_time, arrival_time, airplane_board_number) AS
SELECT 
	c.english_name, 
	f.departure_time, 
	f.arrival_time, 
	a.board_number
FROM flight f
JOIN airplane a ON a.id = f.id
JOIN city c ON c.id = f.arrival_city
WHERE f.departure_city = 2;



-- представление, в котором выводится информация о конкретном пассажире по id (его имя, гражданствво, когда вылетает и каким классом)

CREATE OR REPLACE VIEW passenger_info(name, citizenship, departure_time, class) AS
SELECT 
	CONCAT(p.firstname, ' ', p.lastname),
	c.citizenship,
	s.departure_time,
	cl.class
FROM orders o
JOIN passenger p ON p.id = o.id_passenger
JOIN citizenship c ON c.id = p.citizenship 
JOIN schedule s ON s.id = o.id_order
JOIN classes cl ON cl.id = o.id_order 
WHERE p.id = 3;


-- функция, позвволяющая посчитать, сколько сэкономит пользователь, от заданной суммы, на основе стандарного тарифа "эконом",
-- если же его сумма будет меньше тарифа "эконом", то будет выведена сумма этого тарифа. 

DROP FUNCTION IF EXISTS func_price;

DELIMITER // 
CREATE FUNCTION func_price(check_price BIGINT)
RETURNS FLOAT READS SQL DATA
  BEGIN
    DECLARE price_1 BIGINT;
    DECLARE price_2 BIGINT;
    DECLARE `_result` FLOAT;

    SET price_1 = (
    	SELECT p.price 
        FROM price p
        WHERE id_class = 8);

	SET price_2 = (
  		SELECT p.price
		FROM price p 
      	WHERE price <= check_price
      	LIMIT 1);
      
    	if price_2 > price_1 THEN 
		SET `_result` = price_2 - price_1;
	else 
		set `_result` = price_1;
	end if;

	RETURN `_result`;

  END//
DELIMITER ; 