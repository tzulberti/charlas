# -*- coding: utf-8 -*-
# cython: profile=True

import sys
import numpy as np

cimport numpy as np

cdef int OUTPUT = 0
DTYPE = np.int
ctypedef np.int_t DTYPE_t

def main():
    levenshtein_time_taken = 0
    with open(sys.argv[1]) as input_file:
        file_content = input_file.readlines()
        file_content = [line.strip() for line in file_content]
        do_logic(file_content)


cdef do_logic(file_content):
    cdef str string1 = ''
    cdef str string2 = ''
    cdef str input_line = ''

    for input_line in file_content:
        string1, string2 = input_line.split(',')
        diff = levenshtein(string1, string2)
        if OUTPUT:
            print('%s %s %d' % (string1, string2, diff))



cdef levenshtein(str seq1, str seq2):  
    cdef int size_x = len(seq1) + 1
    cdef int size_y = len(seq2) + 1
    cdef np.ndarray[DTYPE_t, ndim=2] matrix = np.zeros((size_x, size_y), dtype=DTYPE)
    cdef DTYPE_t x = 0
    cdef DTYPE_t y = 0

    for x in range(size_x):
        matrix[x, 0] = x
    for y in range(size_y):
        matrix[0, y] = y

    for x in range(1, size_x):
        for y in range(1, size_y):
            if seq1[x-1] == seq2[y-1]:
                substitution_cost = 0
            else:
                substitution_cost = 1

            matrix[x, y] = min(
                matrix[x-1, y] + 1,  # deletion
                matrix[x, y-1] + 1,  # insertion
                matrix[x-1, y-1] + substitution_cost, #substitution
            )

    return matrix[size_x - 1, size_y - 1]
