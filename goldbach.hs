#!/usr/bin/env runhaskell

-- check if n is prime
isPrime :: Integer -> Bool
isPrime n = null [y | y <- [2..(ceiling (sqrt (fromInteger n)))], mod n y == 0]

-- check for an x of goldbach, all addtions to get x there is a prime pair, if not return the number
forLoop :: [Integer] -> Integer -> Bool -> Bool -> Maybe Integer
forLoop (a:as) b False True = Just (a+b)
forLoop (a:as) _ True _ = forLoop as 2 False False
forLoop (a:as) b False False = forLoop ([a-1]++as) (b+1) ((isPrime a) && (isPrime b)) (b>a)

-- the goldbach conjecture for all even integers (to a stopping point?)
goldbach :: Maybe Integer -> Integer
goldbach Nothing = goldbach (forLoop [(4*10^18),(4*10^18+2)..] 2 False False)
goldbach (Just x) = x

-- main function
main :: IO ()
main = print (goldbach Nothing)
