# SQL Scripts – Database Design & Optimization

This folder contains SQL scripts used for managing, optimizing, and analyzing the performance of a relational database schema for a property rental platform. The key areas covered include normalization, indexing, partitioning, and query tuning.

---

##  Files Overview

### 1. `normalization.md`
- Explains the normalization process up to Third Normal Form (3NF).
- Details each table's compliance and schema integrity.

### 2. `index_performance.sql`
- Contains `CREATE INDEX` statements for high-usage columns.
- Optimizes frequent queries by indexing `JOIN`, `WHERE`, and `ORDER BY` fields.

### 3. `performance.sql`
- Compares an initial complex join query with an optimized version.
- Includes `EXPLAIN ANALYZE` blocks for performance testing.

### 4. `partitioning.sql`
- Implements range-based partitioning on the `Booking` table using `start_date`.
- Includes sample queries to measure improvements.

---

##  How to Use

1. **Run EXPLAIN ANALYZE** on your most frequent queries to identify bottlenecks.
2. **Apply indexes** from `database_index.sql` to speed up filtering and joins.
3. **Partition large tables** like `Booking` using the guide in `partitioning.sql`.
4. Compare query plans before and after changes to validate improvements.

---

##  Technologies
- SQL (PostgreSQL syntax used; adjust for MySQL if needed)
- Tools: `EXPLAIN`, `ANALYZE`, `SHOW PROFILE`

---

##  Goal
These scripts aim to enhance database **performance**, ensure **data integrity**, and prepare the system to **scale efficiently** as data grows.


