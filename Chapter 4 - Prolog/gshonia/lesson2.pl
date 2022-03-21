reverse2([],[]).
reverse2([A],[A]).
reverse2([A,B],[B,A]).
reverse2([Head|Tail],R) :- reverse2(Tail,Z), append(Z,[Head],R).
% for some reason output from above twice

count2(0, []).
count2(Count, [Head|Tail]) :- count2(TailCount, Tail), Count is TailCount + 1.

sum2(0, []).
sum2(Total, [Head|Tail]) :- sum2(Sum, Tail), Total is Head + Sum.

average2(Average, List) :- sum2(Sum, List), count2(Count, List), Average is Sum/Count.

min2([A],M) :- M=A. % messes up general case with inf recursion
min2([A,B],M) :- A<B, M=A.
min2([A,B],M) :- A>B, M=B.
min2([Head|Tail],M) :- count2(C,Tail), C>1, min2(Tail,T), min2([Head,T],M). 

ascending2([A]).
ascending2([Head|Tail]) :- min2(Tail,M), Head =< M, ascending2(Tail).

belongs2(A,[B]) :- A=B.
belongs2(A,[Head|Tail]) :- A=Head.
belongs2(A,[Head|Tail]) :- belongs2(A,Tail).

containedIn([],B).
containedIn([Head|Tail],B) :- belongs2(Head,B), subtract(B,[Head],R), containedIn(Tail,R).

sort2(A,S) :- containedIn(S,A), containedIn(A,S), ascending2(S).
