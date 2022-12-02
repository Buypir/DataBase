/*7.Вкажіть битви, у яких брало участь, по крайній мірі,два кораблі однієї
 й тієї ж країни (Вибір країни здійснювати через таблицю Ships, а назви
 кораблів для таблиці Outcomes, що відсутні в таблиці Ships, не брати до
 уваги). Вивести: назву битви, країну, кількість кораблів.*/

SELECT country, battle, count(country)
FROM ships
JOIN classes ON ships.class = classes.class
JOIN outcomes ON ships.NAME = outcomes.ship
GROUP BY country, battle
HAVING count(country) >= 2;