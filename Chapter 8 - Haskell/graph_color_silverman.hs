-- Copied from https://mfukar.github.io/2015/09/30/haskellxiii.html
-- because I am not anywhere at the skill level to write a graph
-- coloring algorithm in Haskell;
-- with slight modification to name states and map colors to match
-- Seven Languages in Seven Weeks problem to do map coloring in Haskell
module Main where
import Data.List ( sortBy ) 
import Data.Ord ( comparing ) 

main :: IO ()
main = do print $ wpcolor southWestStates
-- output is
-- [(Florida,Blue),(Tennessee,Blue),(Mississippi,Green),(Georgia,Green),(Alabama,Red)]

data Graph a = Graph [a] [(a, a)]
    deriving (Show, Eq)

data Adjacency a = Adj [(a, [a])]
    deriving (Show, Eq)

data StateName = Alabama | Florida | Georgia | Mississippi | Tennessee
                    deriving (Show, Eq, Ord)

data MapColors = Red | Green | Blue
                    deriving (Show, Eq, Ord, Enum)

statenames :: [StateName]
statenames = [Alabama, Florida, Georgia, Mississippi, Tennessee]

mapColors :: [MapColors]
mapColors = [Red, Green, Blue]

southWestStates :: Graph StateName
southWestStates = Graph [Alabama, Florida, Georgia, Mississippi, Tennessee]
                        [(Alabama, Florida), (Alabama, Georgia), (Alabama, Mississippi), (Alabama, Tennessee), 
                        (Georgia, Florida), (Georgia, Tennessee), (Mississippi, Tennessee)]

sort_degree :: (Eq a, Ord a, Show a) => Graph a -> Adjacency a
sort_degree g = Adj $ sortBy (flip $ comparing $ length . snd) l
    where
        Adj l = graphToAdj g

graphToAdj :: (Eq a) => Graph a -> Adjacency a
graphToAdj (Graph [] _)      = Adj []
graphToAdj (Graph (x:xs) ys) = Adj ((x, ys >>= f) : zs)
   where 
      f (a, b) 
         | a == x = [b]
         | b == x = [a]
         | otherwise = []
      Adj zs = graphToAdj (Graph xs ys)

wpcolor :: (Ord a, Show a) => Graph a -> [(a, MapColors)]
wpcolor g = wpcolor' l [] Red
    where
        -- Step 1: All vertices are sorted according to decreasing degree
        Adj l = sort_degree g
        wpcolor' [] ys _ = ys
        wpcolor' xs ys n = let ys' = color xs ys n
                            in wpcolor' [x | x <- xs, notElem (fst x, n) ys'] ys' (succ n)
        -- Color will take care of steps 3 & 4, by coloring vertices not connected to
        -- already colored vertices:
        color []            ys n = ys
        color ((v, e) : xs) ys n = if any (\x -> (x, n) `elem` ys) e
                                   then color xs ys n
                                   else color xs ((v, n) : ys) n

