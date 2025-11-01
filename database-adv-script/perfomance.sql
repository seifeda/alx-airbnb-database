-- ============================================================
-- File: perfomance.sql
-- Project: alx-airbnb-database
-- Description:
--   Retrieve all bookings with user, property, and payment details
--   and analyze query performance.
-- ============================================================

-- 1️⃣ Initial query retrieving all bookings with related details
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.payment_method,
    b.start_date,
    b.end_date,
    b.status
FROM Booking b
    JOIN   User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
    AND pay.amount > 0
ORDER BY b.start_date;


-- 2️⃣ Analyze the query’s performance
EXPLAIN
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.payment_method,
    b.start_date,
    b.end_date,
    b.status
FROM Booking b
    JOIN User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
    AND pay.amount > 0
ORDER BY b.start_date;
