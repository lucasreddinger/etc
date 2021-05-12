** Stata data visualization question
// How to combine hbar?
// Lucas Reddinger <jlr@lucasreddinger.com>
// 2021 May 12

cls
clear
set more off

set obs 10000
set seed 12345

gen a=runiformint(1,9)
gen b=runiformint(2,7)

graph hbar, over(a) title("Count of a")
graph save a.gph, replace

graph hbar, over(b) title("Count of b")
graph save b.gph, replace

** The y-axis should be common, but it isn't
graph combine a.gph b.gph, ycommon
graph export combine_hbar.png, replace
graph close
rm a.gph
rm b.gph

** Now I'd like to make the same thing, with the bins laid side-by-side
** What is the discrete version of this graph below, to make something like a
** combined version of the graph above?
twoway (hist a, color(blue) fraction) (hist b, fraction), legend(label(1 "Count of a") label(2 "Count of b"))
graph export twoway_hist.png, replace
graph close
