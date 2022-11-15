#!/usr/bin/runhaskell


check :: Integer -> Integer -> Bool
check x n = (mod x n) == 0

isPrime :: Integer -> Integer -> Bool -> Bool
isPrime x 1 False = True
isPrime x end False = isPrime x (end-1) (check x end)
isPrime x end True = False

forLoop :: Integer -> Integer -> Bool -> Bool
forLoop 1 b False = False
forLoop a b True = True
forLoop a b False = do
    let enda = (toInteger (ceiling (sqrt (fromIntegral a))) + 1)
    let endb = (toInteger (ceiling (sqrt (fromIntegral b))) + 1)
    let x = isPrime a enda False
    let y = isPrime b endb False
    forLoop (a-1) (b+1) (x==y)

goldbach :: Integer -> Bool -> Maybe Bool
goldbach x False = Just False
goldbach x True = do
    let b = forLoop (x-2) 2 False
    goldbach (x+2) b

comb :: (a -> Maybe b) -> Maybe a -> Maybe b
comb _ Nothing = Nothing
comb f (Just x) = f x

halt :: (Maybe Bool -> Maybe Bool) -> Maybe Bool
halt f = Just True

main :: IO ()
main = do
    let b = halt (comb (goldbach 4))
    print b
