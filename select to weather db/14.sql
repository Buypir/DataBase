USE weather;

SELECT name, date_of_the_day, cataclysm_name
FROM weather_forecast
JOIN city ON weather_forecast.city_id = city.id
JOIN cataclysm_alert ON weather_forecast.cataclysm_alert_id = cataclysm_alert.id
