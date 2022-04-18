
indices = [[0,1,2],[3,4,5],[6,7,8], -- rows
           [0,3,6],[1,4,7],[2,5,8], -- columns
           [0,4,8],[2,4,6]]         -- diagonals

allEqualTo e = and . map (==e)

collect is = map snd 
           . filter ((flip elem) is . fst) 
           . zipWith (,) [0..]

winner board xo = or 
                . map (allEqualTo xo . (flip collect) board) 
                $ indices

ticTacToeStatus board 
   | winner board 'X' = "X wins"
   | winner board 'O' = "O wins"
   | otherwise        = "No winner yet"
