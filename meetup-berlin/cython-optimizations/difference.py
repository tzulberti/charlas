# -*- coding: utf-8 -*-
# cython:infer_types=True

import sys
import numpy
import cython

OUTPUT = 0


def main():
    with open(sys.argv[1]) as input_file:
        file_content = input_file.readlines()
        file_content = map(lambda line: line.strip(), file_content)
        do_logic(file_content)


def do_logic(file_content):
    for input_line in file_content:
        string1, string2 = input_line.split(",")
        diff = levenshtein(string1, string2)
        if OUTPUT:
            print("%s %s %d" % (string1, string2, diff))


@cython.locals(cseq1="const char *", cseq2="const char *", pmatrix="int[:,:]")
def levenshtein(seq1, seq2):
    size_x = len(seq1) + 1
    size_y = len(seq2) + 1
    pmatrix = matrix = numpy.zeros((size_x, size_y), numpy.int32)

    for x in range(size_x):
        pmatrix[x][0] = x
    for y in range(size_y):
        pmatrix[0][y] = y

    cseq1 = seq1
    cseq2 = seq2

    for x in range(1, size_x):
        for y in range(1, size_y):
            if cseq1[x - 1] == cseq2[y - 1]:
                substitution_cost = 0
            else:
                substitution_cost = 1

            pmatrix[x][y] = min(
                pmatrix[x - 1][y] + 1,  # deletion
                pmatrix[x][y - 1] + 1,  # insertion
                pmatrix[x - 1][y - 1] + substitution_cost,  # substitution
            )

    return pmatrix[size_x - 1][size_y - 1]
