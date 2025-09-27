--Active users per month
SELECT DATE_TRUNC('month', s.session_date)::date AS month, COUNT(DISTINCT u.user_id) AS active_users
FROM users u
JOIN sessions s ON u.user_id = s.user_id
GROUP BY DATE_TRUNC('month', s.session_date)
ORDER BY month;

--Which marketing channels and campaigns bring the highest ROI?
WITH total AS (
	SELECT  ca.campaign_name,
			ca.channel,
			SUM(co.revenue) AS total_revenue,
			SUM(ca.budget) AS total_budget
	FROM campaigns ca
	JOIN conversions co ON ca.campaign_id = co.campaign_id
	GROUP BY ca.campaign_name, ca.channel
	ORDER BY ca.campaign_name
)

SELECT  *,
		ROUND((total_revenue - total_budget) / total_budget, 2) AS ROI
FROM total
ORDER BY ROI;


--What are the key demographics (age group, gender, country) that drive conversions?
SELECT  u.age_group,
		u.gender,
		c.conversion_type,
		COUNT(u.user_id) AS total_conversions,
		COUNT(DISTINCT u.user_id) AS unique_users,
		ROUND(COUNT(u.user_id)::DECIMAL / COUNT(DISTINCT u.user_id) , 2) AS avg_conversions
FROM conversions c
JOIN users u ON c.user_id = u.user_id
GROUP BY u.age_group, u.gender, c.conversion_type

--How do user engagement metrics (page views, session duration) impact conversion likelihood?
SELECT  DATE_TRUNC('month', session_date)::date AS month,
		SUM(page_views) AS total_pages_view,
		ROUND(SUM(session_duration)::decimal/60, 2) AS total_session_duration
FROM sessions
GROUP BY DATE_TRUNC('month', session_date);

--Which campaigns are most effective at retaining users over time?
WITH total_users AS (
	SELECT COUNT(user_id) AS cohort, DATE_TRUNC('month', signup_date)::date AS month
	FROM users
	GROUP BY month
),

unique_users AS (
	SELECT COUNT(DISTINCT s.user_id) AS unique_user,DATE_TRUNC('month', signup_date)::date AS month
	FROM sessions s
	JOIN users u ON s.user_id = u.user_id
	GROUP BY month
)

SELECT  t.month,
		t.cohort,
		u.unique_user,
		ROUND(u.unique_user::DECIMAL / t.cohort * 100, 2) AS retention_rate
FROM total_users t
JOIN unique_users u ON t.month = u.month;

--What is the revenue distribution across different campaign types and channels?
SELECT  c.campaign_name,
		c.channel,
		s.revenue
FROM conversions s
JOIN campaigns c ON s.campaign_id = c.campaign_id
ORDER BY c.channel, s.revenue

--Unique users & total conversions per campaign
SELECT  COUNT(DISTINCT co.user_id) AS unique_users,
		COUNT(co.conversion_id) AS total_conversions,
		ca.campaign_name,
		ROUND(COUNT(co.conversion_id)::decimal / COUNT(DISTINCT co.user_id), 2) AS avg_convertions_per_user
FROM conversions co
JOIN campaigns ca ON co.campaign_id = ca.campaign_id
GROUP BY ca.campaign_name

--Time-Series Campaign Performance
WITH table_1 AS (
	SELECT  COUNT(DISTINCT co.user_id) AS unique_conversions,
			ca.campaign_name,
			SUM(co.revenue) AS total_revenue,
			DATE_TRUNC('month', co.conversion_date)::date AS month
	FROM conversions co
	JOIN campaigns ca ON co.campaign_id = ca.campaign_id
	GROUP BY DATE_TRUNC('month', conversion_date), ca.campaign_name
),

table_2 As (
	SELECT  COUNT(co.user_id) AS total_conversions,
			ca.campaign_name,
			DATE_TRUNC('month', co.conversion_date)::date AS month
	FROM conversions co
	JOIN campaigns ca ON co.campaign_id = ca.campaign_id
	GROUP BY DATE_TRUNC('month', conversion_date), ca.campaign_name
)

SELECT  t1.campaign_name,
		t1.month,
		t1.unique_conversions,
		t2.total_conversions,
		t1.total_revenue,
		ROUND(t2.total_conversions::decimal/t1.unique_conversions, 2) AS avg_conversions_user
FROM table_1 t1
JOIN table_2 t2 ON t1.campaign_name = t2.campaign_name
				AND t1.month = t2.month
ORDER BY campaign_name;