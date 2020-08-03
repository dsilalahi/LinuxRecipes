# converting data type
df['numeric_column'] = pd.to_numeric(df['field_name'])
df['numeric_column'] = pd.to_datetime(df['field_name'])
df['numeric_column'] = pd.to_string(df['field_name'])
