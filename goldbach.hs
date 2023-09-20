#!/usr/bin/env runhaskell

-- check if n is prime
isPrime :: Integer -> Bool
isPrime n = null [y | y <- [2..(ceiling (sqrt (fromInteger n)))], mod n y == 0]

-- check for an x of goldbach, all addtions to get x there is a prime pair, if not return the number
forLoop :: [Integer] -> Integer -> Bool -> Bool -> IO ()
forLoop (a:as) b False True = print (a+b)
forLoop (a:as) b True _ = do {print [(a+b),(a+1),(b-1)]; forLoop as 2 False False}
forLoop (a:as) b False False = forLoop ([a-1]++as) (b+1) ((isPrime a) && (isPrime b)) (b>a)

-- the goldbach conjecture for all even integers (to a stopping point?)
goldbach :: Integer -> IO ()
goldbach g = forLoop [g,(g+2)..] 2 False False

-- main function
main :: IO ()
main = goldbach (4*10^12)
