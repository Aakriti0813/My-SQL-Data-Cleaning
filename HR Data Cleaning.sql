USE Projects;

SELECT *
FROM hr;

DESCRIBE hr;

SELECT birthdate
FROM hr;

-- SET sql_safe_update = 0; //when you want to update 

UPDATE hr
SET birthdate = CASE
  WHEN birthdate LIKE '%/%'THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
  WHEN birthdate LIKE '%-%'THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
  ELSE NULL
END;

SELECT birthdate
FROM hr;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
  WHEN hire_date LIKE '%/%'THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
  WHEN hire_date LIKE '%-%'THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
  ELSE NULL
END;

ALTER TABLE hr 
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = null
WHERE termdate = '';

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

ALTER TABLE hr 
MODIFY COLUMN termdate DATE;

SELECT termdate
FROM hr;

ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT birthdate,age
FROM hr;

SELECT 
 min(age) AS youngest,
 max(age) AS oldest
FROM hr;

SELECT count(*) 
FROM hr 
WHERE age < 18;

SELECT *
FROM hr;

