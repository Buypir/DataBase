create database if not exists weather;

use weather;

drop table if exists weather_forecast;
drop table if exists period;
drop table if exists city;
drop table if exists country;
drop table if exists time;
drop table if exists day;
drop table if exists additional_information;
drop table if exists weather_condition;
drop table if exists cataclysm_alert;


create table country (
id int not null auto_increment,
name varchar(40) not null,
constraint country_pk primary key (id)
);

create table city (
id int not null auto_increment,
name varchar(40) not null,
country_id int not null,
constraint city_pk primary key (id)
);

create table weather_forecast (
id int not null auto_increment,
city_id int not null,
date_of_the_day date not null,
date_time time null,
temperature_in_C double(150, 1) not null,
water_temperature double(120, 1) not null,
weather_condition_id int not null,
current_air_quality int not null,
humidity_in_percent int not null,
cloud_cover_in_percent int not null,
sunrise time not null,
sunset time not null,
cataclysm_alert_id int null,
constraint weather_forecast_pk primary key (id)
);

create table period (
id int not null auto_increment,
start_date date not null,
weather_forecast_id int not null,
end_date date not null,
constraint period_pk primary key (id)
);

create table time (
time time not null,
constraint time_pk primary key (time)
);

create table day (
day_of_the_month date not null,
name varchar(13) null,
constraint day_pk primary key (day_of_the_month) 
);

create table weather_condition (
id int not null auto_increment,
label varchar(25) not null,
description varchar(30) not null,
constraint weather_condition_pk primary key(id)
);

create table cataclysm_alert (
id int not null auto_increment,
cataclysm_name varchar(30) not null,
constraint cataclysm_alert_pk primary key(id) 
);

ALTER TABLE city ADD CONSTRAINT city_country FOREIGN KEY city_country (country_id)
    REFERENCES country (id);

ALTER TABLE weather_forecast ADD CONSTRAINT weather_forecast_city FOREIGN KEY weather_forecast_city (city_id)
    REFERENCES city (id);

ALTER TABLE weather_forecast ADD CONSTRAINT weather_forecast_day FOREIGN KEY weather_forecast_day (date_of_the_day)
    REFERENCES day (day_of_the_month);

ALTER TABLE weather_forecast ADD CONSTRAINT weather_forecast_time FOREIGN KEY weather_forecast_time (date_time)
    REFERENCES time (time);

ALTER TABLE weather_forecast ADD CONSTRAINT weather_forecast_weather_condition FOREIGN KEY weather_forecast_weather_condition (weather_condition_id)
    REFERENCES weather_condition (id);
    
ALTER TABLE weather_forecast ADD CONSTRAINT weather_forecast_cataclysm_alert FOREIGN KEY weather_forecast_cataclysm_alert (cataclysm_alert_id)
	REFERENCES cataclysm_alert (id);
    
ALTER TABLE period ADD CONSTRAINT period_weather_forecast FOREIGN KEY period_weather_forecast (weather_forecast_id)
	REFERENCES weather_forecast (id);
    
CREATE INDEX city_name_index ON city(name);


INSERT INTO country(name) VALUES
('Ukraine'), -- 1
('USA'), -- 2
('France'), -- 3
('Poland'), -- 4
('Bulgaria'), -- 5
('England'); -- 6

INSERT INTO city(name, country_id) VALUES
('Kyiv', '1'), -- 1 Kyiv
('Vinnytsia', '1'), -- 2 Vinnytsia
('Rivne', '1'), -- 3 Rivne
('Lviv', '1'), -- 4 Lviv
('San Francisco', '2'), -- 5 San Francisco
('Los Angeles', '2'), -- 6 Los Angeles
('Chicago', '2'), -- 7 Chicago
('New York', '2'), -- 8 New York
('Paris', '3'), -- 9 Paris
('Lyon', '3'), -- 10 Lyon
('Warsaw', '4'), -- 11 Warsaw
('Sofia', '5'), -- 12 Sofia
('Varna', '5'), -- 13 Varna
('London', '6'); -- 14 London

INSERT INTO cataclysm_alert(cataclysm_name) VALUES
('earthquake'), -- 1
('tornado'), -- 2
('flood'), -- 3
('tsunami'); -- 4

INSERT INTO time(time) VALUES
('01:00'), ('02:00'),
('03:00'), ('04:00'),
('05:00'), ('06:00'),
('07:00'), ('08:00'),
('09:00'), ('10:00'),
('11:00'), ('12:00'),
('13:00'), ('14:00'),
('15:00'), ('16:00'),
('17:00'), ('18:00'),
('19:00'), ('20:00'),
('21:00'), ('22:00'),
('23:00'), ('00:00');

