#!/usr/bin/env python

import sys

# [Define group level master information]
current_key = None
accidents_cnt = 0

def reset():
    # [Logic to reset master info for every new group]
    global current_key, accidents_cnt
    current_key = None
    accidents_cnt = 0

# Run for end of every group
def flush():
    # [Write the output]
    global current_key, accidents_cnt
    print('%s\t%s' % (current_key, accidents_cnt))

# input comes from STDIN
for line in sys.stdin:

    # [parse the input we got from mapper and update the master info]
    row_data = line.split("\t")
    key = row_data[0]
    val = int(row_data[1])

    # [detect key changes]
    if current_key != key:
        if current_key != None:
            # write result to STDOUT
            flush()
        reset()
    
    # [update more master info after the key change handling]
    accidents_cnt += 1
    
    current_key = key

# do not forget to output the last group if needed!
flush()