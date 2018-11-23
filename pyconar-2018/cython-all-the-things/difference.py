# -*- coding: utf-8 -*-

import cython
import sys

cython.declare(
    OUTPUT=cython.int
)

OUTPUT = 0

@cython.locals(
    line=str,
    file_content=list,
)
def main():
    levenshtein_time_taken = 0
    with open(sys.argv[1]) as input_file:
        file_content = input_file.readlines()
        file_content = [line.strip() for line in file_content]
        do_logic(file_content)


@cython.locals(
    input_line=str,
    string1=str,
    string2=str,
    file_content=list,
)
@cython.cfunc
def do_logic(file_content):
    for input_line in file_content:
        string1, string2 = input_line.split(',')
        diff = levenshtein(string1, string2)
        if OUTPUT:
            print('%s %s %d' % (string1, string2, diff))


@cython.locals(
    seq1=str,
    seq2=str,
    matrix=list,
    size_x=cython.int,
    size_y=cython.int,
    x=int,
    y=int,
    substitution_cost=int,
)
@cython.cfunc
def levenshtein(seq1, seq2):  
    size_x = len(seq1) + 1
    size_y = len(seq2) + 1
    matrix = [[0] * size_y for _ in range(size_x)]

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

            matrix[x][y] = min(
                matrix[x-1][y] + 1,  # deletion
                matrix[x][y-1] + 1,  # insertion
                matrix[x-1][y-1] + substitution_cost, #substitution
            )

    return matrix[size_x - 1][size_y - 1]
