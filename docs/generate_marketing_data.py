import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()

# ----------------- USERS -----------------
num_users = 2000
countries = ['US', 'UK', 'CA', 'AU', 'DE', 'Other']
age_groups = ['18-24', '25-34', '35-44', '45-54', '55+']
genders = ['Male', 'Female']

users = pd.DataFrame({
    'user_id': range(1, num_users+1),
    'signup_date': [fake.date_between(start_date='-12m', end_date='today') for _ in range(num_users)],
    'country': np.random.choice(countries, size=num_users, p=[0.4,0.2,0.15,0.1,0.1,0.05]),
    'age_group': np.random.choice(age_groups, size=num_users, p=[0.15,0.35,0.25,0.15,0.1]),
    'gender': np.random.choice(genders, size=num_users)
})

users.to_csv('users.csv', index=False)

# ----------------- CAMPAIGNS -----------------
num_campaigns = 15
channels = ['Email', 'Social', 'Paid Search']

campaigns = pd.DataFrame({
    'campaign_id': range(1, num_campaigns+1),
    'campaign_name': [f'{fake.word().capitalize()} Campaign' for _ in range(num_campaigns)],
    'channel': np.random.choice(channels, size=num_campaigns),
    'start_date': [fake.date_between(start_date='-12m', end_date='-1m') for _ in range(num_campaigns)],
    'budget': np.random.randint(500, 50001, size=num_campaigns)
})

# End date = start date + 10-30 days
campaigns['end_date'] = campaigns['start_date'] + pd.to_timedelta(np.random.randint(10,31,size=num_campaigns), unit='d')

campaigns.to_csv('campaigns.csv', index=False)

# ----------------- SESSIONS -----------------
num_sessions = 15000
sources = ['Organic', 'Paid', 'Social', 'Referral']
devices = ['Desktop', 'Mobile', 'Tablet']

sessions = pd.DataFrame({
    'session_id': range(1, num_sessions+1),
    'user_id': np.random.choice(users['user_id'], size=num_sessions),
    'session_date': [fake.date_between(start_date='-12m', end_date='today') for _ in range(num_sessions)],
    'source': np.random.choice(sources, size=num_sessions, p=[0.4,0.3,0.2,0.1]),
    'device': np.random.choice(devices, size=num_sessions, p=[0.5,0.4,0.1]),
    'page_views': np.random.randint(1,16,size=num_sessions),
    'session_duration': np.random.randint(30,901,size=num_sessions)
})

sessions.to_csv('sessions.csv', index=False)

# ----------------- CONVERSIONS -----------------
num_conversions = 4000
conversion_types = ['Purchase', 'Signup', 'Download']

# Ensure conversion_date is after signup and during campaign
conversion_user_ids = np.random.choice(users['user_id'], size=num_conversions)
conversion_campaign_ids = np.random.choice(campaigns['campaign_id'], size=num_conversions)

conversion_dates = []
for u_id, c_id in zip(conversion_user_ids, conversion_campaign_ids):
    signup = users.loc[users['user_id']==u_id, 'signup_date'].values[0]
    start = campaigns.loc[campaigns['campaign_id']==c_id, 'start_date'].values[0]
    end = campaigns.loc[campaigns['campaign_id']==c_id, 'end_date'].values[0]
    start_date = max(signup, start)
    conversion_dates.append(fake.date_between(start_date=start_date, end_date=end))

conversions = pd.DataFrame({
    'conversion_id': range(1, num_conversions+1),
    'user_id': conversion_user_ids,
    'campaign_id': conversion_campaign_ids,
    'conversion_date': conversion_dates,
    'revenue': np.round(np.random.uniform(10,500,size=num_conversions),2),
    'conversion_type': np.random.choice(conversion_types, size=num_conversions, p=[0.7,0.2,0.1])
})

conversions.to_csv('conversions.csv', index=False)

print("CSV files generated: users.csv, campaigns.csv, sessions.csv, conversions.csv")
