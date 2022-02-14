#!/usr/bin/env python

import sys

# [Define group level master information]
current_vin = None
make = ""
year = ""
accidents_cnt = 0

def reset():
    # [Logic to reset master info for every new group]
    global make, year, accidents_cnt, current_vin
    current_vin = None
    make = ""
    year = ""
    accidents_cnt = 0

# Run for end of every group
def flush():
    # [Write the output]
    global current_vin, make, year, accidents_cnt
    for _ in range(accidents_cnt):
        print('%s\t%s\t%s' % (current_vin, make, year))

# input comes from STDIN
for line in sys.stdin:

    # [parse the input we got from mapper and update the master info]
    row_data = line.split("\t")
    vin = row_data[0]
    val = eval(row_data[1])
    rec = val
    inc_type = rec[0]

    # [detect key changes]
    if current_vin != vin:
        if current_vin != None:
            # write result to STDOUT
            flush()
        reset()
    
    # [update more master info after the key change handling]
    if inc_type == "I":
        make = rec[1]
        year = rec[2]
    if inc_type == "A":
        accidents_cnt += 1
    
    current_vin = vin

# do not forget to output the last group if needed!
flush()