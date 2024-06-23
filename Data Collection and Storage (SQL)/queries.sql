--Print the company_name field. Find the number of taxi rides for each taxi company for November 15-16, 2017, 
--name the resulting field trips_amount and print it, too. Sort the results by the trips_amount field in descending order.

SELECT cabs.company_name,
       Count(trips.trip_id)
FROM   cabs
       INNER JOIN trips
               ON trips.cab_id = cabs.cab_id
WHERE  trips.start_ts :: DATE BETWEEN '2017-11-15' AND '2017-11-16'
GROUP  BY cabs.company_name
ORDER  BY 2 DESC 

--Find the number of rides for every taxi companies whose name contains the words "Yellow" or "Blue" for November 1-7, 2017.
--Name the resulting variable trips_amount. Group the results by the company_name field.

SELECT cabs.company_name,
       Count(trips.trip_id)
FROM   cabs
       INNER JOIN trips
               ON trips.cab_id = cabs.cab_id
WHERE  trips.start_ts :: DATE BETWEEN '2017-11-01' AND '2017-11-07'
       AND ( cabs.company_name LIKE '%Yellow%'
              OR cabs.company_name LIKE '%Blue%' )
GROUP  BY cabs.company_name 

--For November 1-7, 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services. 
--Find the number of rides for these two companies and name the resulting variable trips_amount. 
--Join the rides for all other companies in the group "Other." Group the data by taxi company names. 
--Name the field with taxi company names company. Sort the result in descending order by trips_amount.

SELECT CASE cabs.company_name
         WHEN 'Flash Cab' THEN 'Flash Cab'
         WHEN 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
         ELSE 'Other'
       END                 AS company,
       Count(trips.cab_id) AS trips_amount
FROM   cabs
       LEFT JOIN trips
              ON trips.cab_id = cabs.cab_id
WHERE  trips.start_ts :: DATE BETWEEN '2017-11-01' AND '2017-11-07'
GROUP  BY company
ORDER  BY trips_amount DESC; 

--Retrieve the identifiers of the O'Hare and Loop neighborhoods  from the neighborhoods table.

SELECT neighborhood_id,
       name
FROM   neighborhoods
WHERE  name = 'O''Hare'
        OR name = 'Loop' 

--For each hour, retrieve the weather condition records from the weather_records table. Using the CASE operator, break all hours into two groups: 
--Bad if the description field contains the words rain or storm, and Good for others. Name the resulting field weather_conditions. 
--The final table must include two fields: date and hour (ts) and weather_conditions.

SELECT ts,
       CASE
         WHEN description LIKE '%rain%'
               OR description LIKE '%storm%' THEN 'Bad'
         ELSE 'Good'
       END AS weather_conditions
FROM   weather_records 

--Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) 
--on a Saturday and ended at O'Hare (dropoff_location_id: 63). Get the weather conditions for each ride. 
--Use the method you applied in the previous task. Also, retrieve the duration of each ride. 
--Ignore rides for which data on weather conditions is not available.
--Sort by trip_id.

SELECT trips.start_ts,
       CASE
         WHEN weather_records.description LIKE '%rain%'
               OR weather_records.description LIKE '%storm%' THEN 'Bad'
         ELSE 'Good'
       END AS weather_conditions,
       trips.duration_seconds
FROM   trips
       INNER JOIN weather_records
               ON weather_records.ts = trips.start_ts
WHERE  trips.pickup_location_id = (SELECT neighborhood_id
                                   FROM   neighborhoods
                                   WHERE  NAME = 'Loop')
       AND trips.dropoff_location_id = (SELECT neighborhood_id
                                        FROM   neighborhoods
                                        WHERE  NAME = 'O''Hare')
       AND Extract(isodow FROM trips.start_ts) = 6
ORDER  BY trips.trip_id 

