-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-09-16 12:42:07.736

-- tables
-- Table: additional_information
CREATE TABLE additional_information (
    id int NOT NULL,
    current_air_quality int NOT NULL,
    humidity_in_percent int NOT NULL,
    cloud_cover_in_percent int NOT NULL,
    sunrise time NOT NULL,
    sunset time NOT NULL,
    CONSTRAINT additional_information_pk PRIMARY KEY (id)
);

-- Table: city
CREATE TABLE city (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(40) NOT NULL,
    country_id int NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY (id)
);

-- Table: country
CREATE TABLE country (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(40) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY (id)
);

-- Table: day
CREATE TABLE day (
    id int NOT NULL,
    date date NOT NULL,
    name varchar(13) NULL,
    CONSTRAINT day_pk PRIMARY KEY (id)
);

-- Table: temperature
CREATE TABLE temperature (
    id int NOT NULL,
    temperature_in_C double(150,1) NULL,
    temperature_in_F double(132,1) NULL,
    water_temperature double(120,1) NULL,
    CONSTRAINT temperature_pk PRIMARY KEY (id)
);

-- Table: time
CREATE TABLE time (
    id int NOT NULL,
    time time NOT NULL,
    CONSTRAINT time_pk PRIMARY KEY (id)
);

-- Table: weather
CREATE TABLE weather (
    id int NOT NULL AUTO_INCREMENT,
    city_id int NOT NULL,
    day_id int NOT NULL,
    time_id int NULL,
    temperature_id int NOT NULL,
    weater_condition_id int NOT NULL,
    is_cataclysm bool NOT NULL,
    additional_information_id int NOT NULL,
    CONSTRAINT weather_pk PRIMARY KEY (id)
);

-- Table: weather_condition
CREATE TABLE weather_condition (
    id int NOT NULL,
    label varchar(25) NOT NULL,
    description varchar(30) NOT NULL,
    CONSTRAINT weather_condition_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: city_country (table: city)
ALTER TABLE city ADD CONSTRAINT city_country FOREIGN KEY city_country (country_id)
    REFERENCES country (id);

-- Reference: weather_additional_information (table: weather)
ALTER TABLE weather ADD CONSTRAINT weather_additional_information FOREIGN KEY weather_additional_information (additional_information_id)
    REFERENCES additional_information (id);

-- Reference: weather_city (table: weather)
ALTER TABLE weather ADD CONSTRAINT weather_city FOREIGN KEY weather_city (city_id)
    REFERENCES city (id);

-- Reference: weather_day (table: weather)
ALTER TABLE weather ADD CONSTRAINT weather_day FOREIGN KEY weather_day (day_id)
    REFERENCES day (id);

-- Reference: weather_temperature (table: weather)
ALTER TABLE weather ADD CONSTRAINT weather_temperature FOREIGN KEY weather_temperature (temperature_id)
    REFERENCES temperature (id);

-- Reference: weather_time (table: weather)
ALTER TABLE weather ADD CONSTRAINT weather_time FOREIGN KEY weather_time (time_id)
    REFERENCES time (id);

-- Reference: weather_weater_condition (table: weather)
ALTER TABLE weather ADD CONSTRAINT weather_weater_condition FOREIGN KEY weather_weater_condition (weater_condition_id)
    REFERENCES weather_condition (id);

-- End of file.

