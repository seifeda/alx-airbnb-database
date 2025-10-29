# Airbnb Database - ER Diagram

## 🎯 Objective

This document defines the entities, attributes, and relationships used in the Airbnb database system.  
It forms the foundation for designing the relational schema in later tasks.

---

## 🧱 Entities and Attributes

### 1. User

- **user_id (PK)**: UUID
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM('guest', 'host', 'admin'), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 2. Property

- **property_id (PK)**: UUID
- **host_id (FK)**: References User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 3. Booking

- **booking_id (PK)**: UUID
- **property_id (FK)**: References Property(property_id)
- **user_id (FK)**: References User(user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM('pending', 'confirmed', 'canceled'), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 4. Payment

- **payment_id (PK)**: UUID
- **booking_id (FK)**: References Booking(booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM('credit_card', 'paypal', 'stripe'), NOT NULL

---

### 5. Review

- **review_id (PK)**: UUID
- **property_id (FK)**: References Property(property_id)
- **user_id (FK)**: References User(user_id)
- **rating**: INTEGER (1–5), NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 6. Message

- **message_id (PK)**: UUID
- **sender_id (FK)**: References User(user_id)
- **recipient_id (FK)**: References User(user_id)
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 🔗 Relationships

| Relationship       | Type | Description                             |
| ------------------ | ---- | --------------------------------------- |
| User ↔ Property    | 1:N  | One host can list many properties       |
| User ↔ Booking     | 1:N  | One user can make many bookings         |
| Property ↔ Booking | 1:N  | One property can have multiple bookings |
| Booking ↔ Payment  | 1:1  | Each booking can have one payment       |
| Property ↔ Review  | 1:N  | One property can have multiple reviews  |
| User ↔ Review      | 1:N  | One user can write multiple reviews     |
| User ↔ Message     | N:N  | Users can send messages to each other   |

---
