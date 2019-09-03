# -*- coding: utf-8 -*-

import sys
from Levenshtein import distance


def main():
    with open(sys.argv[1]) as input_file:
        file_content = input_file.readlines()
        file_content = map(lambda line: line.strip(), file_content)
        do_logic(file_content)


def do_logic(file_content):
    for input_line in file_content:
        string1, string2 = input_line.split(",")
        distance(string1, string2)


if __name__ == "__main__":
    main()
