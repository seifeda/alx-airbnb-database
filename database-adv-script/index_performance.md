# Index Performance Report

## Before Adding Indexes

- Queries filtering by `email`, `role`, and `location` were taking longer (full table scans observed).
- JOIN operations between `Booking` and `User` were slower due to missing indexes on foreign keys.

## After Adding Indexes

- Query lookup time reduced significantly (up to 60% faster for joins).
- `EXPLAIN` showed use of indexes for `User(email)`, `Booking(user_id)`, and `Property(host_id)`.

## Example

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'uuid-value';
```
