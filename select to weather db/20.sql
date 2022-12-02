USE weather;

SELECT distinct city.name,
(SELECT min(temperature_in_C) from weather_forecast WHERE city_id = city.id) min_temperature,
(SELECT max(temperature_in_C) from weather_forecast WHERE city_id = city.id) max_temperature
FROM city
JOIN country ON city.country_id = country.id
WHERE country.name LIKE 'Ukraine'