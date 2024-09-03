-- En la tabla de actores, ¿cuáles son los actores cuyos apellidos no se repiten?
USE sakila;
SELECT last_name, COUNT(*) AS cantidad
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- otra forma de hacerlo
SELECT DISTINCT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- ¿Qué apellidos aparecen más de una vez?
SELECT DISTINCT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- Utilizando la tabla de alquileres, averigüe cuántos alquileres procesó cada empleado
SELECT staff_id, COUNT(*) AS num_rental
FROM rental
GROUP BY staff_id;

-- Usando la tabla de películas, averigua cuántas películas se estrenaron cada año
SELECT release_year, COUNT(*) AS num_films
FROM film
GROUP BY release_year;

-- Usando la tabla de películas, averigua para cada clasificación cuántas películas había
SELECT rating, COUNT(*) AS num_films
FROM film
GROUP BY rating;

-- ¿Cuál es la duración media de la película para cada tipo de calificación? Redondea las longitudes medias a dos decimales.
SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating;

-- ¿Qué tipo de películas (calificación) tienen una duración media superior a dos horas?
SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating
HAVING ROUND(AVG(length), 2) > 120;
