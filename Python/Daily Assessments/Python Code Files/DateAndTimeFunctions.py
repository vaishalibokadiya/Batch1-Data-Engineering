from datetime import datetime, timedelta

current_datetime = datetime.now()
print(current_datetime) 

formatted_date = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
print(formatted_date)  

future_date = current_datetime + timedelta(days=7)
print(future_date)  

year = current_datetime.year
month = current_datetime.month
day = current_datetime.day
print(year, month, day)  
