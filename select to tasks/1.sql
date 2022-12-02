/*1.Знайдіть номер моделі, тип та ціну для всіх
принтерів, вартість яких менше 300 дол. Вивести: model, type, price.
Вихідні дані впорядкувати за спаданням за стовпцем type.*/

USE labor_sql;
SELECT model, type, price
FROM printer
WHERE price < 300
order by type;
