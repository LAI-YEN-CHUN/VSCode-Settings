import sys
import numpy as np
import os
def add_arrays(arr1, arr2):
    return np.add(arr1, arr2)
def multiply_arrays(arr1, arr2):
    return np.multiply(arr1, arr2)





if __name__ == "__main__":
    a = np.array([1, 2,     3]) #Test comment with trailing spaces
    b =   np.array([4, 5,6]) #  Another comment
    print("Addition:", add_arrays(a, b))
    print("Multiplication:", multiply_arrays(a, b))



