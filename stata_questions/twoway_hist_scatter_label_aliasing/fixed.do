clear
set scheme plotplain
use http://www.stata-press.com/data/r8/auto.dta, clear

bysort rep78 : gen count = _N 
count if rep78 < . 
gen rep78_pct = 100*(count / r(N))
gen rep78_str = string(rep78_pct, "%4.2f") + "%"

sort rep78
quietly by rep78: gen rep78_unique = cond(_n==1,1,0)

twoway histogram rep78, percent discrete ///
|| scatter rep78_pct rep78 if rep78_unique, ms(none) mlabel(rep78_str) mlabpos(12)
graph export hist_auto_rep78_fixed.pdf, replace
graph close
