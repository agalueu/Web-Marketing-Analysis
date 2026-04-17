# Web Marketing Analysis

### Overview
This project analyzes digital marketing performance by integrating user behavior, campaign data, and conversion outcomes into a unified analytical model.

The objective is to evaluate campaign effectiveness, user engagement patterns, and return on investment (ROI) using SQL-based analysis and dashboard visualization.

### Analytical Objectives
- Measure ROI by campaign and channel
- Identify high-value customer segments
-Analyze user engagement impact on conversions
-Evaluate retention through cohort analysis
-Compare traffic sources in terms of quality vs volume

### Dataset
The dataset was synthetically generated using Python to simulate a real-world marketing environment with:
- Multi-channel campaigns
- User behavioral tracking (sessions)
- Conversion attribution
- Revenue generation

Only a sample dataset is included. The full dataset can be regenerated using the provided script.

### Analytical Approach
The analysis follows a structured workflow:
1. Data Modeling
   - Designed a relational schema to represent users, sessions, campaigns, and conversions
   - Defined primary/foreign key relationships to ensure data integrity

2.Data Preparation
   - Validated joins between behavioral and transactional data
   - Ensured consistency in campaign attribution

3. Exploratory Analysis
   - Aggregated user activity metrics (sessions, page views, duration)
   - Compared engagement across channels and devices

4.Advanced Analysis
   - ROI calculation: revenue vs campaign cost
   - Conversion rate segmentation by demographic groups
   - Cohort analysis for retention tracking
   - Traffic source quality analysis (conversion efficiency vs volume)

5.Visualization
   - Built interactive dashboards in Power BI to present KPIs and trends

### Tools & Technologies
- PostgreSQL (data modeling, analysis)
- Python (data generation)
- Power BI (data visualization)
- dbdiagram.io (ERD design)

### Database Schema
The database is structured to capture the full marketing funnel:
- users → demographic attributes
- sessions → behavioral activity
- campaigns → marketing investments
- conversions → revenue-generating events

### Key Relationships
One-to-many: users → sessions
Many-to-one: sessions → campaigns
One-to-many: users → conversions

This enables full funnel analysis from acquisition to revenue.

### Key Analyses Performed
- Campaign ROI calculation using aggregated revenue and budget
- Conversion rate analysis by:
   - channel
   - demographic segment
- Engagement impact:
   - correlation between session activity and conversion likelihood
- Cohort retention analysis:
   - user return behavior over time
- Traffic evaluation:
   - high-volume vs high-conversion channels

### Dashboard Highlights
- Campaign performance (ROI, revenue, cost)
- User engagement metrics (sessions, duration, page views)
- Demographic segmentation
- Retention cohort analysis
- Traffic source comparison

### Key Insights
- High-traffic channels do not necessarily yield the highest ROI, indicating inefficiencies in paid acquisition strategies.
- Organic and referral channels show stronger conversion efficiency and long-term value.
- Higher session engagement (page views and duration) correlates with increased conversion probability.
- Retargeting campaigns significantly improve user retention and repeat conversions.

### How to Reproduce
1. Create a PostgreSQL database
2. Run schema script: sql/SCHEMA.sql
3. Execute analysis queries: sql/Analysis.sql
4. (Optional) Connect to Power BI for visualization
