DROP DATABASE IF EXISTS fechas;
CREATE DATABASE IF NOT EXISTS fechas;



CREATE TABLE fechas (
    fec_vigencia date,
    fec_fin_mes_anterior date,
    fec_fin_mes date,
    primary key(fec_vigencia)
);

 /* mostrar para cada fecha del campo fecha vigencia ultimo dia del mes anterior y ultimo 
 dia del mes en el que estoy en una nueva tabla*/

INSERT INTO fechas(fec_vigencia) values('2024-11-29');
INSERT INTO fechas(fec_vigencia) values('2024-11-30');
INSERT INTO fechas(fec_vigencia) values('2024-12-01');
INSERT INTO fechas(fec_vigencia) values('2024-12-02');
INSERT INTO fechas(fec_vigencia) values('2024-12-03');
INSERT INTO fechas(fec_vigencia) values('2024-12-04');
INSERT INTO fechas(fec_vigencia) values('2024-12-05');
INSERT INTO fechas(fec_vigencia) values('2024-12-06');
INSERT INTO fechas(fec_vigencia) values('2024-12-07');
INSERT INTO fechas(fec_vigencia) values('2024-12-08');

SELECT * from fechas;

-- ALTER TABLE fechas UPDATE fec_vigencia

SET GLOBAL lc_time_names = 'es_ES';

SELECT 
    fec_vigencia,
    LAST_DAY(DATE_SUB(fec_vigencia, INTERVAL 1 MONTH)) AS fec_fin_mes_anterior, 
   
    LAST_DAY(fec_vigencia) AS fec_fin_mes
FROM 
    fechas;
 /* DATE_SUB:resta un periodo de tiempo definido de un valor fecha, 
    INTERVAL 1 MONTH agrua datos en intervalos de tiempo,
    LAST_DAY coge el ultimo dia del mes*/
    
    
