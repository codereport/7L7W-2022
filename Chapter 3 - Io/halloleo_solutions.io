// Only got to "Write a prototype for a two-dimensional list" of Day 2

// ------
"*** Day 1 ***" println
// ------

"--- Run a Io program from a file:" println
// io <file.io>

"--- Execute the code in a slot given its name:" println
myobject := Object clone
myobject addoneandone := method(1 + 1)
myobject addoneandone println

// ------
"*** Day 2 ***" println
// ------

"--- 1. Fibonacci via recursion" println
fib := method(n,
              if(n <= 0,
                 return 0,
                 if(n==1,
                    return 1,
                    fib(n-2) + fib(n-1)
                 )
              )
       )

fib(1) println
// out: 1
fib(4) println
// out: 3
fib(30) println
// out: 832040

"--- Fibonacci via loop" println
// (surprsingly simple!)
fib_loop := method(n,
               last := 0
               lastlast := 1
               for(i,1,n,
                   curr := last + lastlast
                   lastlast = last
                   last = curr
                   curr
               )
            )

fib_loop(1) println
// out: 1
fib_loop(4) println
// out: 3
fib_loop(30) println
// out: 832040

"--- 2. Change divison operator" println

Number normalDiv := Number getSlot("/")
Number zeroDiv := method(denom,
                         if(denom != 0,
                            self normalDiv(denom),
                            0
                         )
                  )
Number / := method(denom, self zeroDiv(denom))

(3 / 8) println
// out: 0.375
(3 / 0) println
// out: 0

"--- 3. Add up numers in 2d array" println

myarray := List clone
for(row, 1, 3,
    myarray append(Vector clone setSize(3) rangeFill)
    // Side note: I have no idea how else to fill a vector than bia rangeFill.
)
// myarray looks like this:
//      0 1 2
//      0 1 2
//      0 1 2

acc := 0
for(row, 1, myarray size,
    acc = acc + (myarray at(row-1) sum)
)

acc println
// out: 9

"--- 5. Write a prototype for a two-dimensional list" println

Matrix := List clone

Matrix dim := method(x,y,
                     for(r, 1, y,
                         self append(List clone setSize(x))
                     )
              )

Matrix set := method(x,y, value,
                     self at(y) atPut(x, value)
              )

Matrix get := method(x,y, value,
                     self at(y) at(x)
              )

Matrix show := method(for(r, 1, self size,
                          self at(r-1) println
                     )
              )

mymatrix := Matrix clone
mymatrix dim(3,5)
mymatrix set(1,3, 17)
mymatrix show
// out:
//    list(nil, nil, nil)
//    list(nil, nil, nil)
//    list(nil, nil, nil)
//    list(nil, nil, 17)
//    list(nil, nil, nil)

mymatrix get(1,4) println
// out: nil
mymatrix get(1,3) println
// out 17
