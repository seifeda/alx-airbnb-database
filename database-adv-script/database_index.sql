-- ============================================================
-- File: database_index.sql
-- Project: alx-airbnb-database
-- Description:
--   Create indexes on frequently used columns and measure performance
-- ============================================================

-- 1️⃣ Create indexes on high-usage columns
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_location ON Property(location);

-- 2️⃣ Measure performance before and after indexing
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    b.start_date,
    b.end_date
FROM Booking b
    JOIN User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
WHERE p.location = 'Addis Ababa'
    AND b.status = 'confirmed'
ORDER BY b.start_date;
