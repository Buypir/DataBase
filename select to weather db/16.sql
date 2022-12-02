USE weather;

SELECT CONCAT("city name: ", name) AS "",
CONCAT("date: ", date_of_the_day) AS "",
CONCAT("temperature: ", temperature_in_C, "C") AS "",
CONCAT("water temperature: ", water_temperature, "C") AS "",
CONCAT("air quality: ", current_air_quality, "%") AS "",
CONCAT("humidity: ", humidity_in_percent, "%") AS "",
CONCAT("cloud cover: ", cloud_cover_in_percent, "%") AS ""
FROM weather_forecast
JOIN city ON weather_forecast.city_id = city.id