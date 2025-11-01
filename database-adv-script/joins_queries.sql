-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
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
    INNER JOIN    User
u ON b.user_id = u.user_id;

-- LEFT JOIN: Retrieve all properties and their reviews (include properties without reviews)
SELECT
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
    LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.property_id;

-- FULL OUTER JOIN: Retrieve all users and all bookings (include users with no bookings or orphan bookings)
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM User u
    FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
