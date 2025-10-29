# Database Seeding Script

This folder contains SQL scripts for populating the Airbnb database with sample data.

## Files

- `seed.sql`: Contains INSERT statements for all major entities.

## Instructions

Run the seed script after creating the schema:

```bash
psql -U postgres -d airbnb_db -f seed.sql
```
