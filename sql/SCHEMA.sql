TRUNCATE TABLE users, campaigns, conversions, sessions RESTART IDENTITY CASCADE;

CREATE TABLE users (
user_id INT PRIMARY KEY,
signup_date DATE,
country TEXT,
age_group TEXT,
gender TEXT
);

CREATE TABLE sessions (
session_id INT PRIMARY KEY,
user_id INT REFERENCES users(user_id),
session_date DATE,
source TEXT,
device TEXT,
page_views INT,
session_duration INT
);

CREATE TABLE campaigns (
campaign_id INT PRIMARY KEY,
campaign_name TEXT,
channel TEXT,
start_date DATE,
budget NUMERIC,
end_date DATE
);

CREATE TABLE conversions (
conversion_id INT PRIMARY KEY,
user_id INT REFERENCES users(user_id),
campaign_id INT REFERENCES campaigns(campaign_id),
conversion_date DATE,
revenue NUMERIC,
conversion_type TEXT
);

UPDATE users
SET signup_date = CURRENT_DATE - (FLOOR(RANDOM() * 365)::INT);

UPDATE sessions s
SET session_date = u.signup_date + FLOOR(RANDOM() * 365)::INT
FROM users u
WHERE s.user_id = u.user_id;
