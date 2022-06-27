
-- Day 1

-- 1. How many different ways can you find to write allEven?

allEven = and . map even

-- Tests
allEven [2,4,6,8] -- True
allEven [1..5]    -- False

-- 2. Write a function that takes a list and returns the same list in reverse.

reverse_ :: [a] -> [a]
reverse_ []    = []
reverse_ (h:t) = (reverse_ t) ++ [h]

-- Tests
reverse_ [1..5] -- [5,4,3,2,1]

-- 3. Write a function that builds two-tuples with all possible combinations of two of the colors black,
-- white, blue, yellow, and red. Note that you should include only one of (black, blue) and (blue, black).

import Control.Monad (join)
import Data.List.HT (outerProduct)

triangleProduct :: [b] -> [(b, b)]
triangleProduct = concat
                . zipWith drop [1..]
                . join (outerProduct (,))

colors = ["black","red","yellow","blue"]

triangleProduct colors -- [("black","red"),  ("black","yellow"),
                       --  ("black","blue"), ("red","yellow"),
                       --  ("red","blue"),   ("yellow","blue")]

-- 4. Write a list comprehension to build a childhood multiplication table. The table would be a list of
-- three-tuples where the first two are integers from 1–12 and the third is the product of the first two.

join (outerProduct (*)) [1..10]
-- [[1,2,3,4,5,6,7,8,9,10],
--  [2,4,6,8,10,12,14,16,18,20],
--  [3,6,9,12,15,18,21,24,27,30],
--  [4,8,12,16,20,24,28,32,36,40],
--  [5,10,15,20,25,30,35,40,45,50],
--  [6,12,18,24,30,36,42,48,54,60],
--  [7,14,21,28,35,42,49,56,63,70],
--  [8,16,24,32,40,48,56,64,72,80],
--  [9,18,27,36,45,54,63,72,81,90],
--  [10,20,30,40,50,60,70,80,90,100]]

-- 5. Solve the map-coloring problem (Section 4.2, Map Coloring, on page 101) using Haskell.

-- Skip

-- Day 2

-- 1. Write a sort that takes a list and returns a sorted list.

import Data.List (partition)
import Data.Function (on)

sort_ []  = []
sort_ [x] = [x]
sort_ (x:xs) = concat (map sort_ [l, [x], r])
    where (l,r) = partition (<x) xs

-- 2. Write a sort that takes a list and a function that compares its two
-- arguments and then returns a sorted list.

-- Skip

-- 3. Write a Haskell function to convert a string to a number. The string should be in the
-- form of $2,345,678.99 and can possibly have leading zeros.

import Data.Char (digitToInt)

stringtoNumber = (/100)
               . fromInteger
               . toInteger
               . foldl1 (\acc e -> 10 * acc + e)
               . map digitToInt
               . filter (not . flip elem "$,.")

-- 4. Write a function that takes an argument x and returns a lazy sequence that has every
-- third number, starting with x. Then, write a function that includes every fifth number,
-- beginning with y. Combine these functions through composition to return every eighth number,
-- beginning with x + y.

everyThird x = map ((x+) . (3*)) [0..]
everyFifth x = map ((x+) . (5*)) [0..]

-- 5. Use a partially applied function to define a function that will return half of a
-- number and another that will append \n to the end of any string.

half = (/2)
addLineEnd = (++"\n")

-- Extra

-- 6. Write a function to determine the greatest common denominator of two integers.

-- Skip

-- 7. Create a lazy sequence of prime numbers.

isPrime x    = (3>) . length . filter (==0) . map (mod x) $ [1..x]
firstNPrimes = flip take (filter isPrime [1..])
firstNPrimes 10 -- [1,2,3,5,7,11,13,17,19,23]

-- 8. Break a long string into individual lines at proper word boundaries.

import Data.List.Split (splitOn)

paragraph = "I like APL. It was\n created by Ken\nIverson."

lines = splitOn "\n"

lines paragraph
-- ["I like APL. It was"," created by Ken","Iverson."]

-- 10. Add line numbers to the previous exercise.

numberedLines = zip [1..] . lines
-- [(1,"I like APL. It was"),(2," created by Ken"),(3,"Iverson.")]

numberedLines = zipWith (\i l -> (show i) ++ " " ++ l) [1..] . lines
-- ["1 I like APL. It was","2  created by Ken","3 Iverson."]

-- 11. To the above exercise, add functions to left, right, and fully justify
-- the text with spaces (making both margins straight).

-- Skip

-- Day 3

-- 1. Write a function that looks up a hash table value that uses the Maybe monad.
-- Write a hash that stores other hashes, several levels deep. Use the Maybe monad
-- to retrieve an element for a hash key several levels deep.

fakeHashMap = zip [1..] ['a'..'z']

findValue :: (Eq a) => a -> [(a, b)] -> Maybe b
findValue key hashMap
    | null kv   = Nothing
    | otherwise = Just (snd (head kv))
       where kv = filter ((key==) . fst) hashMap

findValue 10 fakeHashMap -- Just 'j'
findValue 30 fakeHashMap -- Nothing

-- 2. Represent a maze in Haskell. You’ll need a Maze type and a Node type, as well
-- as a function to return a node given its coordinates. The node should have a
-- list of exits to other nodes.

-- Skip

-- 3. Use a List monad to solve the maze.

-- Skip

-- 4. Implement a Monad in a nonfunctional language. (See the article series on monads in Ruby 5)

-- Skip
