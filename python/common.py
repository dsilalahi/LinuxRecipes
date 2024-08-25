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


# readability
num1 = 10_000_000_000
num2 = 100_000_000
total = num1 + num2
print(f'{total:,}')

# find occurence of all elements in a list
from collections import Counter
my_list = [1,2,3,1,4,1,5,5]
print(Counter(my_list))  

# apply function for all element in list
my_list = ["felix", "antony"]
new_list = map(str.capitalize,my_list) 