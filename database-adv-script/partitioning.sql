-- Partition Booking table based on start_date (by year)
CREATE TABLE Booking_2024 (LIKE Booking INCLUDING ALL);
CREATE TABLE Booking_2025 (LIKE Booking INCLUDING ALL);

-- Create partitioned parent table
CREATE TABLE Booking_partitioned
(
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE
(start_date);

-- Attach partitions
ALTER TABLE Booking_partitioned ATTACH PARTITION Booking_2024 FOR VALUES FROM
('2024-01-01') TO
('2025-01-01');
ALTER TABLE Booking_partitioned ATTACH PARTITION Booking_2025 FOR VALUES FROM
('2025-01-01') TO
('2026-01-01');
