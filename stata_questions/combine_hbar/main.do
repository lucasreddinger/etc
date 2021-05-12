cls
clear
set more off

set obs 10000
set seed 12345

gen a=runiformint(1,9)
gen b=runiformint(2,7)

graph hbar, over(a) scale(.7) ///
	title("Number of a") ///
	note("N=`N'", pos(1) ring(0))
graph save a.gph, replace

graph hbar, over(b) scale(.7) ///
	title("Number of b") ///
	note("N=`N'", pos(1) ring(0))
graph save b.gph, replace

// The y-axis should be common, but it isn't
graph combine a.gph b.gph, rows(1) xsize(3) ysize(2) imargin(small) xcommon ycommon
graph export combine_hbar.png, replace
graph close

** Now I'd like to make the same thing, with the bins laid side-by-side
** What is the discrete version of this graph below, to make something like a
** combined version of the graph above?
twoway (hist a, color(blue) fraction) (hist b, fraction), legend(label(1 "a") label(2 "b"))
graph export twoway_hist.png, replace
graph close
