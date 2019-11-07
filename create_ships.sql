DROP DATABASE IF EXISTS ships CASCADE;
CREATE DATABASE ships;
USE ships;

CREATE TABLE Battles (
  name VARCHAR(50),
  date1 DATE
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t';

LOAD DATA INPATH '/user/samat/warehouse/battles.txt'
  INTO TABLE Battles;
LOAD DATA INPATH '/user/samat/warehouse/battles2.txt'
  INTO TABLE Battles;

CREATE TABLE Classes (
  class VARCHAR(50),
  type VARCHAR(2),
  country VARCHAR(20),
  numGuns SMALLINT,
  bore FLOAT,
  displacement INT
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '|';

LOAD DATA INPATH '/user/samat/warehouse/classes.txt'
  INTO TABLE Classes;
LOAD DATA INPATH '/user/samat/warehouse/classes2.txt'
  INTO TABLE Classes;

CREATE TABLE Ships (
  name VARCHAR(50),
  class VARCHAR(50),
  launched SMALLINT
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '&';

LOAD DATA INPATH '/user/samat/warehouse/ships.txt'
  INTO TABLE Ships;
LOAD DATA INPATH '/user/samat/warehouse/ships2.txt'
  INTO TABLE Ships;

CREATE TABLE Outcomes (
  ship VARCHAR (50),
  battle VARCHAR (20),
  result VARCHAR (10)
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '!';

LOAD DATA INPATH '/user/samat/warehouse/outcomes.txt'
  INTO TABLE Outcomes;
LOAD DATA INPATH '/user/samat/warehouse/outcomes2.txt'
  INTO TABLE Outcomes;
