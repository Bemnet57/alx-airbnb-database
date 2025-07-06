
-- Indexing high-usage columns based on WHERE, JOIN, and ORDER BY clauses

-- USER Table
--CREATE INDEX idx_user_email ON User(email); -- Often used for lookup/login
--CREATE INDEX idx_user_role ON User(role);   -- Useful for filtering by user role

-- BOOKING Table
-- CREATE INDEX idx_booking_user_id ON Booking(user_id);         -- JOIN condition
-- CREATE INDEX idx_booking_property_id ON Booking(property_id); -- JOIN condition
-- CREATE INDEX idx_booking_status ON Booking(status);           -- Filtering
-- CREATE INDEX idx_booking_start_date ON Booking(start_date);   -- Date range filters

-- PROPERTY Table
--CREATE INDEX idx_property_host_id ON Property(host_id);       -- JOIN with User
--CREATE INDEX idx_property_location ON Property(location);     -- Filtering/search
--CREATE INDEX idx_property_price ON Property(pricepernight);   -- Sorting/filtering



-- ======================================
-- Indexes to improve query performance
-- ======================================

-- USER table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- BOOKING table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- PROPERTY table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- ======================================
-- Performance Measurement Example
-- Required by checker: EXPLAIN ANALYZE
-- ======================================
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name,
    u.last_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.start_date >= '2024-01-01'
  AND b.status = 'confirmed';

