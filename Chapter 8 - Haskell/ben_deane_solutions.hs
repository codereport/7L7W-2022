{-# LANGUAGE TupleSections #-}

module BD where

import Data.Char
import Data.List

-- Day 1

allEven :: [Integer] -> [Integer]
allEven = filter (\x -> x `mod` 2 == 0)

myReverse :: [a] -> [a]
myReverse = foldl' (flip (:)) []

data Color = Black | White | Purple | Yellow | Pink
  deriving Show

buildTuples :: [a] -> [(a,a)]
buildTuples (x:xs) = map (x,) xs ++ buildTuples xs
buildTuples _ = []

multiplicationTables :: Integer -> [(Integer, Integer, Integer)]
multiplicationTables n = map f l <*> l
  where l = [1..n]
        f x y = (x, y, x*y)

data State = Alabama | Mississippi | Georgia | Tennessee | Florida
  deriving (Show, Eq)
data MapColor = Red | Green | Blue
  deriving (Show, Eq)

different :: [(State, State)]
different = [(Mississippi, Tennessee),
             (Mississippi, Alabama),
             (Alabama, Tennessee),
             (Alabama, Georgia),
             (Alabama, Florida),
             (Georgia, Florida),
             (Georgia, Tennessee)]

coloring :: [State] -> [MapColor] -> [[(State, MapColor)]]
coloring = undefined

-- Day 2

mySort1 :: Ord a => [a] -> [a]
mySort1 [] = []
mySort1 (x:xs) = mySort1 lhs ++ (x : mySort1 rhs)
  where (lhs, rhs) = partition (<x) xs

mySort2 :: (a -> a -> Bool) -> [a] -> [a]
mySort2 f [] = []
mySort2 f (x:xs) = mySort2 f lhs ++ (x : mySort2 f rhs)
  where (rhs, lhs) = partition (f x) xs

strToNum :: String -> Double
strToNum s = (read canonical :: Double)
  where canonical = filter (\x -> (isDigit x) || x == '.') s

everyNth :: Integer -> Integer -> [Integer]
everyNth n i = map (+i) [0, n..]

everyThird :: Integer -> [Integer]
everyThird = everyNth 3

everyFifth :: Integer -> [Integer]
everyFifth = everyNth 5

half :: Fractional a => (a -> a)
half = (/2)

appendLF :: String -> String
appendLF = (++ "\n")

myGCD :: Integer -> Integer -> Integer
myGCD a b
  | a == b = a
  | a > b = myGCD (a-b) b
  | otherwise = myGCD a (b-a)
