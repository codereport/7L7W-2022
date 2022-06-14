module Main where

import Data.List ( intercalate )  

-- break long lines, and now I'm doing the IO monad dance...



data Quad = QLeft | QRight | QFull
    deriving (Show, Eq)

main :: IO ()
main = do
    let lineWidth = 50
    print "Left Justify"
    breakLines "cantebury.txt" QLeft lineWidth
    print ""
    print "Right Justify"
    breakLines "cantebury.txt" QRight lineWidth
    print ""
    print "Full Justify"
    breakLines "cantebury.txt" QFull lineWidth
    
breakLines :: FilePath -> Quad -> Int -> IO ()
breakLines fname quad width = do 
    ftext <- readFile fname
    let brokenLines = justify quad width $ makeLines width $ words ftext
    let numberedLines = [(fst zxs) ++ (nSpaces (5 - (length (fst zxs)))) ++ (snd zxs) | zxs <- (zip (map show [1..]) brokenLines)]
    -- needed to do debugLines to figure out the full justify algorithm
    let debugLines = [(length x, length ((unwords . words) x), length (words x), x) | x <- brokenLines]
    mapM_ print numberedLines

nSpaces :: Int -> [Char]
nSpaces n = concat (replicate n " ")
         
makeLines :: Int -> [[Char]] -> [[Char]]
makeLines width (x:xs)
    | null x = []
    | null xs = [x]
    | ((length x) + (length y)) < width = makeLines width $ [x ++ " " ++ y] ++ z
    | otherwise = [x] ++ makeLines width xs
        where y = head xs
              z = tail xs

justify :: Quad -> Int -> [[Char]] -> [[Char]]
justify quad width xs =
    case quad of
        QLeft -> map (\x -> x ++ nSpaces (width-length x)) xs
        QRight -> map (\x -> nSpaces (width-length x) ++ x) xs
        QFull -> do
                    w <- xs
                    let ws = words w
                    let (d, r) = divMod (width-length w) ((length ws)-1)
                    let w1 = take (r+1) ws
                    let w2 = drop (r+1) ws
                    case r of
                        0 -> return (intercalate (nSpaces (1+d)) ws)
                        _ -> return ((intercalate (nSpaces (2+d)) w1) ++ " " ++ (intercalate (nSpaces (1+d)) w2))
            
-- "Left Justify"
-- "1    Whan that Aprille with his shoures soote, The     "
-- "2    droghte of March hath perced to the roote, And    "
-- "3    bathed every veyne in swich licourOf which vertu  "
-- "4    engendred is the flour; Whan Zephirus eek with his"
-- "5    swete breeth Inspired hath in every holt and heeth"
-- "6    The tendre croppes, and the yonge sonne Hath in   "
-- "7    the Ram his halfe cours y-ronne, And smale foweles"
-- "8    maken melodye, That slepen al the nyght with open "
-- "9    ye, So priketh hem Nature in hir corages, Thanne  "
-- "10   longen folk to goon on pilgrimages, And palmeres  "
-- "11   for to seken straunge strondes, To ferne halwes,  "
-- "12   kowthe in sondry londes; And specially, from every"
-- "13   shires endeOf Engelond, to Caunterbury they wende,"
-- "14   The hooly blisful martir for to seke, That hem    "
-- "15   hath holpen whan that they were seeke.            "
-- ""
-- "Right Justify"
-- "1         Whan that Aprille with his shoures soote, The"
-- "2        droghte of March hath perced to the roote, And"
-- "3      bathed every veyne in swich licourOf which vertu"
-- "4    engendred is the flour; Whan Zephirus eek with his"
-- "5    swete breeth Inspired hath in every holt and heeth"
-- "6       The tendre croppes, and the yonge sonne Hath in"
-- "7    the Ram his halfe cours y-ronne, And smale foweles"
-- "8     maken melodye, That slepen al the nyght with open"
-- "9      ye, So priketh hem Nature in hir corages, Thanne"
-- "10     longen folk to goon on pilgrimages, And palmeres"
-- "11     for to seken straunge strondes, To ferne halwes,"
-- "12   kowthe in sondry londes; And specially, from every"
-- "13   shires endeOf Engelond, to Caunterbury they wende,"
-- "14       The hooly blisful martir for to seke, That hem"
-- "15               hath holpen whan that they were seeke."
-- ""
-- "Full Justify"
-- "1    Whan  that  Aprille  with  his  shoures soote, The"
-- "2    droghte  of  March  hath  perced to the roote, And"
-- "3    bathed  every  veyne in swich licourOf which vertu"
-- "4    engendred is the flour; Whan Zephirus eek with his"
-- "5    swete breeth Inspired hath in every holt and heeth"
-- "6    The  tendre  croppes,  and the yonge sonne Hath in"
-- "7    the Ram his halfe cours y-ronne, And smale foweles"
-- "8    maken  melodye, That slepen al the nyght with open"
-- "9    ye,  So  priketh hem Nature in hir corages, Thanne"
-- "10   longen  folk  to goon on pilgrimages, And palmeres"
-- "11   for  to  seken straunge strondes, To ferne halwes,"
-- "12   kowthe in sondry londes; And specially, from every"
-- "13   shires endeOf Engelond, to Caunterbury they wende,"
-- "14   The  hooly  blisful  martir  for to seke, That hem"
-- "15   hath   holpen   whan   that   they   were   seeke." 



