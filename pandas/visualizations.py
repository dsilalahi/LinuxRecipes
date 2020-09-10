import pandas as pd
import datetime
from pandas_datareader import data

import matplotlib.pyplot as plt
from matplotlib import style

style.use('fivethirtyeight')

start = datetime.datetime(2015, 1, 1)
end = datetime.datetime(2020, 9, 1)

att = data.DataReader("T", "yahoo", start, end)

print(att)
att['Adj Close'].plot()
plt.legend()
plt.show()


att['High'].plot()
att['Low'].plot()
plt.legend()
plt.show()