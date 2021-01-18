# ternary op
x = 1 if condition else 0


# convert epoch to formatted string
time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(1347517370))

# or
import datetime
datetime.datetime.fromtimestamp(1347517370).strftime('%c')


# date to epoch
(datetime.datetime(2020,04,01,0,0) - datetime.datetime(1970,1,1)).total_seconds()

# python 3.3
datetime.datetime(2020,4,1,0,0).timestamp()
