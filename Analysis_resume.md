In this section, I summarize the purpose, logic, and business insights of the SQL queries used in this project. Full queries are available in [Query Analysis](sql/Analysis.sql).

---

# 1. Active Users per Month

### 📝 Query Goal
Measure the number of unique users active per month to track engagement trends.

### ⚙️ Steps / Logic
- Group sessions by month using `DATE_TRUNC`
- Count distinct users per month
- Sort results chronologically

### 📊 Business Insights
- Identifies growth or decline in user activity  
- Highlights seasonality patterns  
- Useful for tracking product adoption over time  

---

# 2. ROI by Campaign & Channel

### 📝 Query Goal
Identify which campaigns and marketing channels deliver the highest ROI.

### ⚙️ Steps / Logic
- Aggregate total revenue from conversions  
- Compare against campaign budget  
- Compute ROI = (revenue - budget) / budget  

### 📊 Business Insights
- Highlights profitable vs underperforming campaigns  
- Supports budget reallocation decisions  
- Detects inefficiencies in paid marketing  

---

# 3. Conversions by Demographics

### 📝 Query Goal
Analyze how demographic factors influence conversion behavior.

### ⚙️ Steps / Logic
- Join users with conversions  
- Group by age group, gender, and conversion type  
- Compute total and average conversions per user  

### 📊 Business Insights
- Identifies high-converting user segments  
- Enables targeted marketing strategies  
- Supports personalization efforts  

---

# 4. User Engagement vs Conversion Likelihood

### 📝 Query Goal
Evaluate whether higher user engagement leads to increased probability of conversion.

### ⚙️ Steps / Logic
- Compute per-user engagement metrics:
  - average page views per session  
  - average session duration  
- Segment users into engagement tiers using `NTILE(3)`  
- Calculate conversion rate per engagement level  

### 📊 Business Insights
- Higher engagement levels are associated with higher conversion rates  
- Engagement metrics act as leading indicators of conversion behavior  
- Helps identify high-value users based on activity patterns  

---

# 5. Cohort Retention Analysis

### 📝 Query Goal
Measure user retention over time based on signup cohorts.

### ⚙️ Steps / Logic
- Define cohorts by signup month  
- Track user activity using session data  
- Calculate months since signup  
- Compute:
  - active users per cohort per period  
  - cohort size  
  - retention rate = active users / cohort size  

### 📊 Business Insights
- Retention decreases over time, indicating user drop-off  
- Early retention (Month 1) is critical for long-term engagement  
- Cohort analysis reveals differences in user behavior across acquisition periods  

---

# 6. Revenue by Campaign Type & Channel

### 📝 Query Goal
Analyze revenue distribution across campaigns and channels.

### ⚙️ Steps / Logic
- Join conversions with campaign data  
- Aggregate revenue by campaign and channel  

### 📊 Business Insights
- Identifies top-performing revenue channels  
- Supports optimization of channel mix  
- Detects revenue concentration risks  

---

# 7. Conversions per Campaign

### 📝 Query Goal
Evaluate campaign performance in terms of user reach and conversion volume.

### ⚙️ Steps / Logic
- Count distinct users and total conversions per campaign  
- Compute average conversions per user  

### 📊 Business Insights
- Highlights campaigns with strong engagement and repeat conversions  
- Measures campaign effectiveness beyond ROI  
- Identifies high-performing campaigns  

---

# 8. Time-Series Campaign Performance

### 📝 Query Goal
Track campaign performance trends over time.

### ⚙️ Steps / Logic
- Aggregate conversions and revenue by month and campaign  
- Calculate average conversions per user  

### 📊 Business Insights
- Reveals campaign lifecycle trends (growth and decline)  
- Identifies long-term vs short-term campaign performance  
- Helps evaluate sustainability of marketing strategies  
