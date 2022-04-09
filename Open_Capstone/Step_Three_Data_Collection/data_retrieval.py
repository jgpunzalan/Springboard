from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta
import pandas as pd

# CONSTANTS
CDC_COUNTRY_DATA_API = "https://data.cdc.gov/resource/n8mc-b4w4.json"
NY_DATA_API = "https://health.data.ny.gov/resource/xdss-u53e.json"
DAYS_OFFSET = 4
DAYS_TO_PULL = 3

# Get NY State's daily testing reports
# Start pull a couple days back to account for data being collected and coalated
# Pull additional days to determine if any data needs updating
for i in range(DAYS_OFFSET, DAYS_OFFSET+DAYS_TO_PULL):
    pull_date = (datetime.today() - timedelta(days=i)).strftime('%Y-%m-%d')
    ny_data_call = f"{NY_DATA_API}?test_date={pull_date}"
    target_file = f"new_york_state_testing_{pull_date}.csv"
    nys_test_data = pd.read_json(ny_data_call)
    nys_test_data.to_csv(f"data/{target_file}")

# Get CDC's monthly report from last month
report_month = (datetime.today() - relativedelta(months=1)).strftime('%Y-%m')
cdc_data_call = f"{CDC_COUNTRY_DATA_API}?case_month={report_month}"
cdc_report_name = f"CDC_Monthly_Report_{report_month}"
cdc_report_data = pd.read_json(cdc_data_call)
cdc_report_data.to_csv(f"data/{cdc_report_name}")
    