#!/usr/bin/runhaskell

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n | (length [x | x <- [2 .. (toInteger (ceiling (sqrt (fromIntegral n))))], mod n x == 0]) > 0 = False
          | otherwise = True

forLoop :: Integer -> Integer -> Bool -> Bool
forLoop 1 b False = False
forLoop a b True = True
forLoop a b False = do
    let x = isPrime a
    let y = isPrime b
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
