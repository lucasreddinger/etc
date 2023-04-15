### Cited by

[Posted on Statalist.](https://www.statalist.org/forums/forum/general-stata-discussion/general/1463756-histogram-unequal-margins-question-where-the-bars-begin-on-the-left?p=1709960#post1709960)

### Annotated code

```
webuse auto

* this almost seems like the margin on the left and the right are equal.
histogram mpg, discrete
```
![](00.png?raw=true)

```
* changing x labels lets it fit better.
* note that the left-margin seems to be the width of the bar width used.
histogram mpg, discrete xlabel(15 20 30 40)
```
![](01.png?raw=true)

```
* we have extra space to the left again here.
histogram rep78, discrete
```
![](02.png?raw=true)

```
* removing the first couple labels doesn't eliminate the left-margin.
histogram rep78, discrete xlabel(2(1)5)
```
![](03.png?raw=true)

```
* xscale cannot tighten the lower bound either.
histogram rep78, discrete xlabel(2(1)5) xscale(range(1 5))
```
![](04.png?raw=true)
```
* but it's not because histogram wants to include zero.
histogram foreign, discrete xlabel(0 1, valuelabel)
```
![](05.png?raw=true)

```
* again, xlabel and xscale prove ineffective.
histogram foreign, discrete xlabel(0 1, valuelabel) xscale(range(0 1))
```
![](06.png?raw=true)

```
* avoiding the discrete option produces the same figure
histogram foreign, w(1) start(-0.5) xlabel(0 1, valuelabel) xscale(range(-0.5 1.5))
![](07.png?raw=true)

```
* note that a bar graph might be suitable, depending on what you're doing.
graph bar, over(foreign)
```
![](08.png?raw=true)

```
graph close
clear
```

