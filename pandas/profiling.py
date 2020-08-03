# get first 5 rows
df.head()

# get statistics on data
df.describe()
df.describe(percentiles=[.01,.05,.95,.99])

# get data types
df.info()

# get unique values and counts
df[‘col_name’].unique()
df[‘col_name’].value_counts()