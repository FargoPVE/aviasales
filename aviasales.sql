DROP DATABASE IF EXISTS aviasales;
CREATE DATABASE aviasales;
USE aviasales;


DROP TABLE IF EXISTS passenger;
CREATE TABLE passenger(
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	birthday DATE NOT NULL,
	determinate_sex ENUM('male', 'female') NOT NULL,
	citizenship INT NOT NULL,
	email VARCHAR(150) UNIQUE,
	password_hash VARCHAR(255),
	phone INT UNSIGNED UNIQUE,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS flight;
CREATE TABLE flight(
	id SERIAL PRIMARY KEY,
	id_airplane INT UNSIGNED NOT NULL,
	departure_city VARCHAR(250),
	departure_time DATETIME,
	arrival_city VARCHAR(250),
	arrival_time DATETIME,
	flight_time TIME NOT NULL,
	price BIGINT UNSIGNED,
	seating_capcity VARCHAR(100) NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS airplane;
CREATE TABLE airplane(
	id SERIAL PRIMARY KEY,
	id_model BIGINT NOT NULL,
	id_airline BIGINT NOT NULL,
	board_number BIGINT NOT NULL
);


DROP TABLE IF EXISTS airplane_model;
CREATE TABLE airplane_model(
	id_model SERIAL PRIMARY KEY,
	model VARCHAR(100) NOT NULL,
	id_airplane_type INT UNSIGNED NOT NULL,
	wingspan INT,
	airolane_length INT,
	airplane_height INT,
	speed INT,
	copacity INT NOT NULL
);


DROP TABLE IF EXISTS airplane_types;
CREATE TABLE airplane_types(
	id SERIAL PRIMARY KEY,
	airplane_type VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS airport;
CREATE TABLE airport(
	id_airport SERIAL PRIMARY KEY,
	russian_name VARCHAR(100),
	english_name VARCHAR(100),
	id_city INT UNSIGNED NOT NULL,
	phone INT UNSIGNED UNIQUE,
	address VARCHAR(150)
);


DROP TABLE IF EXISTS country;
CREATE TABLE country(
	id SERIAL PRIMARY KEY,
	russian_name VARCHAR(100) NOT NULL,
	english_name VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS city;
CREATE TABLE city(
	id SERIAL PRIMARY KEY,
	id_country INT UNSIGNED NOT NULL,
	russian_name VARCHAR(100) NOT NULL,
	english_name VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS classes;
CREATE TABLE classes(
	id SERIAL PRIMARY KEY,
	class VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS price;
CREATE TABLE price(
	id_airline BIGINT UNSIGNED NOT NULL,
	id_class BIGINT UNSIGNED NOT NULL,
	price INT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id_airline, id_class),
	FOREIGN KEY (id_airline) REFERENCES flight(id),
	FOREIGN KEY (id_class) REFERENCES classes(id)
);


DROP TABLE IF EXISTS citizenship;
CREATE TABLE citizenship(
	id SERIAL PRIMARY KEY,
	citizenship VARCHAR(100) NOT NULL
);



DROP TABLE IF EXISTS places_airplane;
CREATE TABLE places_airplane(
	id_airplane BIGINT UNSIGNED NOT NULL,
	id_class BIGINT UNSIGNED NOT NULL,
	places INT NOT NULL,
	PRIMARY KEY(id_airplane, id_class),
	FOREIGN KEY (id_airplane) REFERENCES airplane_model(id_model),
	FOREIGN KEY (id_class) REFERENCES classes(id)
);


DROP TABLE IF EXISTS route;
CREATE TABLE route(
	id SERIAL PRIMARY KEY,
	departure_city VARCHAR(250),
	arrival_city VARCHAR(250),
	distance INT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule(
	id SERIAL PRIMARY KEY,
	id_flight INT UNSIGNED NOT NULL,
	departure_time DATETIME NOT NULL,
	arrival_time DATETIME NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id_order SERIAL PRIMARY KEY,
	id_passenger BIGINT NOT NULL,
	id_flight BIGINT NOT NULL,
	date_of_flight DATETIME NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_order) REFERENCES flight(id),
    FOREIGN KEY (id_order) REFERENCES passenger(id),
    FOREIGN KEY (id_order) REFERENCES schedule(id)
);


DROP TABLE IF EXISTS ticket_types;
CREATE TABLE ticket_types(
	id SERIAL PRIMARY KEY,
	id_flight BIGINT NOT NULL,
	FOREIGN KEY (id) REFERENCES flight(id)
);


DROP TABLE IF EXISTS ticket;
CREATE TABLE ticket(
	id SERIAL PRIMARY KEY,
	id_order BIGINT NOT NULL,
	id_schedule BIGINT NOT NULL,
	id_class BIGINT NOT NULL,
	id_ticket_type BIGINT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id) REFERENCES orders(id_order),
    FOREIGN KEY (id) REFERENCES schedule(id),
    FOREIGN KEY (id) REFERENCES classes(id),
    FOREIGN KEY (id) REFERENCES ticket_types(id)
);


DROP TABLE IF EXISTS ticket_rate;
CREATE TABLE ticket_rate(
	id SERIAL PRIMARY KEY,
	id_flight BIGINT NOT NULL,
	id_ticket BIGINT NOT NULL,
	id_ticket_type BIGINT NOT NULL,
	date_rate DATETIME NOT NULL,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id) REFERENCES flight(id),
    FOREIGN KEY (id) REFERENCES ticket(id),
    FOREIGN KEY (id) REFERENCES ticket_types(id)
);


ALTER TABLE aviasales.flight
ADD CONSTRAINT flight_airplane_fk 
FOREIGN KEY (id) REFERENCES aviasales.airplane(id);

ALTER TABLE aviasales.airplane
ADD CONSTRAINT airplane_model_fk 
FOREIGN KEY (id) REFERENCES aviasales.airplane_model(id_model);

ALTER TABLE aviasales.flight
ADD CONSTRAINT flight_schedule_fk 
FOREIGN KEY (id) REFERENCES aviasales.schedule(id);

ALTER TABLE aviasales.flight
ADD CONSTRAINT flight_route_fk 
FOREIGN KEY (id) REFERENCES aviasales.route(id);

ALTER TABLE aviasales.airplane_model 
ADD CONSTRAINT airplane_type_fk 
FOREIGN KEY (id_model) REFERENCES aviasales.airplane_types(id);

ALTER TABLE aviasales.passenger
ADD CONSTRAINT passenger_citizenship_fk 
FOREIGN KEY (id) REFERENCES aviasales.citizenship(id);

ALTER TABLE aviasales.route
ADD CONSTRAINT route_schedule_fk 
FOREIGN KEY (id) REFERENCES aviasales.schedule(id);

ALTER TABLE aviasales.city
ADD CONSTRAINT city_country_fk 
FOREIGN KEY (id) REFERENCES aviasales.country(id);

ALTER TABLE aviasales.city
ADD CONSTRAINT city_airport_fk 
FOREIGN KEY (id) REFERENCES aviasales.airport(id_airport);