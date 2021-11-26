USE aviasales;

SELECT 
	CONCAT(firstname, ' ', lastname),
	CASE (determinate_sex)
         WHEN 'male' THEN 'Мужчина'
         WHEN 'female' THEN 'Женщина'
    END AS gender, 
    TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age,
	c.citizenship,
	phone
FROM passenger p
JOIN citizenship c ON c.id = p.citizenship 
WHERE YEAR(CURRENT_DATE())  - YEAR(birthday) < 18
ORDER BY age DESC;


SELECT
	c.russian_name AS city_ru, 
	c.english_name AS city_eng, 
	c2.russian_name AS country_ru, 
	c2.english_name AS country_eng
FROM city c
RIGHT JOIN country c2 ON c.id = c2.id
ORDER BY c2.russian_name
LIMIT 20;


SELECT 
	CONCAT(p.firstname, ' ', p.lastname) AS name,
	s.id_flight,
	DATE_FORMAT(s.departure_time, '%M, %D - %H:%i') AS 'Вылет',
	DATE_FORMAT(s.arrival_time, '%M, %D - %H:%i') AS 'Прибытие',
	c.class,
	pr.price AS price
FROM ticket t
JOIN passenger p ON p.id = t.id_order
JOIN schedule s ON s.id_flight = t.id_order
JOIN classes c ON c.id = t.id_class
JOIN price pr ON pr.id_class = t.id_class
WHERE price > 25000
ORDER BY s.id_flight;
	