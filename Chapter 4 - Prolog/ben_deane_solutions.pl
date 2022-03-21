% Day 2

% reverse and sort are builtins in GNU Prolog

% from the text
cat([], List, List).
cat([H|T1], List, [H|T2]) :- cat(T1, List, T2).

% reverse a list
rev([], []).
rev([H|T], List) :- rev(T, Rest),
                    cat(Rest, [H], List).

% find the smallest element in a list
smallest([E], E).
smallest([A, B|T], E) :- A =< B, smallest([A|T], E);
                         B < A, smallest([B|T], E).

% sort a list (method 1)
selectionsort([], []).
selectionsort(List, [H|T]) :- smallest(List, H),
                              cat(Left, [H|Right],  List),
                              cat(Left, Right, Rest),
                              selectionsort(Rest, T).

% sort a list (method 2)
partition([], _, [], []).
partition([H|T], P, [H|Left], Right) :- H =< P, partition(T, P, Left, Right).
partition([H|T], P, Left, [H|Right]) :- H > P, partition(T, P, Left, Right).

quicksort([], []).
quicksort([H|T], List) :- partition(T, H, Left, Right),
                          quicksort(Left, L),
                          quicksort(Right, R),
                          cat(L, [H|R], List).
