/*9.Знайдіть класи, у які входить лише один корабель з
усієї БД (врахувати також кораблі в таблиці Outcomes, яких немає в
таблиці Ships). Вивести: class.*/

SELECT class, count(shp.name)
FROM (SELECT name, class
FROM ships
UNION
SELECT classes.class, outcomes.ship
FROM classes, outcomes
WHERE classes.class=outcomes.ship) shp
GROUP BY class
HAVING count(shp.name) = 1