#!/usr/bin/python3

#fname = raw_input()

def main():
    fname = 'romeo.txt'
try: 
    fhand = open(fname) 
except:
    print 'File cannot be opened:', fname
    exit()
counts = dict()
for line in fhand:
    words = line.split()
    for word in words:
        if word not in counts:
            counts[word] = 1
        else:
            counts[word] += 1
print counts

if __name__=='__main__': main()

#       
     