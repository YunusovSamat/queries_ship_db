USE ships;

-- Задание: 33 (Serge I: 2002-11-02)
-- Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.
INSERT OVERWRITE DIRECTORY '/user/samat/warehouse/select/sel1'
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
SELECT ship FROM outcomes
  WHERE battle = 'North Atlantic'
    AND result = 'sunk';

-- Задание: 31 (Serge I: 2002-10-22)
-- Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.
INSERT OVERWRITE DIRECTORY '/user/samat/warehouse/select/sel2'
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
SELECT class, country FROM classes
  WHERE NOT bore < 16;

-- Задание: 14 (Serge I: 2002-11-05)
-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
INSERT OVERWRITE DIRECTORY '/user/samat/warehouse/select/sel3'
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
SELECT classes.class, name, country 
  FROM classes JOIN ships
    ON classes.class = ships.class 
      AND numGuns >= 10;

-- Задание: 34 (Serge I: 2002-11-04)
-- По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей.
INSERT OVERWRITE DIRECTORY '/user/samat/warehouse/select/sel4'
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
SELECT name
  FROM classes c JOIN ships s
    ON c.class = s.class
  WHERE launched >= 1922
    AND type = 'bb'
    AND displacement > 35000;

-- Задание: 36 (Serge I: 2003-02-17)
-- Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).
INSERT OVERWRITE DIRECTORY '/user/samat/warehouse/select/sel5'
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
SELECT ship
  FROM classes c JOIN outcomes o
    ON c.class = o.ship;
