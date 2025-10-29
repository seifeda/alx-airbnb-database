
---

-- Seed Script for Airbnb-like Database
-- USERS
INSERT INTO users
    (first_name, last_name, email, password_hash, role)
VALUES
    ('John', 'Doe', 'john@example.com', 'hashed_pwd_1', 'host'),
    ('Jane', 'Smith', 'jane@example.com', 'hashed_pwd_2', 'guest'),
    ('Admin', 'User', 'admin@airbnb.com', 'hashed_admin', 'admin');

-- PROPERTIES
INSERT INTO property
    (host_id, name, description, location, pricepernight)
SELECT user_id, 'Cozy Apartment', '2-bedroom apartment downtown.', 'New York', 120.00
FROM users
WHERE role='host';

-- BOOKINGS
INSERT INTO booking
    (property_id, user_id, start_date, end_date, total_price, status)
SELECT p.property_id, u.user_id, '2025-11-10', '2025-11-15', 600.00, 'confirmed'
FROM property p, users u
WHERE u.role='guest'


-- PAYMENTS
INSERT INTO payment
    (booking_id, amount, payment_method)
SELECT booking_id, 600.00, 'credit_card'
FROM booking LIMIT


-- REVIEWS
INSERT INTO review
    (property_id, user_id, rating, comment)
SELECT p.property_id, u.user_id, 5, 'Amazing stay!'
FROM property p, users u
WHERE u.role='guest'


-- MESSAGES
INSERT INTO message
    (sender_id, recipient_id, message_body)
SELECT u1.user_id, u2.user_id, 'Hi, is your property available next week?'
FROM users u1, users u2
WHERE u1.role='guest' AND u2.role='host'

