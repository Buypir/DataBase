USE weather;

SELECT country.name, date_of_the_day, temperature_in_C, water_temperature, current_air_quality, humidity_in_percent, sunrise, sunset
from weather_forecast
JOIN city ON weather_forecast.city_id = city.id
JOIN country ON city.country_id = country.id
WHERE
(CASE WHEN country.name = 'USA' THEN 1 ELSE 0 END +
CASE WHEN date_of_the_day > '2022.11.14' and date_of_the_day < '2022.11.22' THEN 1 ELSE 0 END +
CASE WHEN temperature_in_C > 20 THEN 1 ELSE 0 END +
CASE WHEN water_temperature > 15 THEN 1 ELSE 0 END +
CASE WHEN current_air_quality > 80 THEN 1 ELSE 0 END +
CASE WHEN humidity_in_percent > 65 THEN 1 ELSE 0 END +
CASE WHEN sunrise < '05:00' THEN 1 ELSE 0 END +
CASE WHEN sunset > '19:00' THEN 1 ELSE 0 END) >= 3;

