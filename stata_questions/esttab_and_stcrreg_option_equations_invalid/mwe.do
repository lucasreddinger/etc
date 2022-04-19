use https://www.stata-press.com/data/r17/hypoxia
stset dftime, failure(failtype == 1)
stcrreg ifp tumsize, compete(failtype == 2)
eststo e1, title("cr")
stcrreg ifp tumsize, compete(failtype == 2) tvc(ifp tumsize pelnode)
eststo e2, title("tvc")
stcrreg ifp tumsize pelnode, compete(failtype == 2)
eststo e3, title("cr")
stcrreg ifp tumsize pelnode, compete(failtype == 2) tvc(ifp tumsize pelnode)
eststo e4, title("tvc")
esttab e1
esttab e2
esttab e1 e2

* Solution follows
esttab e1 e2, equations(1)
esttab e1 e2 e3 e4, equations(1)