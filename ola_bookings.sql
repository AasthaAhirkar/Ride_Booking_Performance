create database Ola;
use Ola;
select * from bookings 
limit 5

-- view
-- View are used in real-time projects to provide security, simplify complex queries, maintain data consistency, and give controlled access to data without exposing base tables.

-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select *
from bookings
where Booking_status='Success';

-- ans
select * from Successful_Bookings

-- 2. Find the average ride distance for each vehicle type:
create view ride_distance as
select vehicle_type,round(avg(ride_distance),2)as avg_distance
from bookings
group by Vehicle_Type
order by vehicle_type;

-- ans
select * from ride_distance;


-- 3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
select booking_status,count(*) as total_cancelled_Rides
from bookings
where booking_status='Canceled by Customer'

--ans
Select * from cancelled_rides_by_customers


-- 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
select customer_id,count(booking_id) as count_booking
from bookings
group by customer_id
order by count_booking desc
limit 5

-- ans
Select * from Top_5_Customers


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
select count(*) as count_cancel
from bookings
where booking_status='Canceled by driver' and Canceled_Rides_by_Driver='Personal & Car related issue'

-- ans
Select * from Rides_cancelled_by_Drivers_P_C_Issues

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
select vehicle_type,max(driver_ratings) as maxi,min(driver_ratings) as mini
from bookings
where vehicle_type='Prime Sedan'

-- ans
Select * from Max_Min_Driver_Rating;




-- 7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
select * 
from bookings
where payment_method='UPI'

-- ans
Select * from UPI_Payment

-- 8. Find the average customer rating per vehicle type:
Create View AVG_Cus_Rating As
select vehicle_type,round(avg(customer_rating),2) as avg_rating
from bookings
group by vehicle_type
order by vehicle_type

-- ans
Select * from AVG_Cus_Rating

-- 9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
select booking_status,sum(booking_value) as total_value
from bookings
where booking_status='Success'

-- ans
Select * from total_successful_ride_value



-- 10. List all incomplete rides along with the reason:
create view Incomplete_Ride_Reason as
select booking_id,incomplete_rides_reason
from bookings
where incomplete_rides='Yes' 

-- ans	
Select * from Incomplete_Rides_Reason