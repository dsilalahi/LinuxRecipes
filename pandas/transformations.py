# group by operations
df.groupby(‘col_name’)[‘label'].value_counts(normalize=True)
df.groupby(['workclass'])['hoursperweek'].mean()


# where clause
filter = df["State"]=="US"
df.where(filter, inplace = True)