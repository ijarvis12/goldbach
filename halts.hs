#!/usr/bin/runhaskell

-- check for divisability
check :: Integer -> Integer -> Bool
check x n = (mod x n) == 0

-- check if x is prime
isPrime :: Integer -> Integer -> Bool -> Bool
isPrime x 1 False = True
isPrime x end False = isPrime x (end-1) (check x end)
isPrime x end True = False

-- check for an x of goldbach, all addtions to get x there is a prime pair
forLoop :: Integer -> Integer -> Bool -> Bool
forLoop 1 b False = False
forLoop a b True = True
forLoop a b False = do
    let enda = (toInteger (ceiling (sqrt (fromIntegral a))) + 1)
    let endb = (toInteger (ceiling (sqrt (fromIntegral b))) + 1)
    let x = isPrime a enda False
    let y = isPrime b endb False
    forLoop (a-1) (b+1) (x==y)

-- check the goldbach conjecture for all even integers
goldbach :: Integer -> Bool -> Maybe Bool
goldbach x False = Just False
goldbach x True = do
    let b = forLoop (x-2) 2 False
    goldbach (x+2) b

-- lets function f execute until no output/input
wrapM :: (a -> Maybe b) -> Maybe a -> Maybe b
wrapM _ Nothing = Nothing
wrapM f (Just x) = f x

-- check function f halts
halts :: (Maybe Bool -> Maybe Bool) -> Maybe Bool
halts f = Just True

-- main function
main :: IO ()
main = do
    let b = halts (wrapM (goldbach 4))
    print "Does the Goldbach Conjecture halt?"
    print b
