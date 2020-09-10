import numpy as np

# create an array
np_array = np.array([5, 10, 15, 20, 25, 30])

# Gets the unique values
print(np.unique(np_array))

# calculate std deviation
print(np.std(np_array))

# calculates the maximum
print(np_array.max())

# squares each value in the array
print(np_array ** 2)

# Adds the arrays together element wise
print(np_array + np_array)

# The sum of the squares of the elements
print(np.sum(np_array ** 2))

# Gives you the shape: (rows, columns)
print(np_array.shape)