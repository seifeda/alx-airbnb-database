-- Subquery: Find all properties with average rating > 4.0
SELECT
    p.property_id,
    p.name,
    p.location
FROM Property p
WHERE p.property_id IN (
    SELECT property_id
FROM Review
GROUP BY property_id
HAVING AVG(rating) > 4.0
);

-- Correlated Subquery: Find users who made more than 3 bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM User u
WHERE (
    SELECT COUNT(*)
FROM Booking b
WHERE b.user_id = u.user_id
) > 3;
