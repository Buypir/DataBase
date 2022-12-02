USE weather;

SELECT name, date_of_the_day, temperature_in_C, label, description
FROM weather_forecast
JOIN city ON weather_forecast.city_id = city.id
JOIN weather_condition ON weather_forecast.weather_condition_id = weather_condition.id
WHERE label = 'Rain'