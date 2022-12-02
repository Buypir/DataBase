/*8.Для кожного виробника знайдіть середній
розмір екрану для ноутбуків, що ним випускається. Вивести: maker,
середній розмір екрану. (Підказка: використовувати підзапити в
якості обчислювальних стовпців)*/

SELECT distinct maker,
(SELECT avg(screen) from laptop WHERE model=product.model) avg_screen
FROM product
WHERE type LIKE "laptop"

