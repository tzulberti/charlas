# -*- coding: utf-8 -*-

import sys
from difference import levenshtein

OUTPUT = 0


def main():
    levenshtein_time_taken = 0
    with open(sys.argv[1]) as input_file:
        file_content = input_file.readlines()
        file_content = map(lambda line: line.strip(), file_content)
        do_logic(file_content)


def do_logic(file_content):
    for input_line in file_content:
        string1, string2 = input_line.split(',')
        diff = levenshtein(string1, string2)
        if OUTPUT:
            print('%s %s %d' % (string1, string2, diff))


if __name__ == '__main__':
    main()
