set terminal pngcairo size 1200,1200

set title "Расчётные кривые изменения общей силы тока I, резистора U_{R}, катушки U_{L} и конденсатора U_{C} от ёмкости конденсатора C"
set xlabel "C, мкФ"
set ylabel "I, U_{R}, U_{L}, U_{C}, В"
set grid

set xrange [120:220]

set output "plots/pictures/I__U_R__U_L__U_C___C.png"
plot "plots/files/I_C_u.txt" title "I(C)" with linespoints, "plots/files/U_R_C.txt" title "U_{R}(C)" with linespoints, "plots/files/U_L_C.txt" title "U_{L}(C)" with linespoints, "plots/files/U_C_C.txt" title "U_{C}(C)" with linespoints  
