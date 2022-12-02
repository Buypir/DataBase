/*4.Знайдіть виробників, що випускають ПК, але не
ноутбуки (використати ключове слово SOME). Вивести maker.*/

SELECT distinct maker
FROM product
WHERE type = 'PC' AND NOT maker = SOME(SELECT maker FROM product WHERE type = "laptop")


