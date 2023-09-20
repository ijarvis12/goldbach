#!/usr/bin/env runhaskell

isPrime :: Integer -> Bool
isPrime n = not (elem True (map (==0) (map (mod n) [2..(ceiling (sqrt (fromInteger n)))] ) ) )

-- check for an x of goldbach, all addtions to get x there is a prime pair, if not return the number
forLoop :: [Integer] -> Integer -> Bool -> Bool -> Maybe Integer
forLoop (a:as) b False True = Just (a+b)
forLoop (a:as) _ True _ = forLoop as 2 False False
forLoop (a:as) b False False = forLoop ([a-1]++as) (b+1) ((isPrime a) && (isPrime b)) (b>a)

-- the goldbach conjecture for all even integers (to a stopping point?)
goldbach :: Maybe Integer -> Integer
goldbach Nothing = goldbach (forLoop [4,6..] 2 False False)
goldbach (Just x) = x

-- main function
main :: IO ()
main = print (goldbach Nothing)
