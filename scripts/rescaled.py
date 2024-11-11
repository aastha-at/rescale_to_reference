import sys

with open('/home/bec51310.iitr/workplace/project/rescale_to_reference/lines_to_pull.tsv','r') as lines:
   lines_df=[line.split() for line in lines]

length_count={int(row[0]):int(row[1]) for row in lines_df}

for lines in sys.stdin:
    item=lines.split('\t')
    length=int(item[3])
    length_count[length]-=1
    if(length_count[length])>0:
        print(lines.strip())
