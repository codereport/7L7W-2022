;; Using https://tryclojure.org/

;; Day 1
=>(println "Give me some Clojure!")
Give me some Clojure!
nil
=>(- 1)
-1
=>(+ 1 1)
2
=>(/ 1 3)
0.3333333333333333
=>(/ 2 4)
0.5
=>(/ 2.0 4)
0.5
=>(class (/ 1 3))
Could not resolve symbol: class
=>(mod 5 4)
1
=>(+ 2 2 2 2)
8
=>(< 1 2 3)
true
=>(< 1 3 2 4)
false
=>(println "master yoda\nluke skywalker\ndarth vader")
master yoda
luke skywalker
darth vader
nil
=>(str 1)
"1"
=>(str \f \o \r \c \e)
"force"
=>(list 1 2 3)
(1 2 3)
=>'(1 2 3)
(1 2 3)
=>(first '(1 2 3))
1
=>(last '(1 2 3))
3
=>(rest '(1 2 3))
(2 3)
=>[1 2 3]
[1 2 3]
=>(first [1 2 3])
1
=>(nth [1 2 3 4] 2)
3
=>([1 2 3 4] 2)
3
=>#{1 2 3}
#{1 2 3}
=>(def iota10 #{1 2 3 4 5 6 7 8 9 10})
#'user/iota10
=>(count iota10)
10
=>(sort iota10)
(1 2 3 4 5 6 7 8 9 10)
=>{1 2 3 4 5 6}
{1 2, 3 4, 5 6}
=>(def iota6 {1 2 3 4 5 6})
#'user/iota6
=>(iota6 1)
2
=>(iota6 2)
nil
=>(doc str)
-------------------------
clojure.core/str
([] [x] [x & ys])
With no args, returns the empty string. With one arg x, returns x.toString(). (str nil) returns the empty string. With more than one arg, returns the concatenation of the str values of the args.
nil
=>(map #(* 2 %) '(1 2 3))
(2 4 6)
=>(filter odd? '(1 2 3 4 5))
(1 3 5)

;; Day 2

=>(every?     odd? '(1 2 3 4))
false
=>(some       odd? '(1 2 3 4))
true
=>(not-every? odd? '(1 2 3))
true
=>(not-any?   odd? '(1 2 3))
false
