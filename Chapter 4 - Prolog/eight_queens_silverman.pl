#!/usr/bin/env gprolog                     
/* Core algorigithm below copied from http://academickids.com/encyclopedia/index.php/8_queens.
   It makes use of more of finite domain constrain modeling than Seven Languages book.
                                           
   ------ Digression about Minizinc ------------
   Minizinc is a constraint modeling language that can connect to a variety of search
   algorithm backends and can interface to C++, Java, python, R, etc.
                                           
    see: https://www.minizinc.org/software.html
    and: https://www.minizinc.org/doc-2.5.5/en/mzn_search.html
    and: https://www.minizinc.org/challenge.html
                                           
    int: n;                                
    array [1..n] of var 1..n: q; % queen in column i is in row q[i]
                                           
    include "alldifferent.mzn";            

    constraint alldifferent(q);                       % distinct rows
    constraint alldifferent([ q[i] + i | i in 1..n]); % distinct diagonals
    constraint alldifferent([ q[i] - i | i in 1..n]); % upwards+downwards

    % search
    solve :: int_search(q, first_fail, indomain_min)
        satisfy;
    output [ if fix(q[j]) == i then "Q" else "." endif ++
            if j == n then "\n" else "" endif | i,j in 1..n]
    -------- end digression ----------------


/* Generate a list which represents a single solution
   with the specified length and ensures that the list has each value
   from 1 to N once and only once.

   The "variable_method(random)" greatly improves the solution speed,
   for example solving for 100 queens just stalls with default labeling,
   and produces a solution almost instantly with the random search. */
nqueens(QueensList,N) :- length(QueensList,N),
               fd_domain(QueensList,1,N),
               fd_all_different(QueensList),
               constraint_queens(QueensList),
               fd_labeling(QueensList, [variable_method(random)]).

/* Ensure that all positions are valid */
constraint_queens([]).
constraint_queens([X|Xs]) :- noattack(X,Xs,1), constraint_queens(Xs).

/* Ensures that no queens share diagonaQueensList */
noattack(_,[],_).
noattack(X,[Y|Xs],N) :- X#\=Y+N, X#\=Y-N, T#=N+1, noattack(X,Xs,T).

/* Count the number of solutions, works on my computer up to 13 queens,
   stack overflow, 32 Mb for 14 queens. */
num_nqueens(N, NumSolutions) :-
    findall(QueensList, nqueens(QueensList, N), AllSols),
    length(AllSols,NumSolutions).

