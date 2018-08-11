# Matt McDade
# Computer Networks
# HW 2, Problem 4
#
# ----------------------------------------------
# TO RUN: install python 2.7, navigate to file's
#   directory and enter "python 4.py"
# ----------------------------------------------

import random

# Get ones complement of a string
def onesComplement(a):
    temp = list(a)
    new = ''
    for i in temp:
        if int(i):
            new += '0';
        else:
            new += '1';
    return new


# Fill empty list with random 16-bit sequences
def fill(a):
    for x in range(0, 20):
        for i in range(0, 16):
            a[x] += str(random.randint(0,1))


# Perform binary addition for
def add(a):
    sum = bin(0)
    for x in range(0, 20):
        sum = bin(int(sum,2) + int(a[x]))
    return sum

# Flips the second bit of the 4th and 8th sequence
def modify(a):
    temp = list(a[3])
    if int(temp[1]):
        temp[1] = '0'
    else:
        temp[1] = '1'
    a[3] = "".join(temp)

    temp = list(a[7])
    if int(temp[1]):
        temp[1] = '0'
    else:
        temp[1] = '1'
    a[3] = "".join(temp)

    return a

# list to store sequences
a = ['','','','','','','','','','','','','','','','','','','','']
fill(a)
print 'Original 20 Sequences:', a
summed = add(a)
print 'Sum of 20 Sequences:', summed[2:]
flipped = onesComplement(summed[2:])
print 'Final result after ones complement:', flipped

modifications = modify(a)
newSummed = add(modifications)
newFlipped = onesComplement(newSummed[2:])
print 'Final Result for modified sequences (3rd bullet point):', newFlipped
