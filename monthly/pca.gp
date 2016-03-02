set xdata time
set timefmt "%b"
set format x "%b"
set ylabel "Weight"

set key top right spacing 1
set style line 1 lt 1 lw 2 pt 6 ps 2
set style line 2 lt 2 lw 2 pt 2 ps 2
set style line 3 lt 3 lw 2 pt 1 ps 2
set style line 4 lt 4 lw 2 pt 6 ps 2
set style line 5 lt 1 lw 2 pt 3 ps 2
set style line 6 lt 2 lw 2 pt 4 ps 2
set style line 7 lt 3 lw 2 pt 3 ps 2
set style line 8 lt 4 lw 2 pt 3 ps 2


plot 'monthly/pca.gp.dat' using 1:2 with linespoints title "PC1: Yearly Total" ls 3, \
     'monthly/pca.gp.dat' using 1:3 with linespoints title "PC2: Summer Values" ls 7, \
     'monthly/pca.gp.dat' using 1:4 with linespoints title "PC3: Spring Values" ls 6
