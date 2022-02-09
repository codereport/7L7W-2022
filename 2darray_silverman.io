#!/usr/bin/env io

// 2d array function
XY := List clone do(
    dim := method(x, y,
        XY := List clone
        for(_,1,y,XY append(List clone setSize(x)))
        copy(XY)
    )
    set := method(x, y, n,
        self at(y) atPut(x,n)
    )
    get := method(x, y,
        self at(y) at(x)
    )
    sum := method(
        self flatten sum
    )
)

newXY := XY clone
w := 5
h := 4
newXY dim(w,h)
writeln("newXY ", newXY)
for(i, 0, w-1,
    for(j, 0, h-1,
        newXY set(i,j,i+(j*w))
    )
)
writeln("newXY ", newXY)
writeln("newXY sum ", newXY sum)