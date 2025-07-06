

#  Index Performance Report

This document explains how indexing improved the performance of frequently used queries across the User, Booking, and Property tables.

---

##  High-Usage Columns Identified

- **User Table**: `email`, `role`
- **Booking Table**: `user_id`, `property_id`, `start_date`, `status`
- **Property Table**: `host_id`, `location`, `pricepernight`

---

##  Indexes Created

```sql
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);
```

---

##  Measured Using

```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.status, u.first_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.start_date >= '2024-01-01' AND b.status = 'confirmed';
```

---

##  Result

| Metric           | Before Indexing | After Indexing |
|------------------|------------------|-----------------|
| Seq Scan         | Yes              | No              |
| Execution Time   | High             | Reduced         |
| Index Scan Used  | No               | Yes             |

---

