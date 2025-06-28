INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'host'),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hash2', NULL, 'guest'),
  ('33333333-3333-3333-3333-333333333333', 'Eve', 'Admin', 'eve@example.com', 'hash3', '0987654321', 'admin');
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Cozy Cottage', 'A small cozy place in the woods.', 'Lakeview', 80.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Downtown Apartment', 'Modern apartment in the city center.', 'Metro City', 120.00);
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-07-01', '2025-07-05', 320.00, 'confirmed'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-08-10', '2025-08-15', 600.00, 'pending');
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  ('ccccccc1-cccc-cccc-cccc-cccccccccccc', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 320.00, 'paypal');
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  ('ddddddd1-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Amazing experience!'),
  ('ddddddd2-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 4, 'Nice location but noisy.');
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi, is the cottage available on July 1st?'),
  ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes! It is available for booking.');

