# goldbach
The Goldbach Conjecture

### halts.hs
This haskell file determines if the Goldbach Conjecture ever stops.  Indeed it does determine that it stops, with a runtime of a second or less.  However, running goldbach.hs takes seemingly forever, and I have even gone up by powers of two instead of additions of two.  It still seemingly never stops.  As such we can conclude that P does NOT equal NP, at least for this problem.

###### Note:
Commenting out the ```comb _ Nothing = Nothing``` line still shows the same result of Just True.
