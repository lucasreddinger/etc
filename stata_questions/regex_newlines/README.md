# Stata and line-breaks

Three styles of line breaks exist:

- MS-DOS and Windows use `\r\n` (CR LF), respectively a carriage-return and line-feed
- Unix-like systems (including modern Mac OS) use `\n` (LF), a sole line-feed
- Legacy Mac OS uses `\r` (CR), a sole carriage-return

## Matching with `regexm()`

- `\R` will match all three styles of line-breaks
- `\r` will match CR and CR LF, but not a sole LF

Run `test.do` to see a working example.

