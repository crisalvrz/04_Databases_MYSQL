DROP DATABASE IF EXISTS matemáticas;
CREATE DATABASE matemáticas;
USE matemáticas;

CREATE TABLE ec2grado (
   a int,
   b int,
   c int
);

INSERT INTO ec2grado 
VALUES 
(1,8,3),(4,-9,2),(2,8,1),(3,8,2),(2,-5,1),(1,2,1),(1,5,9),(2,8,1),(3,7,3),(3,5,2),(1,8,2);
-- 1 muestra los dos resultados de las ecuaciones de 2º grado

SELECT a, b, c,  
    (-b + SQRT(POW(b, 2) - 4 * a * c)) / (2 * a) AS x1,
    (-b - SQRT(POW(b, 2) - 4 * a * c)) / (2 * a) AS x2
FROM ec2grado
WHERE (POW(b, 2) - 4 * a * c) >= 0;