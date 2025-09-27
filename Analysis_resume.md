In this section I´m going to talk about some results in the different queries that i did in the [Query Analysis](sql/Analysis.sql) file, what was the purpose, steps to do it and business insight for this analysis

Sample img: [Profit Hotspot](images/query_profit_hotspot.png)

1. Active Users per Month

📝 Query Goal
Measure the number of unique users active per month to track engagement trends.

⚙️ Steps / Logic

DATE_TRUNC('month', session_date) groups sessions by month.

COUNT(DISTINCT user_id) counts unique users per month.

ORDER BY month shows chronological results.

📊 Business Insights

Shows growth or decline in monthly active users.

Highlights seasonality (spikes/drops in engagement).

Useful for measuring product adoption over time.

💡 Power BI: Best shown as a line chart with month on the X-axis and active users on the Y-axis.

2. ROI by Campaign & Channel

📝 Query Goal
Identify which campaigns and marketing channels deliver the highest ROI.

⚙️ Steps / Logic

Aggregate SUM(revenue) from conversions.

Aggregate SUM(budget) from campaigns.

Compute ROI = (revenue - budget) / budget.

Rank campaigns by ROI.

📊 Business Insights

Highlights profitable vs underperforming campaigns.

Guides budget reallocation to maximize ROI.

Detects overspending in low-return channels.

💡 Power BI: Great as a bar chart showing ROI per campaign, grouped by channel.

3. Conversions by Demographics

📝 Query Goal
Understand how age group, gender, and conversion type affect conversion patterns.

⚙️ Steps / Logic

Join users with conversions.

Group by age_group, gender, and conversion_type.

Count total conversions, unique users, and average conversions per user.

📊 Business Insights

Identifies high-converting demographics.

Helps tailor campaigns to specific groups.

Supports segmentation and personalization strategies.

💡 Power BI: Effective as a stacked bar chart by age group, broken down by gender & conversion type.

4. User Engagement Impact

📝 Query Goal
Analyze how engagement metrics (page views, session duration) trend over time.

⚙️ Steps / Logic

Aggregate SUM(page_views) and SUM(session_duration).

Convert session duration into minutes.

Group by month using DATE_TRUNC.

📊 Business Insights

Reveals engagement growth (more page views, longer sessions).

Identifies drops in engagement that may correlate with churn.

Can be linked with conversion rates for deeper insights.

💡 Power BI: Line chart with dual axes (page views vs session duration) to visualize correlation.

5. Campaign Effectiveness for Retention

📝 Query Goal
Measure how well campaigns retain users over time.

⚙️ Steps / Logic

total_users: number of new signups per month (cohort size).

unique_users: number of distinct users active in sessions after signup.

retention_rate = active users / cohort size.

📊 Business Insights

Shows whether campaigns are driving sustainable retention.

Detects drop-off rates post-signup.

Enables cohort analysis across months.

💡 Power BI: Best as a cohort retention heatmap or line chart (retention rate over time).

6. Revenue by Campaign Type & Channel

📝 Query Goal
Break down revenue across different campaign types and channels.

⚙️ Steps / Logic

Join conversions with campaigns.

Select campaign_name, channel, and revenue.

Order by channel and revenue.

📊 Business Insights

Identifies top-performing channels by revenue.

Supports channel mix optimization.

Detects revenue concentration (dependence on one channel).

💡 Power BI: Bar chart by channel with revenue stacked by campaign type.

7. Conversions per Campaign

📝 Query Goal
Evaluate how many unique users and total conversions each campaign generates.

⚙️ Steps / Logic

Count distinct users (unique_users).

Count all conversions (total_conversions).

Compute avg_conversions_per_user.

Group by campaign.

📊 Business Insights

Highlights campaigns that drive both reach (unique users) and depth (multiple conversions).

Detects campaigns with repeat engagement.

Helps measure efficiency of campaigns beyond just ROI.

💡 Power BI: Combo chart (bars for total conversions, line for avg conversions per user).

8. Time-Series Campaign Performance

📝 Query Goal
Track campaign performance over time (unique conversions, revenue, and conversion efficiency).

⚙️ Steps / Logic

table_1: Unique users & revenue per campaign per month.

table_2: Total conversions per campaign per month.

Join both to calculate avg_conversions_user.

📊 Business Insights

Reveals campaign lifecycle performance (launch spikes, decline phases).

Identifies long-term vs short-lived campaigns.

Shows efficiency per user alongside revenue trends.

💡 Power BI: Line chart with multiple measures (revenue, conversions, avg conversions/user) by campaign over time.
