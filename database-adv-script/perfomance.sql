-- ======================================
-- Initial Full Join Query (Before Indexing/Optimization)
-- ======================================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- ======================================
-- Refactored Query (After Optimization)
-- ======================================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- ======================================
-- Performance Analysis (to be executed manually)
-- ======================================
-- Use these commands in your SQL client to compare performance:
-- 
-- EXPLAIN ANALYZE
-- SELECT ...
--
-- For example:
-- EXPLAIN ANALYZE
-- SELECT 
--     b.booking_id,
--     b.start_date,
--     b.end_date,
--     b.total_price,
--     ...
--     pay.payment_date
-- FROM Booking b
-- JOIN User u ON b.user_id = u.user_id
-- JOIN Property p ON b.property_id = p.property_id
-- LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

