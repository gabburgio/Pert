import numpy as np

def array_index(tensor_indexes, tensor_dimensions):
    multipliers = [1]
    for i in range(1,len(tensor_dimensions)):
        multipliers.append(multipliers[i-1]*tensor_dimensions[i-1])
    print(multipliers)

    array_index = 0
    for i, index in enumerate(tensor_indexes):
        array_index += index*multipliers[i]
    return array_index


def filler(tensor_dimension, previous_index, previous_point, tensor_index_array):
    
    if (previous_index[previous_point] < tensor_dimension[previous_point]):
        previous_index[previous_point]+= 1
        tensor_index_array.append(previous_index[:])
        if(tensor_dimension == previous_index):
            return tensor_index_array
        return filler(tensor_dimension, previous_index, previous_point, tensor_index_array)

    if (previous_index[previous_point] == tensor_dimension[previous_point]):
        previous_point +=1
        return filler(tensor_dimension, previous_index, previous_point, tensor_index_array)


def as_tensor(array, tensor_dimension):
    zero_index = [0]*len(tensor_dimension)
    starting_list = [zero_index[:]]
    indexes = filler(tensor_dimension, zero_index, 0, starting_list )
    print(indexes)
    tensor = np.zeros(tensor_dimension)
    for index in indexes:
        tensor[index] = array[array_index(index, tensor_dimension)]
    return tensor


array = [1,2,3,4,5,6,7,8]
dims = [2,4, 3,6]

print(as_tensor(array, dims))