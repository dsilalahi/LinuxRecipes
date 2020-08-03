# get day name from a field
df[‘Date’].dt.day_name()

# date operations
df[‘Date’].min()
df[‘Date’].max()
df[‘Date’].max() - df[‘Date’].min() 

# date filter
filt = (df[‘Date’] >= ‘2019’) & (df[‘Date’] < ‘2020’)
df.loc(filt)

# get average price for a specific month
df[‘2020-01’ : ‘2020-02’]
df[‘2020-01’ : ‘2020-02’].[‘Price’].mean()