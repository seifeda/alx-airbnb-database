# Database Schema Definition

This folder contains SQL scripts for defining the Airbnb relational database schema.

## Files

- `schema.sql`: Contains all CREATE TABLE statements, constraints, and indexes.

## Instructions

1. Run the following in PostgreSQL:
   ```bash
   psql -U postgres -d airbnb_db -f schema.sql
   ```
