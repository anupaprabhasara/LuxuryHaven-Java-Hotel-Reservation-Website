-- ============================
-- 1. CREATE DATABASE
-- ============================
CREATE DATABASE IF NOT EXISTS luxhav_db;
USE luxhav_db;

-- ============================
-- 2. TABLES
-- ============================

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status ENUM('Available', 'Reserved', 'Maintenance') DEFAULT 'Available'
);

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status ENUM('Pending', 'Confirmed', 'Cancelled') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE
);

CREATE TABLE feedbacks (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    reservation_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id) ON DELETE CASCADE
);

-- ============================
-- 3. SAMPLE DATA
-- ============================

INSERT INTO users (full_name, email, password, phone, address) VALUES
('John Doe', 'john@example.com', 'hashed_pass_1', '0712345678', 'Colombo'),
('Jane Smith', 'jane@example.com', 'hashed_pass_2', '0723456789', 'Galle');

INSERT INTO admins (full_name, email, password) VALUES
('Admin One', 'admin1@luxhav.com', 'adminpass1'),
('Admin Two', 'admin2@luxhav.com', 'adminpass2');

INSERT INTO rooms (room_number, room_type, price_per_night, status) VALUES
('101', 'Single', 5000.00, 'Available'),
('102', 'Double', 7500.00, 'Available'),
('103', 'Deluxe', 10000.00, 'Maintenance');

INSERT INTO reservations (user_id, room_id, check_in_date, check_out_date, status) VALUES
(1, 1, CURDATE(), CURDATE() + INTERVAL 2 DAY, 'Confirmed'),
(2, 2, CURDATE() + INTERVAL 1 DAY, CURDATE() + INTERVAL 4 DAY, 'Pending');

INSERT INTO feedbacks (user_id, reservation_id, rating, comment) VALUES
(1, 1, 5, 'Excellent room and service.');

-- ============================
-- 4. TRIGGER: Set room to Reserved on check-in day
-- ============================
DELIMITER $$

CREATE TRIGGER trg_set_room_reserved
AFTER UPDATE ON reservations
FOR EACH ROW
BEGIN
    IF NEW.status = 'Confirmed' AND NEW.check_in_date = CURDATE() THEN
        UPDATE rooms
        SET status = 'Reserved'
        WHERE room_id = NEW.room_id;
    END IF;
END$$

DELIMITER ;

-- ============================
-- 5. EVENT: Auto-set rooms to Available after checkout
-- ============================
DELIMITER $$

CREATE EVENT IF NOT EXISTS evt_auto_free_room
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 1 DAY
DO
BEGIN
    UPDATE rooms r
    JOIN reservations res ON r.room_id = res.room_id
    SET r.status = 'Available'
    WHERE res.check_out_date < CURDATE()
      AND res.status = 'Confirmed'
      AND r.status = 'Reserved';
END$$

DELIMITER ;

-- Enable Event Scheduler
SET GLOBAL event_scheduler = ON;

-- ============================
-- 6. VIEWS
-- ============================

-- View: Reservation Details
CREATE OR REPLACE VIEW reservation_details_view AS
SELECT
    res.reservation_id,
    u.full_name AS guest_name,
    r.room_number,
    r.room_type,
    res.check_in_date,
    res.check_out_date,
    res.status,
    res.created_at
FROM reservations res
JOIN users u ON res.user_id = u.user_id
JOIN rooms r ON res.room_id = r.room_id;

-- View: Feedback Details
CREATE OR REPLACE VIEW feedback_details_view AS
SELECT
    f.feedback_id,
    u.full_name AS guest_name,
    r.room_number,
    f.rating,
    f.comment,
    f.created_at
FROM feedbacks f
JOIN users u ON f.user_id = u.user_id
JOIN reservations res ON f.reservation_id = res.reservation_id
JOIN rooms r ON res.room_id = r.room_id;