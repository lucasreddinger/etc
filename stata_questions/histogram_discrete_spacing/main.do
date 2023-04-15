webuse auto

* this almost seems like the margin on the left and the right are equal.
histogram mpg, discrete
graph export 00.png, replace

* changing x labels lets it fit better.
* note that the left-margin seems to be the width of the bar width used.
histogram mpg, discrete xlabel(15 20 30 40)
graph export 01.png, replace

* we have extra space to the left again here.
histogram rep78, discrete
graph export 02.png, replace

* removing the first couple labels doesn't eliminate the left-margin.
histogram rep78, discrete xlabel(2(1)5)
graph export 03.png, replace

* xscale cannot tighten the lower bound either.
histogram rep78, discrete xlabel(2(1)5) xscale(range(1 5))
graph export 04.png, replace

* but it's not because histogram wants to include zero.
histogram foreign, discrete xlabel(0 1, valuelabel)
graph export 05.png, replace

* again, xlabel and xscale prove ineffective.
histogram foreign, discrete xlabel(0 1, valuelabel) xscale(range(0 1))
graph export 06.png, replace

* avoiding the discrete option produces the same figure
histogram foreign, w(1) start(-0.5) xlabel(0 1, valuelabel) xscale(range(-0.5 1.5))
graph export 07.png, replace

* note that a bar graph might be suitable, depending on what you're doing.
graph bar, over(foreign)
graph export 08.png, replace

graph close
clear