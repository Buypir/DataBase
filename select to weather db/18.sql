USE weather;

SELECT city.name, date_of_the_day, day.name
FROM weather_forecast
JOIN city ON weather_forecast.city_id = city.id
JOIN day ON weather_forecast.date_of_the_day = day.day_of_the_month
WHERE day.name = 'Saturday'