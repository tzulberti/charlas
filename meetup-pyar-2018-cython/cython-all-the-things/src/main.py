# -*- coding: utf-8 -*-

import argparse
import time

from difference import call_for_inputs


def main():
    program_start = time.time()
    args = parse_arguments()

    if args.output:
        output_file = open(args.output, 'w')
    else:
        output_file = None
        
    with open(args.input) as input_file, open(args.benchmark, 'w') as benchmark_file:
        levenshtein_time_taken = call_for_inputs(
            input_file.readlines(),
            output_file
        )
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
    main()
