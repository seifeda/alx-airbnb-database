# Airbnb Database Normalization

## 🎯 Objective

Ensure the database is normalized up to the **Third Normal Form (3NF)** to reduce redundancy and maintain data integrity.

---

## 🧾 Step 1: First Normal Form (1NF)

**Rule:** Eliminate repeating groups and ensure atomicity.

- All attributes contain atomic values (no multiple phone numbers, etc.)
- Each table has a unique primary key.

✅ All tables in the Airbnb schema satisfy 1NF.

---

## 🧾 Step 2: Second Normal Form (2NF)

**Rule:** No partial dependency (every non-key attribute depends on the entire primary key).

- Each table has a single-column primary key (`UUID`), so there are no partial dependencies.
- For example, in `Booking`, all attributes depend entirely on `booking_id`.

✅ All tables satisfy 2NF.

---

## 🧾 Step 3: Third Normal Form (3NF)

**Rule:** Remove transitive dependencies.

- No non-key attribute depends on another non-key attribute.
- Example: In `Property`, `host_id` → `User`. All property details depend on `property_id`, not on `User`.

✅ The Airbnb database schema satisfies 3NF.

---

## ✅ Conclusion

All tables are in **Third Normal Form (3NF)**:

- No redundant data.
- Each table stores a single, well-defined entity.
- Relationships are enforced through foreign keys.

Normalization ensures scalability, consistency, and efficient data retrieval.
