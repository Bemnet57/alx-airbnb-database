
# Database Normalization Steps

This document describes the normalization process applied to a property rental system database, transforming the schema through 1NF, 2NF, and 3NF.

---

##  Step 1: Unnormalized Form (UNF)

The original schema is already designed with a degree of normalization in mind. However, we start by listing all attributes per table, identifying composite, multi-valued, or non-atomic attributes (none present here).

---

##  Step 2: First Normal Form (1NF)

**Goal:** Eliminate repeating groups and ensure atomicity.

- All attributes in all tables already store atomic values.
- No repeating groups exist.
- All fields contain only one value.

 **Result:** All tables already comply with 1NF.

---

##  Step 3: Second Normal Form (2NF)

**Goal:** Remove partial dependencies (i.e., non-prime attributes should fully depend on the entire primary key).

Since all tables use **UUIDs** as primary keys (not composite keys), partial dependencies do **not exist**.

 **Result:** Schema is in 2NF.

---

##  Step 4: Third Normal Form (3NF)

**Goal:** Remove transitive dependencies (non-key attributes must depend only on the primary key).

Let’s examine each table:

###  User
- **Primary Key**: `user_id`
- All attributes (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`) are **directly dependent** on `user_id`.

 3NF-compliant.

---

###  Property
- **Primary Key**: `property_id`
- `host_id` is a foreign key to `User`.
- Attributes like `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at` directly depend on `property_id`.

 3NF-compliant.

---

###  Booking
- **Primary Key**: `booking_id`
- `property_id`, `user_id` are FKs (to `Property` and `User`).
- `start_date`, `end_date`, `total_price`, `status`, `created_at` depend solely on `booking_id`.

 3NF-compliant.

---

###  Payment
- **Primary Key**: `payment_id`
- `booking_id` is FK.
- All attributes (`amount`, `payment_method`, `payment_date`) depend on `payment_id`.

 3NF-compliant.

---

### Review
- **Primary Key**: `review_id`
- `property_id`, `user_id` are FKs.
- `rating`, `comment`, `created_at` depend directly on `review_id`.

 3NF-compliant.

---

###  Message
- **Primary Key**: `message_id`
- `sender_id`, `recipient_id` are FKs.
- `message_body`, `sent_at` are directly related to `message_id`.

3NF-compliant.

---

##  Final Normalized Schema Summary

All tables are in **Third Normal Form (3NF)** with the following properties:

- Each table has a primary key.
- No partial or transitive dependencies exist.
- Referential integrity enforced through foreign keys.
- ENUMs and constraints enforce domain integrity.
- Indexes improve query performance.

---

##  Constraints Summary

| Table      | Constraint Description |
|------------|------------------------|
| **User**     | `email` unique, `role` enum, non-null names and email |
| **Property** | `host_id` FK to User, non-null essential info |
| **Booking**  | FKs to Property and User, `status` enum |
| **Payment**  | FK to Booking, `payment_method` enum |
| **Review**   | Rating (1–5), FKs to Property and User |
| **Message**  | FKs to sender and recipient |

---

##  Indexing Summary

| Table       | Indexed Columns               |
|-------------|-------------------------------|
| User        | `user_id` (PK), `email`       |
| Property    | `property_id` (PK), `host_id` |
| Booking     | `booking_id` (PK), `user_id`, `property_id` |
| Payment     | `payment_id` (PK), `booking_id` |
| Review      | `review_id` (PK), `property_id`, `user_id` |
| Message     | `message_id` (PK), `sender_id`, `recipient_id` |

---

##  Conclusion

The original schema is well-designed and already conforms to 3NF. The normalization process confirms that there are no redundant dependencies or repeating groups, ensuring an efficient, consistent, and scalable database design.

