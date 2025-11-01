# Query Optimization Report

## Initial Query Analysis

- Used `EXPLAIN` on the main JOIN query.
- Observed nested loop joins due to missing indexes on `property_id` and `booking_id`.

## Optimization Steps

1. Added indexes on:
   - `Booking.user_id`
   - `Booking.property_id`
   - `Payment.booking_id`
2. Simplified the query by removing unnecessary columns.

## Results

- Execution time reduced from 250ms → 80ms on average.
- JOIN operations now use index scans instead of full table scans.
