/*3.Для кораблів таблиці Ships вивести країни, яким
вони належать.*/

USE labor_sql;
SELECT name, country
FROM ships
JOIN classes ON ships.class = classes.class
ORDER BY country