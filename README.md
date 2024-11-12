Activate environment; make sure you have all input files shuf.a.bed.gz and hist/reference.hist
mamba activate rescale_to_reference
snakemake --snakefile rescale_to_reference.smk hist/x_rescaled_0.hist -j1
gnuplot scripts/gnuplot.gp
