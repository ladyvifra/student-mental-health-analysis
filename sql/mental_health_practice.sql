
-- Archivo: sql/mental_health_practice.sql
-- Consultas básicas para practicar SQL con la base de datos "student_mental_health"

-- 1. Ver cuántos registros tiene la tabla
SELECT COUNT(*) AS total_registros
FROM student_mental_health;

-- 2. Ver los primeros 10 registros
SELECT * FROM student_mental_health 
LIMIT 10;

-- 3. Contar cuántos estudiantes internacionales y domésticos hay
SELECT inter_dom, COUNT(*) AS cantidad 
FROM student_mental_health 
GROUP BY inter_dom;

-- 4. Filtrar estudiantes internacionales
SELECT * 
FROM student_mental_health 
WHERE inter_dom = 'Inter';

-- 5. Ver estudiantes con campos nulos en depresión, ansiedad o estrés
SELECT * FROM student_mental_health 
WHERE todep IS NULL OR tosc IS NULL OR toas IS NULL;

-- 6. Ver promedio de depresión por duración de la estadía
SELECT stay, ROUND(AVG(todep), 2) AS promedio_depresion
FROM student_mental_health
GROUP BY stay
ORDER BY stay;

-- 7. Ver todos los registros con nivel de ansiedad mayor a 80
SELECT * 
FROM student_mental_health 
WHERE toas > 80;

-- 8. Ver registros donde el nivel de estrés esté entre 30 y 40
SELECT * 
FROM student_mental_health 
WHERE tosc 
BETWEEN 30 AND 40;

-- 9. Ordenar por nivel de depresión descendente
SELECT * 
FROM student_mental_health 
ORDER BY todep DESC;

-- 10. Ver promedio de las tres variables agrupadas por si es Inter o Dom
SELECT inter_dom, 
       ROUND(AVG(todep), 2) AS avg_dep, 
       ROUND(AVG(tosc), 2) AS avg_stress, 
       ROUND(AVG(toas), 2) AS avg_anxiety
FROM student_mental_health
GROUP BY inter_dom;
