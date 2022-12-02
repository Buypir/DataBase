/*5.За Вашингтонським міжнародним договором від
початку 1922 р. заборонялося будувати лінійні кораблі
водотоннажністю понад 35 тис. тонн. Вкажіть кораблі, що порушили
цей договір (враховувати лише кораблі з відомим спуском на воду,
тобто з таблиці Ships). Виведіть: name, launched, displacement.*/

USE labor_sql;
SELECT name, launched, displacement
FROM ships AS sh
JOIN classes ON sh.class = classes.class
WHERE launched > 1922 AND displacement > 35000