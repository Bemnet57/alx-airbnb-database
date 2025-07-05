-- ======================================
-- STEP 1: Create a new partitioned Booking table
-- ======================================
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- ======================================
-- STEP 2: Create partitions (monthly as an example)
-- You can adjust for quarterly, yearly, etc.
-- ======================================

CREATE TABLE Booking_2024_01 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE Booking_2024_02 PARTITION OF Booking
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE Booking_2024_03 PARTITION OF Booking
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

-- Add more partitions as needed for future or past months

-- ======================================
-- STEP 3: Sample Query for Performance Testing
-- ======================================

-- This query should now only scan relevant partition(s)
EXPLAIN ANALYZE
SELECT 
    booking_id, user_id, start_date, end_date, status
FROM Booking
WHERE start_date BETWEEN '2024-02-01' AND '2024-02-28';

