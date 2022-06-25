-- Day 1

Prelude> 4 + 1
5
Prelude> 4 + 1.0
5.0
Prelude> 4 + 2 * 5
14
Prelude> :t (+)
(+) :: Num a => a -> a -> a
Prelude> :i (+)
class Num a where
  (+) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 6 +
Prelude> :i (*)
class Num a where
  ...
  (*) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 7 *
Prelude> "hello"
"hello"
Prelude> "hello" ++ " world"
"hello world"
Prelude> 5 / 2
2.5
Prelude> 4 / 2
2.0
Prelude> if (2 + 2 == 4) then "true" else "false"
"true"
Prelude> "one" + 1

<interactive>:12:1: error:
    • No instance for (Num [Char]) arising from a use of ‘+’
    • In the expression: "one" + 1
      In an equation for ‘it’: it = "one" + 1
Prelude> :set +t
Prelude> 5
5
it :: Num p => p
Prelude> 5.0
5.0
it :: Fractional p => p
Prelude> True
True
it :: Bool
Prelude> let double x = x * 2
double :: Num a => a -> a
Prelude> double 10
20
it :: Num a => a
Prelude> let double1 = (2*)
double1 :: Num a => a -> a
Prelude> double1 10
20
it :: Num a => a
Prelude> import Control.Monad
Prelude Control.Monad> let double2 = join (+)
double2 :: Num a => a -> a

-- double 2 ways

double x = 2 * x
double   = (2*)
double   = join (+)

Prelude Control.Monad> let second = head . tail
second :: [c] -> c
Prelude Control.Monad> let second lst = head (tail lst)
second :: [a] -> a

-- Day 2

-- Day 3
