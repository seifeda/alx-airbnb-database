# SQL Joins Practice — Airbnb Database

## 📘 Overview

This file demonstrates the use of **SQL JOIN operations** on the Airbnb database schema.  
The queries combine data across multiple related tables (`User`, `Property`, `Booking`, and `Review`) to extract meaningful insights.

The goal is to master different types of joins:

- **INNER JOIN**
- **LEFT JOIN**
- **FULL OUTER JOIN**

---

## 🧩 Database Entities Used

The following tables are referenced in the join queries:

- **User**
  - `user_id`, `first_name`, `last_name`, `email`, `role`
- **Property**
  - `property_id`, `host_id`, `name`, `description`, `location`
- **Booking**
  - `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`
- **Review**
  - `review_id`, `property_id`, `user_id`, `rating`, `comment`

---

## 🔹 1. INNER JOIN

### **Objective:**

Retrieve all bookings and the respective users who made those bookings.

### **Query:**

```sql
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    u.email,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;
```
