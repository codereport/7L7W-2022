
List2D := List clone do(
    rows ::= 0 // adds setRows slot
    cols ::= 0 // adds setCols slot

    dim := method(x, y, 
        rows = x
        cols = y
        List2D := List clone
        for (_, 1, y, List2D append(List clone setSize(x)))
        copy(List2D) # this is important :/
    )

    iotaFill := method(
        val := 1
        for (i, 0, self rows - 1,
            for (j, 0, self cols - 1, 
                self at(i) atPut(j, val)
                val = val + 1
            )
        )
        self
    )

    sum := method(
        // super slow
        self flatten sum
    )

    sum2 := method(
        res := 0
        for (i, 0, self rows - 1,
            for (j, 0, self cols - 1, 
                res = res + self at(i) at(j)
            )
        )
        res
    )

    psum := method(
        tempValues := List clone setSize(self rows)
        for (i, 0, self rows - 1,
            tempValues atPut(i, self at(i) @sum)
        ) 
        tempValues sum
    )

    println := method(
        for (i, 0, self rows - 1,
            for (j, 0, self cols - 1, 
                self at(i) at(j) print
                " " print
            )
            "" println
        )
    )
)

matrix := List2D clone dim(3, 3) iotaFill
matrix println
// 1 2 3 
// 4 5 6 
// 7 8 9 

// 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.

List2D transpose := method(
    List2D := List clone
    for (col, 0, self cols - 1, List2D append(self map(row, row at(col))))
    copy(List2D)
)

matrix transpose println
// 1 4 7 
// 2 5 8 
// 3 6 9 

Date now
largeMatrix := List2D clone dim(50, 50) iotaFill
"Time to init matrix: " print
Date secondsSinceNow println

// Date now
// "Sum is: " print
// largeMatrix sum println
// "Time to sum matrix: " print
// Date secondsSinceNow println

Date now
"Sum2 is: " print
largeMatrix sum2 println
"Time to sum2 matrix: " print
Date secondsSinceNow println

Date now
"Parallel Sum is: " print
largeMatrix psum println
"Time to psum matrix: " print
Date secondsSinceNow println