#!/usr/bin/env runhaskell

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
    let enda = toInteger (ceiling (sqrt (fromIntegral a)))
    let endb = toInteger (ceiling (sqrt (fromIntegral b)))
    let x = isPrime a enda False
    let y = isPrime b endb False
    forLoop (a-1) (b+1) (x && y)

-- the goldbach conjecture for all even integers (to a stopping point?)
goldbach :: Integer -> Bool -> Maybe Integer
goldbach x False = Just (x-2)
goldbach x True = do
    let b = forLoop (x-2) 2 False
    goldbach (x+2) b

-- main function
main :: IO ()
main = do
    let b = goldbach 100 True
    print b
