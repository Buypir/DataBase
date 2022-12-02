/*6.Для таблиці PC вивести всю інформацію з
коментарями в кожній комірці, наприклад, 'модель: 1121', 'ціна:
600,00' і т.д.*/

USE labor_sql;
SELECT CONCAT("code: ", code) AS "",
CONCAT("model: ", model) AS "",
CONCAT("speed: ", speed) AS "",
CONCAT("ram: ", ram) AS "",
CONCAT("hd: ", hd) AS "",
CONCAT("cd: ", cd) AS "",
CONCAT("price: ", price, "$") AS ""
FROM pc;