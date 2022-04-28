--1
INSERT INTO rental_records (rental_id, veh_reg_no, customer_id, start_date, end_date, lastUpdated)
VALUES(
    NULL, 
    'SBA1111A', 
    (SELECT customer_id FROM customers WHERE name = 'Angel'),
    NOW(),
    DATE_ADD(NOW(), INTERVAL 10 DAY),
    NULL
    );

--2
INSERT INTO rental_records (rental_id, veh_reg_no, customer_id, start_date, end_date, lastUpdated)
VALUES(
    NULL, 
    'SBA1111A', 
    (SELECT customer_id FROM customers WHERE name = 'Angel'),
    DATE_ADD(NOW(), INTERVAL 1 DAY),
    DATE_ADD(NOW(), INTERVAL 10 DAY),
    NULL
    );

--3
SELECT start_date, end_date, rental_records.veh_reg_no, brand, customers.name 
FROM rental_records
RIGHT JOIN vehicles
ON rental_records.veh_reg_no = vehicles.veh_reg_no
RIGHT JOIN customers
ON rental_records.customer_id = customers.customer_id
ORDER BY category, start_date;

--4
SELECT * 
FROM rental_records
WHERE (end_date<CURDATE());

--5
SELECT 
rental_records.veh_reg_no,
customers.name,
rental_records.start_date, 
rental_records.end_date
FROM rental_records 
INNER JOIN Vehicles USING(veh_reg_no)
INNER JOIN Customers USING(customer_id)
WHERE ('2012-01-10' BETWEEN rental_records.start_date and rental_records.end_date); 

--6
SELECT 
rental_records.veh_reg_no,
customers.name,
rental_records.start_date,
rental_records.end_date
FROM rental_records
INNER JOIN Vehicles Using(veh_reg_no)
INNER JOIN Customers Using(customer_id)
WHERE (CURDATE() BETWEEN rental_records.start_date AND rental_records.End_date);

--7
SELECT t1.veh_reg_no, t1.category, t1.brand, t2.start_date, t2.end_date FROM vehicles AS t1 
INNER JOIN rental_records AS t2 ON t1.veh_reg_no = t2.veh_reg_no
INNER JOIN customers AS t3 ON t3.customer_id = t2.customer_id 
WHERE t1.veh_reg_no IN (
    SELECT
        t1.veh_reg_no
    FROM
        vehicles
    WHERE
        (t2.start_date BETWEEN '2012-01-03' AND '2012-01-18')
        OR
        (t2.end_date BETWEEN '2012-01-03' AND '2012-01-18')
        OR
        (t2.start_date <= '2012-01-03' AND t2.end_date > '2012-01-18')
    );

--8
SELECT 
rental_records.veh_reg_no,
vehicles.brand,
vehicles.desc
FROM rental_records
INNER JOIN Vehicles Using(veh_reg_no)
WHERE NOT ('2012-01-10' BETWEEN rental_records.start_date AND rental_records.end_date); 

--9
SELECT 
rental_records.veh_reg_no,
vehicles.brand,
vehicles.desc
FROM rental_records
INNER JOIN Vehicles USING(veh_reg_no)
WHERE NOT ((rental_records.start_date BETWEEN '2012-01-03' AND '2012-01-18') OR
(rental_records.end_date BETWEEN '2012-01-03' AND '2012-01-18') OR 
((rental_records.start_date < '2012-01-03') AND (rental_records.end_date > '2012-01-18')));

--10
SELECT 
rental_records.veh_reg_no,
vehicles.brand,
vehicles.desc
FROM rental_records
INNER JOIN Vehicles USING(veh_reg_no)
WHERE (rental_records.start_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 10 DAY)) OR 
(rental_records.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 10 DAY)) OR
((rental_records.start_date < CURDATE()) AND (rental_records.end_date > DATE_ADD(CURDATE(), INTERVAL 10 DAY))); 