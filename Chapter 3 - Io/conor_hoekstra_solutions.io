// Day 1

// 1. Run an Io program from a file.

// io conor_hoekstra_solutions.io

// Conor says
// APL is my favorite language!

// 2. Execute the code in a slot given its name

Person := Object clone
conor := Person clone
conor speak := method("APL is my favorite language!" println)
"Conor says" println 
conor speak

// Day 2 

// 1. A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

Number fib ::= method(if (self <= 2, 1, (self - 1) fib + (self - 2) fib))

// Test
"First 10 fibonacci numbers:" println
for (i, 1, 10, i fib println)

// 2. How would you change / to return 0 if the denominator is zero?

// TODO

// 3. Write a program to add up all of the numbers in a two-dimensionalarray.

List sum2DArray := method(self flatten sum)

// Test
matrix := list(list(1,2,3), list(4,5,6), list(7,8,9))
"Matrix sum: " print; matrix sum2DArray println

// 4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not // a number.)

List myAverage := method((self sum) / (self size))

// Test
l := list(1,2,3,4)
"Average: " print; l myAverage println

// 5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.

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

// 7. Write the matrix to a file, and read a matrix from a file.

// Skip

// 8. Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.

Number iota   := method(l := list(); for (i, 1, self, l append(i)); l)
Number random := method(self iota anyOne)

// ^^^ anyOne does not exist
// Io Programming Language, v. 20170906 ???

Number fakeRandom := method(42)

Game := Object clone
Game play := method(
    targetValue := 100 fakeRandom
    guessNo := 1
    lastGuess := 0
    found := false
    while (guessNo <= 10 and found not, 
        "Guess a number between 1 and 100: " print
        guess := File standardInput readLine asNumber
        if (guess == targetValue, 
            found = true; "You found it!" println,
            "Nope, not it! " println
            if (lastGuess == 0, 
                lastGuess = guess, 
                lastDiff := (targetValue - lastGuess) abs
                currDiff := (targetValue - guess) abs
                if (currDiff < lastDiff, "But you are warmer.", "And you are colder.") println
                lastGuess = guess
            )
        )
        guessNo = guessNo + 1
    )
)

Game play
