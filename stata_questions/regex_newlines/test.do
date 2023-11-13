**** stata and line breaks of all varieties
**** author: lucas <jlr@lucasreddinger.com>

ssc install chartab

import delimited "msdos.csv", bindquotes(strict) maxquotedrows(unlimited) clear
save msdos, replace
import delimited "unix.csv", bindquotes(strict) maxquotedrows(unlimited) clear
save unix, replace
import delimited "mac.csv", bindquotes(strict) maxquotedrows(unlimited) clear
append using msdos
append using unix

chartab v2

* use \R to match all three styles of line breaks
generate str v3 = regexs(1) + "--" + regexs(2) if regexm(v2, "(.*)\R+(.*)")
chartab v3
list

* use \r to match legacy-mac- and msdos-style;
* it does not match unix-style (including modern mac os) line breaks
generate str v4 = regexs(1) + "--" + regexs(2) if regexm(v2, "(.*)\r+(.*)")
chartab v4
list
