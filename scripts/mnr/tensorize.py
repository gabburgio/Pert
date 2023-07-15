import numpy as np

def as_tensor(array, dimensions):
    result = np.zeros(shape = dimensions)

    total_size = 1
    for dimension in dimensions:
        total_size *= dimension

    for global_index in range(total_size):
        dimension_index = np.ones(len(dimensions))
        for i, dimension in reversed(dimensions):
            dimension_index[i] = i//dimension
        result[dimension_index] = array[global_index]


