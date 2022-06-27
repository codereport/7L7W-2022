module Main where

import System.Random ( uniformR, mkStdGen )
import Data.List ( delete, unfoldr ) 
import Data.List.Split ( chunksOf ) 

main :: IO ()
main = do
    print "sorting"
    print $ randomList 100
    print $ sort' $ randomList 100
    print $ myCompareSort $ randomList 100
    print ""
    print "money to float"
    print $ moneyStr
    print $ moneyToFloat moneyStr
    print $ moneyToFloat' moneyStr
    print ""
    print "Every 8th"
    print $ take 50 every8th
    print ""
    print "GCD"
    print "234523 and 13245345"
    print $ gcd' 234523 13245345
    print ""
    print "Prime List"
    print $ take 100 pInfSeq


-- Can't do random seed without wrapping everything in IO mondad
-- And I don't want to.
-- Cause managing the unwrapping confuses me!
-- So we have a fixed seed to make a sample list to sort.
seed :: Int
seed = 12323

randomList :: Int -> [Int]
randomList n = take n . unfoldr (Just . uniformR (1, 100))  $ mkStdGen seed

-- Very ineffecient selection sort.
sort' :: [Int] -> [Int]
sort' [] = []
sort' [x] = [x]
sort' xs = m : sort' (delete m xs)
            where m = minimum xs

-- and with my own compare function
compare' :: Ord a => a -> a -> Bool
compare' x y 
    | x < y = True
    | otherwise = False

minimum' :: Foldable t1 => (t2 -> t2 -> Bool) -> t1 t2 -> t2
minimum' cfn xs = foldr1 (\x y -> if (cfn x y) then x else y) xs

sort'' :: (Int -> Int -> Bool) -> [Int] -> [Int]
sort'' _ [] = []
sort'' _ [x] = [x]
sort'' cfn xs = m : sort' (delete m xs)
            where m = minimum' cfn xs

myCompareSort :: [Int] -> [Int]
myCompareSort = sort'' compare'

-- currency string to number, edge case "$.34" needs leading zero
moneyStr :: String
moneyStr = "$02,120.56"

moneyToFloat :: String -> Float
moneyToFloat xs = read ('0':[x | x <- xs, x /= '$', x /= ',']) :: Float

moneyToFloat' :: String -> Float
moneyToFloat' =  read . filter (not . (`elem` "$,")) . ('0':)


-- every nth problem
everynth :: Int -> [Int]
everynth n = map head $ chunksOf n [n..]
-- if you like pointfree 
-- everynth = map head . ap chunksOf enumFrom

every3rd :: [Int]
every3rd = everynth 3 

every5th :: [Int]
every5th = everynth 5 

every8th :: [Int]
every8th = zipWith (+) every3rd every5th

-- partial functions

halfNum :: Double -> Double
halfNum = (/ 2)

appendNLine :: String -> String
appendNLine = (++ "\n")

-- GCD
gcd' :: Integral t => t -> t -> t
gcd' a b 
    | a == 0 = b 
    | b == 0 = a
    | otherwise = gcd' (a' `mod` b') b'
        where a' = maximum [a,b]
              b' = minimum [a,b]

-- inefficient prime sequence
-- according to https://stackoverflow.com/questions/4690762/determining-if-a-given-number-is-a-prime-in-haskell
-- the 'null' function short-circuts the evaluation of divisibility
-- to make it slightly more efficient
isP :: Integer -> Bool
isP n = if n > 2 then null [ x | x <- [2..isqrt n], n `mod` x == 0] else False
    where isqrt = ceiling . sqrt . fromInteger

pInfSeq :: [Integer]
pInfSeq = filter isP [2..]
