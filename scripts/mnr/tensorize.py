import numpy as np

def array_index(tensor_indexes, multipliers):
    array_index = 0
    for i, index in enumerate(tensor_indexes):
        array_index += index*multipliers[i]
    return array_index



def multipliers(tensor_dimensions):
    multipliers = [1]
    for i in range(1,len(tensor_dimensions)):
        multipliers.append(multipliers[i-1]*tensor_dimensions[i-1])
    return multipliers


def filler(tensor_dimension, previous_index, previous_point, tensor_index_array):
    
    tot_entries = 1
    seen_entries = 1

    print("tensor array before = " + str(tensor_index_array))

    for dimension in tensor_dimension:
        tot_entries *= dimension
    
    for index in previous_index:
        seen_entries *= index

    if(tot_entries == seen_entries):
        print("end reached")
        return tensor_index_array
    
    if (previous_index[previous_point] < tensor_dimension[previous_point]):
        previous_index[previous_point]+= 1
        print("adding index:" + str(previous_index))
        tensor_index_array.append(previous_index)
        print("new tensor array = " + str(tensor_index_array)) 
        filler(tensor_dimension, previous_index, previous_point, tensor_index_array)

    if (previous_index[previous_point] == tensor_dimension[previous_point]):
        previous_point +=1
        print("pass")
        filler(tensor_dimension, previous_index, previous_point, tensor_index_array)

    
#def as_tensor(array, tensor_dimensions):

dims = [2,4,3,6]

str(filler(dims, [0,0,0,0], 0, [[0,0,0,0]] ))

