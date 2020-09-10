import pandas as pd

# 293739 -> 293,739.00
pd.options.display.float_format = '{:,.2f}'.format


cols = [‘first’, ‘last’, ‘mi’, ‘dob’]

# load csv file
df = pd.read_csv(file_url, header=None, names=cols)
df = pd.read_csv(file_url, index_col=‘col_name’)

# convert a field to a date during load
d_parser = lambda x: pd.datetime.strptime(x, ‘%Y-%m-%d %I-%p’)
df = pd.read_csv(‘filename.csv’, parse_dates=[‘Date’], date_parser=d_parser)

# load json
with open('data.json') as f:
    df = json.load(f)


# load raw files
with open(tmp.name, "r") as f:
    for line in f:
      	print(line)
	row_values = line.split("|")  # Split each line by the | character into a list
      	array.append(row_values[0])


# get a list of columns
list(df)

df.head(10) 
df['col_name'].sum(skipna = True) # sum a column, skip NaN
df.groupby(['Age_Group']).sum() # group by

print(df.dtypes)


# Index
df.index
df.set_index('col_name')