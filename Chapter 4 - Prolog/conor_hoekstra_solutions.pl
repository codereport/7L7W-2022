% Day 1

pl_paradigm(apl, array).
pl_paradigm(bqn, array).
pl_paradigm(haskell, functional).
pl_paradigm(clojure, functional).
pl_paradigm(cpp, multiparadigm).

pl_typing(apl, dynamic).
pl_typing(bqn, dynamic).
pl_typing(haskell, static).
pl_typing(clojure, dynamic).
pl_typing(cpp, static).

pl_author(apl, ken_iverson).
pl_author(bqn, marshall_lochbaum).
pl_author(haskell, simon_peyton_jones).
pl_author(clojure, rich_hickey).
pl_author(cpp, bjarne_stroustrup).

% | ?- pl_typing(What, dynamic).

% What = apl ? ;
% What = bqn ? ;
% What = clojure ? ;
% no

% | ?- pl_paradigm(What, array).

% What = apl ? ;
% What = bqn ? ;
% no

% Day 2

% 1. Reverse a list

rev([], []).
rev([H|T], RevList) :- revHelper(T, [H], RevList).
revHelper([], Acc, Acc).
revHelper([H|T], Acc, RevList) :- revHelper(T, [H|Acc], RevList).

% | ?- reverse([1,2,3],What).

% What = [3,2,1]
% yes
% | ?- reverse([],What).

% What = []
% yes

% 2. Find minimum

minimum([H|T], Min) :- minimumHelper(T, H, Min).
minimumHelper([], Acc, Acc).
minimumHelper([H|T], Acc, Min) :- (H <  Acc, minimumHelper(T, H,   Min);
                                   H >= Acc, minimumHelper(T, Acc, Min)).

% | ?- minimum([1,2,3], What).

% What = 1
% yes

% | ?- minimum([1729,42,55], What).

% What = 42 ? ;
% no

% 3. Sort

isSorted([]).
isSorted([_]).
isSorted([X,Y|T]) :-
    X=<Y,
    isSorted([Y|T]).

mySort(List, SortedList) :-
    permutation(List, SortedList),
    isSorted(SortedList).

% | ?- mySort([2,1], What).
% What = [1,2] ? ;
% no

% | ?- mySort([3,2,1], What).
% What = [1,2,3] ? ;
% no

% | ?- mySort([3,2,1,3], What).
% What = [1,2,3,3] ? ;
% What = [1,2,3,3] ? ;
% no

% | ?- mySort([5,4,7,8,10,2,4,1,3], What).
% What = [1,2,3,4,4,5,7,8,10] ? ;
% What = [1,2,3,4,4,5,7,8,10] ? ;
% (167 ms) no

% Day 3

% 9x9 sudoku

% No thanks.
