module Main where
import Text.Printer.Integral ( binary ) 
import Flat.Bits ( asBits )
import qualified Data.Vector.Unboxed as DV
import Data.List.Split ( chunksOf )
import Text.PrettyPrint.Boxes ( hsep, printBox, right, text, vcat )
import Control.Monad (guard)

main :: IO ()
main = putStrLn "hello world"

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

-- Eight ways to do allEven. Is it funny yet?
allEven :: Integral a => [a] -> [a]
allEven xs = filter even xs

allEven' :: Integral a => [a] -> [a]
allEven' = filter even

allEven'' :: Integral a => [a] -> [a]
allEven'' xs = [x | x <- xs, even x]

allEven''' :: Integral a => [a] -> [a]
allEven''' xs = [x | x <- xs, mod x 2 == 0]

allEven'''' :: [Int] -> [Int]
allEven'''' xs = [x | x <- xs, not $ DV.last $ asBits (x::Int)]

allEven''''' :: Integral a => [a] -> [a]
allEven''''' xs = [x | x <- xs, '0' == last (binary x :: String)]

allEven'''''' :: Integral a => [a] -> [a]
allEven'''''' xs = [x | x <- xs, elem (mod x 10) [0,2..8]]

allEven''''''' :: (Num a, Ord a, Enum a) => [a] -> [a]
allEven''''''' xs = [x | x <- xs, elem x [0,2..(maximum xs)]]

-- //////////////////////////////////

colorCombos :: [(String, String)]
colorCombos = combos ["black", "white", "blue", "yellow", "red"]

combos :: [a] -> [(a, a)]
combos [] = []
combos xs = [(head xs, y) |  y <- tail xs] ++ combos (tail xs)

-- ///////////////////////////

tableSize :: Int
tableSize = 20

multTable :: [(Int, Int, Int)]
multTable = [(x,y,x*y) | x <- [1..tableSize], y <- [1..tableSize]]

printMultTable :: IO ()
printMultTable = printBox . hsep 2 right . map (vcat right . map text) . chunksOf tableSize $ map (\(_,_,xy) -> show xy ) multTable

-- printMultTable ->
--  1   2   3   4   5   6   7   8    9   10   11   12
--  2   4   6   8  10  12  14  16   18   20   22   24
--  3   6   9  12  15  18  21  24   27   30   33   36
--  4   8  12  16  20  24  28  32   36   40   44   48
--  5  10  15  20  25  30  35  40   45   50   55   60
--  6  12  18  24  30  36  42  48   54   60   66   72
--  7  14  21  28  35  42  49  56   63   70   77   84
--  8  16  24  32  40  48  56  64   72   80   88   96
--  9  18  27  36  45  54  63  72   81   90   99  108
-- 10  20  30  40  50  60  70  80   90  100  110  120
-- 11  22  33  44  55  66  77  88   99  110  121  132
-- 12  24  36  48  60  72  84  96  108  120  132  144






