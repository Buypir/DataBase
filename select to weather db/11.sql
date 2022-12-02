USE weather;

SELECT name, date_of_the_day, date_time, temperature_in_C, water_temperature, weather_condition_id,
 current_air_quality, humidity_in_percent, cloud_cover_in_percent
FROM weather_forecast
JOIN city ON weather_forecast.city_id = city.id