INSERT INTO day(day_of_the_month, name) VALUES
('2022-11-12', 'Saturday'), ('2022-11-13', 'Sunday'),
('2022-11-14', 'Monday'), ('2022-11-15', 'Tuesday'),
('2022-11-16', 'Wednesday'), ('2022-11-17', 'Thursday'),
('2022-11-18', 'Friday'), ('2022-11-19', 'Saturday'),
('2022-11-20', 'Sunday'), ('2022-11-21', 'Monday'),
('2022-11-22', 'Tuesday'), ('2022-11-23', 'Wednesday'),
('2022-11-24', 'Thursday'), ('2022-11-25', 'Friday');

INSERT INTO weather_condition(label, description) VALUES
('Rain', 'its raining'),
('Sunny', 'the sun shines'),
('Fog', 'be careful on the road'),
('Cloudy', 'the sky is darkened');

INSERT INTO weather_forecast(city_id, date_of_the_day, date_time, temperature_in_C, water_temperature, weather_condition_id,
							 current_air_quality, humidity_in_percent, cloud_cover_in_percent, sunrise, sunset, cataclysm_alert_id) VALUES
('1', '2022-11-12', '14:00', '13.6', '12', '4', '56', '44', '41', '06:24', '16:43', null),
('1', '2022-11-13', '14:00', '14.2', '12', '4', '56', '44', '41', '06:24', '16:43', null),
('1', '2022-11-14', '12:00', '16.2', '6', '3', '42', '56', '36', '06:42', '16:59', '3'),
('1', '2022-11-16', null, '12.4', '5', '2', '84', '48', '24', '07:02', '15:02', null),
('1', '2022-11-15', null, '15.8', '14', '1', '76', '92', '97', '04:09', '15:07', '2'),
('1', '2022-11-17', null, '19.5', '9', '2', '69', '45', '52', '05:10', '16:22', null),
('1', '2022-11-18', '14:00', '13.6', '12', '4', '56', '44', '41', '06:24', '16:43', null),
('2', '2022-11-12', '18:00', '18.6', '16', '2', '82', '32', '84', '04:32', '20:43', null),
('2', '2022-11-14', null, '24.6', '14', '2', '94', '48', '76', '04:54', '20:24', '1'),
('2', '2022-11-15', null, '22.8', '20', '3', '36', '82', '52', '05:03', '20:13', null),
('3', '2022-11-12', '16:00', '19.6', '18', '3', '72', '62', '82', '04:50', '16:52', null),
('3', '2022-11-15', '22:00', '18.4', '9', '3', '34', '26', '25', '07:32', '17:32', '3'),
('4', '2022-11-17', '14:00', '15.7', '6', '1', '27', '55', '74', '06:54', '18:24', null),
('7', '2022-11-22', null, '16.2', '12', '2', '71', '42', '50', '06:02', '17:32', '2'),  
('8', '2022-11-12', null, '17.7', '13', '3', '36', '36', '46', '06:38', '16:45', null),  
('7', '2022-11-14', '21:00', '14.3', '6', '3', '52', '74', '62', '05:42', '16:15', '3'),  
('11', '2022-11-16', null, '22.8', '20', '2', '64', '52', '12', '04:36', '18:21', null),  
('9', '2022-11-19', '09:00', '25.7', '21', '1', '97', '61', '9', '05:51', '19:22', '4'),  
('10', '2022-11-14', '16:00', '24.4', '10.6', '4', '51', '24', '21', '04:31', '20:23', null),
('12', '2022-11-15', null, '22.7', '10.9', '3', '74', '62', '42', '05:26', '21:16', null),    
('12', '2022-11-16', '16:00', '14.4', '6', '2', '36', '53', '51', '06:52', '21:08', '2'),    
('14', '2022-11-24', null, '18.6', '12.4', '3', '52', '17', '18', '07:21', '20:47', '3'),    
('13', '2022-11-13', '16:00', '19.2', '13.7', '1', '17', '91', '9', '08:24', '22:10', null),    
('11', '2022-11-18', null, '15.7', '6.3', '2', '72', '42', '12', '05:36', '18:42', '1'),    
('10', '2022-11-20', null, '16.9', '21.4', '1', '86', '64', '41', '06:31', '19:36', null);                         