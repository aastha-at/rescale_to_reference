set terminal png size 1200,900
set output 'rescale_to_reference.png'
set xlabel "Fragment length"
set ylabel "Normalised frequency"
set xtics 100
set ytics 0.005
set xrange [0:700]
set yrange [0:0.025]
set key inside


set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 1 ps 1 
set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 2 ps 1 
set style line 3 lc rgb '#29c524' lt 1 lw 2 pt 3 ps 1 
set style line 4 lc rgb '#7D72F9' lt 1 lw 2 pt 4 ps 1

plot "/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/reference.hist" using 1:2 with lines title "Reference" lc rgb "forest-green" lw 2, \
     "/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/query.hist" using 1:2 with lines title "Query" lc rgb "magenta" lw 2, \
     "/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/x_rescaled_0.hist" using 1:2 with linespoints title "Rep_0" ls 1, \
     "/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/y_rescaled_0.hist" using 1:2 with linespoints title "Rep_1" ls 2, \
     "/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/x_rescaled_1.hist" using 1:2 with linespoints title "Rep_2" ls 3, \
     "/home/bec51310.iitr/workplace/project/rescale_to_reference/hist/y_rescaled_1.hist" using 1:2 with linespoints title "Rep_3" ls 4

unset output
