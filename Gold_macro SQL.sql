CREATE DATABASE Gold_Project;
USE Gold_Project;
CREATE TABLE Gold_Analsis (
Date TEXT,
GOLD_PRICE FLOAT,
DOLLAR_PRICE FLOAT,
VIX FLOAT,
FED_RATE FLOAT,
INFLATION FLOAT
);

SELECT COUNT(*) FROM Gold_Analysis;

RENAME TABLE Gold_Analsis TO Gold_Analysis;

ALTER TABLE Gold_Analysis ADD COLUMN Trade_Date_Clean DATE;

SET SQL_SAFE_UPDATES=0;

UPDATE Gold_Analysis 
SET Trade_Date_Clean = STR_TO_DATE(Date, '%d-%m-%Y');

ALTER TABLE Gold_Analysis DROP COLUMN Date;
ALTER TABLE Gold_Analysis RENAME COLUMN Trade_Date_Clean TO Date;

SELECT * FROM Gold_Analysis LIMIT 10;