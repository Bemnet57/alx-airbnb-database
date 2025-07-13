# alx-airbnb-database

#  Database Optimization and Design Repository

This repository contains SQL scripts and documentation related to the design, optimization, and performance analysis of a relational database schema for a property rental platform. The goal is to ensure high performance, scalability, and maintainability of the system as it grows.

---

##  Key Files

###  SQL Scripts

- `normalization.md` – Explains the normalization steps taken to bring the schema to 3NF.
- `joins_queries.sql` – Contains JOIN queries using `INNER`, `LEFT`, and `FULL OUTER JOIN`.
- `database_index.sql` – Creates indexes on high-usage columns and includes `EXPLAIN ANALYZE` for measuring impact.
- `performance.sql` – Compares initial vs. optimized query performance using `WHERE` and `AND`.
- `partitioning.sql` – Implements range partitioning on the `Booking` table by `start_date`.
- `aggregations_and_window_functions.sql` – Includes queries using `COUNT`, `GROUP BY`, and window functions like `ROW_NUMBER()`.

###  Reports

- `index_performance.md` – Explains which indexes were added and their impact.
- `optimization_report.md` – Details the query optimization strategies and outcomes.
- `partition_performance.md` – Evaluates the performance benefit of partitioning.
- `performance_monitoring.md` – Describes how `EXPLAIN ANALYZE` was used to monitor and tune query performance.

---

##  Technologies Used

- **SQL** – PostgreSQL syntax (can be adapted to MySQL/MariaDB)
- **EXPLAIN / EXPLAIN ANALYZE** – For performance profiling
- **Database design principles** – Normalization, indexing, partitioning
- **Markdown** – For clear and structured reporting

---

##  How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/Bemnet57/alx-airbnb-database.git
   cd alx-airbnb-database
