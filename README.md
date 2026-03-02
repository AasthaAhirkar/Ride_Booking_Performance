# 🚖 Ride Booking Performance | SQL + Power BI

## 📌 Project Overview

This project analyzes Rapido ride booking data to identify revenue trends, booking patterns, cancellation insights, customer behavior, and rating analysis.

The goal is to perform SQL-based data analysis and build an interactive Power BI dashboard for business decision-making.

---

## 🛠 Tools & Technologies Used

- SQL (MySQL)  
- Power BI  
- Data Modeling  
- DAX (Basic Measures)  
- Data Visualization  

---

## 🗄 Database Setup

```sql
CREATE DATABASE Rapido;
USE Rapido;

SELECT * FROM bookings;
```

---

# 📊 SQL Analysis Performed

---

### 1️⃣ Retrieve all successful bookings

```sql
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings 
WHERE Booking_Status = 'Success';
```

---

### 2️⃣ Average ride distance per vehicle type

```sql
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT vehicle_type,
       ROUND(AVG(ride_distance), 2) AS avg_dist
FROM bookings
GROUP BY vehicle_type;
```

---

### 3️⃣ Total cancelled rides by customers

```sql
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';
```

---

### 4️⃣ Top 5 customers by total rides

```sql
CREATE VIEW Top_5_Customers AS
SELECT customer_id,
       COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;
```

---

### 5️⃣ Driver cancellations (Personal & Car issues)

```sql
CREATE VIEW Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) AS cnt
FROM bookings
WHERE canceled_rides_by_Driver = 'Personal & Car related issue';
```

---

### 6️⃣ Max & Min Driver Rating (Prime Sedan)

```sql
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(driver_ratings) AS maximum_ratings,
       MIN(driver_ratings) AS minimum_ratings
FROM bookings
WHERE vehicle_type = 'Prime Sedan';
```

---

### 7️⃣ UPI Payments

```sql
CREATE VIEW UPI_Payment AS
SELECT *
FROM bookings
WHERE payment_method = 'UPI';
```

---

### 8️⃣ Average Customer Rating per Vehicle Type

```sql
CREATE VIEW AVG_Cust_Rating AS
SELECT vehicle_type,
       ROUND(AVG(customer_rating), 2) AS average
FROM bookings
GROUP BY vehicle_type;
```

---

### 9️⃣ Total Successful Ride Revenue

```sql
CREATE VIEW total_successful_ride_value AS
SELECT SUM(booking_value) AS total
FROM bookings
WHERE booking_status = 'Success';
```

---

### 🔟 Incomplete Rides with Reason

```sql
CREATE VIEW Incomplete_Ride_Reason AS
SELECT booking_id,
       incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';
```

---

# 📈 Power BI Dashboard

The dashboard is divided into **5 sections**:

---

## 1️⃣ Overall  
- Ride Volume Over Time  
- Booking Status Breakdown  
- KPI Cards (Total Bookings, Total Booking Value)

![Overall Dashboard](https://github.com/AasthaAhirkar/Ola_Ride_Bookings/blob/main/dashboard1.png)

---

## 2️⃣ Vehicle Type  
- Top Vehicle Types by Ride Distance  
- Avg Distance Travelled  
- Success Booking Value  

![Vehicle Dashboard](https://github.com/AasthaAhirkar/Ola_Ride_Bookings/blob/main/dashboard2.png)

---

## 3️⃣ Revenue  
- Revenue by Payment Method  
- Top 5 Customers by Booking Value  
- Ride Distance Distribution per Day  

![Revenue Dashboard](https://github.com/AasthaAhirkar/Ola_Ride_Bookings/blob/main/dashboard3.png)

---

## 4️⃣ Cancellation  
- Cancelled Rides by Customers  
- Cancelled Rides by Drivers  
- Cancellation Rate (28.08%)  

![Cancellation Dashboard](https://github.com/AasthaAhirkar/Ola_Ride_Bookings/blob/main/dashboard4.png)

---

## 5️⃣ Ratings  
- Driver Ratings by Vehicle Type  
- Customer Ratings by Vehicle Type  
- Customer vs Driver Rating Comparison  

![Ratings Dashboard](https://github.com/AasthaAhirkar/Ola_Ride_Bookings/blob/main/dashboard5.png)

---

# 📊 Key Insights

- **Total Bookings:** 103,024  
- **Total Revenue:** ₹35M+  
- **Cancellation Rate:** 28.08%  
- **Success Rate:** 62%  
- Cash & UPI are the **most used** payment methods  
- Driver-side cancellations mainly due to **personal & car-related issues**

---

# 🎯 Business Impact

- Identified operational inefficiencies through cancellation analysis  
- Highlighted top revenue-generating customers  
- Compared vehicle-type performance for better fleet optimization  
- Enabled interactive decision-making through Power BI filters & KPIs  

---

# 🚀 Conclusion

This project analyzes OLA ride booking data using SQL and Power BI to generate meaningful business insights.  
By evaluating booking trends, cancellations, revenue (₹35M+), and customer/driver ratings, the dashboard helps in data-driven decision-making and performance monitoring.
