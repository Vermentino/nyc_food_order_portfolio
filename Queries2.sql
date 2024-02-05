/*
Preliminary Data Exploration
*/
select * 
from food_order
limit 10
;
-- check data types and statistics
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'food_order';

SELECT MIN(food_preparation_time) AS min_prep_time,
        MAX(food_preparation_time) AS max_prep_time,
        MIN(delivery_time) AS min_delivery_time,
        MAX(delivery_time) AS max_delivery_time
FROM food_order; -- min_prep_time = 20, max_prep_time = 35, min_delivery_time = 15, max_delivery_time = 33

SELECT 
    AVG(food_preparation_time) AS avg_food_prep_time,
    AVG(delivery_time) AS avg_delivery_time
FROM food_order; -- avg_food_prep_time = 27.37, avg_delivery_time = 24.16

SELECT food_preparation_time AS mode_food_prep_time
FROM food_order
GROUP BY food_preparation_time
ORDER BY COUNT(*) DESC
LIMIT 1; -- mode = 21, which most restaurants are preparing the food faster than the average time. 

SELECT delivery_time AS mode_delivery_time
FROM food_order
GROUP BY delivery_time
ORDER BY COUNT(*) DESC
LIMIT 1;

-- check null values
select DISTINCT rating 
FROM food_order;

select DISTINCT food_preparation_time
FROM food_order;

select DISTINCT delivery_time
FROM food_order;

SELECT *
FROM food_order
WHERE rating IS NULL
   OR food_preparation_time IS NULL
   OR delivery_time IS NULL
   OR order_id IS NULL
   OR customer_id IS NULL
   OR restaurant_name IS NULL
   OR cuisine_type IS NULL
   OR cost_of_the_order IS NULL
   OR day_of_the_week IS NULL
;
-- no null values are found


-- Checking if order_id correlates with day_of_the_week. If yes, can identify the exact day of the week
select * 
from food_order
ORDER BY order_id ASC
limit 20
; -- day_of_the_week returned weekends and weekdays, so this hypothesis is false

-- looking at the data further
SELECT DISTINCT restaurant_name
from food_order; -- there are 178 restaurants in this dataset

SELECT DISTINCT cuisine_type
from food_order; -- there are 14 types of cuisine in this pg_database_collation_actual_version

SELECT DISTINCT day_of_the_week
from food_order;


