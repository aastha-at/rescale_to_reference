import sys
import pandas as pd

input_df=pd.read_csv('data/metadata.tsv', header='infer')

rule normalised_frequency:
    input:
        input_df['path'][0]  # using first path from metadata
    output:
        "hist/query.hist"
    shell:
        "zcat {input} | python scripts/frequency.py | sort -k1,1n > {output}"

rule lines:
    input:
        "hist/query.hist"
    output:
        "lines_to_pull.tsv"
    shell:
        "python scripts/lines.py > {output}"

rule subsample:
    input:
        bed=input_df['path'][0],  # using first path from metadata
        lines="lines_to_pull.tsv"
    output:
        shuffled=temp("{sample}_shuffled_{rep}.bed.gz"),
        rescaled="subsample/{sample}_rescaled_{rep}.bed.gz"
    shell:
        """
        zcat {input.bed} | shuf | gzip > {output.shuffled}
        zcat {output.shuffled} | python scripts/rescaled.py | gzip > {output.rescaled}
        """

rule rescaled_hist:
    input:
        "subsample/{sample}_rescaled_{rep}.bed.gz"
    output:
        "hist/{sample}_rescaled_{rep}.hist"
    shell:
        "zcat {input} | python scripts/frequency.py | sort -k1,1n > {output}"
