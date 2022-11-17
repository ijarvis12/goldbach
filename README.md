# goldbach
The Goldbach Conjecture

### halts.hs
This haskell file determines if the Goldbach Conjecture ever stops.  Indeed it does determine that it stops, with a runtime of a second or less.  However, running goldbach.hs takes seemingly forever, and I have even gone up by powers of two instead of additions of two.  It still seemingly never stops.  As such we can conclude that P does NOT equal NP, at least for this problem.  Unless there is a bug in the compiler, or I'm misunderstanding how Monads work in Haskell.

###### Note:
Commenting out the line ```wrapM _ Nothing = Nothing``` still shows the same end result of Just True when running the program.
