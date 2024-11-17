Activate environment
Make sure you have all input files shuf.a.bed.gz and hist/reference.hist
```
mamba activate rescale_to_reference
```
1. normalised_frequency: This rule calculates the normalised frequency of the query file
2. lines: This rule calculates the number of lines to pull to rescale the query to reference
3. subsample: This rule randomly selects the lines from the shuf.a file. The number of lines pulled was calculated in previous rule
4. rescaled_hist: Calculates the normalised frequency of the subsampled file.
```
snakemake --snakefile rescale_to_reference.smk hist/x_rescaled_0.hist -j1
```
```
gnuplot scripts/gnuplot.gp
```
