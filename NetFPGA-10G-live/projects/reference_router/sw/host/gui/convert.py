#!/usr/bin/python

import re

input_file = '../reg_defines.h'
output_file = open("../reg_defines_com.h", "w")
lines = 0

with open( input_file ) as output:
    f = output.readlines()    

    for line in f:
        lines = lines + 1
        if 'AXI4' in line:
	    newline= "/* */\n"
	    output_file.write(newline)
	elif 'GENERIC' in line:
	    newline= "/* */\n"
	    output_file.write(newline)
	elif '8.00.b' in line:
	    newline= "/* */\n"
	    output_file.write(newline)

        else:
            output_file.write(line)


