#!/usr/bin/python
import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    # [derive mapper output key values]
    row_data = line.split(',')
    vin_num = row_data[2]
    inc_type = row_data[1]
    make = row_data[3]
    year = row_data[5]
    value = (inc_type, make, year)

    # print '%s\t%s' % (key, value)
    print('%s\t%s' % (vin_num, value))

