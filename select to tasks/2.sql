/*2.Вивести назви битв, які складаються із двох слів та
друге слово не закінчується на літеру 'c'.*/

USE labor_sql;
SELECT name
FROM battles
WHERE name NOT LIKE "% %c" AND name LIKE "% %";