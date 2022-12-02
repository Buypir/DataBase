USE weather;

SELECT distinct city.name,
(SELECT avg(temperature_in_C) from weather_forecast WHERE city_id = city.id) avg_temperature
from city




