# Graph marker label anti-aliasing inconsistency

*[Thread on Statalist](https://www.statalist.org/forums/forum/general-stata-discussion/general/1656858-graph-marker-label-anti-aliasing-inconsistency)*

### Question

The first marker label is anti-aliased, but the others are not.

Any idea why and how to fix this?

* [mwe.do](mwe.do)
* [hist_auto_rep78.pdf](hist_auto_rep78.pdf)

![The first label is anti-aliased](label0.png)

![The second label is not anti-aliased](label1.png)

### Solution

I figured it out. scatter is stacking a ton of labels on top of each other. The first label has two labels stacked, while the second has five stacked.

A solution:

* [fixed.do](fixed.do)
* [hist_auto_rep78_fixed.pdf](hist_auto_rep78_fixed.pdf)
