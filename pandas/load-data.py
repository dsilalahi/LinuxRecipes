import pandas as pd

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
