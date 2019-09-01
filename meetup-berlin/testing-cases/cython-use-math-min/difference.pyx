# -*- coding: utf-8 -*-

from libc.math cimport fmin as fmin

cpdef int levenshtein(str seq1, str seq2):  
    cdef int size_x = len(seq1) + 1
    cdef int size_y = len(seq2) + 1
    cdef list matrix = [[0] * size_y for _ in range(size_x)]

    for x in range(size_x):
        matrix[x][0] = x
    for y in range(size_y):
        matrix[0][y] = y

    for x in range(1, size_x):
        for y in range(1, size_y):
            if seq1[x-1] == seq2[y-1]:
                substitution_cost = 0
            else:
                substitution_cost = 1

            matrix[x][y] = fmin(
                matrix[x-1][y] + 1,  # deletion
                fmin(
                    matrix[x][y-1] + 1,  # insertion
                    matrix[x-1][y-1] + substitution_cost, #substitution
            ))

    return matrix[size_x - 1][size_y - 1]
