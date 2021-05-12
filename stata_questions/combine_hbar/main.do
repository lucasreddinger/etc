** Stata data visualization question
// How to combine hbar?
// Lucas Reddinger <jlr@lucasreddinger.com>
// 2021 May 12

cd E:\lucas\projects_public_github_jlr\etc\stata_questions\combine_hbar

cls
clear
set more off

set obs 10000
set seed 12345
set scheme s2mono

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

** This is exactly what I wish worked in the way I envision!
graph hbar, over(a) over(b)
graph export hbar_over_over.png, replace
graph close

** How can I put the bars for a and b side-by-side for each count?
twoway (hist a, discrete fraction color(blue) barw(0.8)) (hist b, discrete fraction fcolor(none) barw(0.8)), legend(label(1 "Count of a") label(2 "Count of b"))
graph export twoway_hist--discrete.png, replace
graph close

** This is almost correct, but the frequencies/percents should be doubled!
stack a b, into(c) clear
gen a = (_stack==1)
drop _stack

graph hbar, over(a, relabel(1 "A" 2 "B")) over(c) ascategory asyvars bar(1, fcolor(blue))
graph export stack_hbar.png, replace
graph close

** Frequency weights do not help
egen tot_by_grp = count(c), by(a)
gen grp_wt = _N / tot_by_grp

graph hbar [fweight=grp_wt], over(a, relabel(1 "A" 2 "B")) over(c) ascategory asyvars bar(1, fcolor(blue))
graph export stack_hbar--fweight.png, replace
graph close
