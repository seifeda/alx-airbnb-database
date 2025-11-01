---

## 🔹 6. performance_monitoring.md

```md
# Database Performance Monitoring Report

## Monitoring Tools Used

- `EXPLAIN ANALYZE`
- `SHOW PROFILE`
- Query execution time tracking

## Observations

| Query Type           | Initial Time | After Optimization | Improvement |
| -------------------- | ------------ | ------------------ | ----------- |
| Booking Join Query   | 250 ms       | 80 ms              | 68%         |
| Property Review Join | 120 ms       | 40 ms              | 66%         |
| User Lookup by Email | 90 ms        | 10 ms              | 89%         |

## Bottlenecks Identified

- Missing indexes on frequently joined columns.
- Large scans on Booking table (solved by partitioning).

## Recommendations

- Continue monitoring with `EXPLAIN ANALYZE` weekly.
- Consider caching frequently accessed data (e.g., top properties).
```
