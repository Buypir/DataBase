/*10.Визначити назви всіх кораблів із таблиці Ships, які
задовольняють, у крайньому випадку, комбінації будь-яких трьох кри-
теріїв із наступного списку: numGuns=9, bore=16, displacement=46000,
type='bb', country='Japan', launched=1916, class='Revenge'. Вивести:
name, numGuns, bore, displacement, type, country, launched, class.
(Підказка: використати для перевірки умов оператор CASE)*/

SELECT name, numGuns, bore, displacement, type, country, launched, ships.class
FROM ships
JOIN classes ON ships.class = classes.class
WHERE
(CASE WHEN numGuns = 9 THEN 1 ELSE 0 END +
CASE WHEN bore = 16 THEN 1 ELSE 0 END +
CASE WHEN displacement = 46000 THEN 1 ELSE 0 END +
CASE WHEN type = 'bb' THEN 1 ELSE 0 END +
CASE WHEN country = 'Japan' THEN 1 ELSE 0 END +
CASE WHEN launched = 1916 THEN 1 ELSE 0 END +
CASE WHEN ships.class = 'Revenge' THEN 1 ELSE 0 END) >= 3;