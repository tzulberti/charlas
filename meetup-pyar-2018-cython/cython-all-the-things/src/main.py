# -*- coding: utf-8 -*-

import argparse
import time

from difference import levenshtein 

def main():
    program_start = time.time()
    levenshtein_time_taken = 0
    args = parse_arguments()

    if args.output:
        output_file = open(args.output, 'w')
    else:
        output_file = None
        
    with open(args.input) as input_file, open(args.benchmark, 'w') as benchmark_file:
        for input_line in input_file:
            string1, string2 = input_line.strip().split(',')
            current_start = time.time()
            diff = levenshtein(string1, string2)
            current_end = time.time()
            levenshtein_time_taken += current_end - current_start
            if output_file:
                output_file.write('%s\n' % diff)
 
        program_end = time.time()
        benchmark_file.write('%s,%s\n' % (program_end - program_start, levenshtein_time_taken))

    if output_file:
        output_file.close()


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--input',
        required=True,
        help='The input file wich has the works separated using ","'    
    )
    parser.add_argument(
        '--output',
        help='Where to save the output file'
    )
    parser.add_argument(
        '--benchmark',
        required=True,
        help='The benchmark file to which append the information on the time taken'
    )
    args = parser.parse_args()
    return args


if __name__ == '__main__':
    print __file__
    main()
