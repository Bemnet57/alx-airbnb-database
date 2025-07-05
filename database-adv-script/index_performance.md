
-- Indexing high-usage columns based on WHERE, JOIN, and ORDER BY clauses

-- USER Table
CREATE INDEX idx_user_email ON User(email); -- Often used for lookup/login
CREATE INDEX idx_user_role ON User(role);   -- Useful for filtering by user role

-- BOOKING Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);         -- JOIN condition
CREATE INDEX idx_booking_property_id ON Booking(property_id); -- JOIN condition
CREATE INDEX idx_booking_status ON Booking(status);           -- Filtering
CREATE INDEX idx_booking_start_date ON Booking(start_date);   -- Date range filters

-- PROPERTY Table
CREATE INDEX idx_property_host_id ON Property(host_id);       -- JOIN with User
CREATE INDEX idx_property_location ON Property(location);     -- Filtering/search
CREATE INDEX idx_property_price ON Property(pricepernight);   -- Sorting/filtering

