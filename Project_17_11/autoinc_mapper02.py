#!/usr/bin/python
import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    # [derive mapper output key values]
    row_data = line.split('\t')
    make = row_data[1]
    year = row_data[2].rstrip()
    composite_key = make + '_' + year

    # print '%s\t%s' % (key, value)
    print('%s\t%s' % (composite_key, 1))

