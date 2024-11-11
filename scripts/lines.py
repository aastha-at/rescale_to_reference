import sys

with open('/home/bec51310.iitr/workplace/project/rescale_to_reference/total.txt','r') as f:
    total=int(f.read().strip())

with open('/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/query.hist','r') as query:
    query_df=[line.split() for line in query]

with open('/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/reference.hist','r') as ref:
    ref_df=[line.split() for line in ref]

query_df=[(int(fragment),float(norm)) for fragment,norm in query_df]
ref_df=[(int(fragment),float(norm)) for fragment,norm in ref_df]

i=0
j=0
mod_diff=0
fragment_length=0
max_diff=0
scale_frag=0
scale_norm=0

while i<len(query_df) and j<len(ref_df):
    query_len,query_norm=query_df[i]
    ref_len,ref_norm=ref_df[j]
    if query_len==ref_len:
        mod_diff=abs(query_norm-ref_norm)
        if mod_diff>max_diff:
            max_diff=mod_diff
            scale_frag=total*query_norm
            scale_norm=ref_norm           
        i+=1
        j+=1
    elif query_len<ref_len:
        i+=1
    else:
        j+=1


sample_df=[]
i=0
j=0

while i<len(query_df) and j<len(ref_df):
    query_len,query_norm=query_df[i]
    ref_len,ref_norm=ref_df[j]
    if query_len==ref_len:
        lines_to_pull=int((ref_norm/scale_norm)*scale_frag)
        sample_df.append((query_len,lines_to_pull))
        i+=1
        j+=1
    elif query_len<ref_len:
        i+=1
    else:
        j+=1

for length,lines in sample_df:
    print(str(length)+"\t"+str(lines))
