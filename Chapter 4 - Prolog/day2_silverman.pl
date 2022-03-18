% Day 2 assignments: reverse list, find smallest element in list, sort list

% Took me a while to realize that list head is not a list and has to be
% enclosed in brackets. Strange things happened when it wasn't in brackets.

reverselist(L, L) :- length(L,1).
reverselist([H|T], R) :- append(RT,[H],R), reverselist(RT,T).

minimumlist(L, M) :- length(L,1), M is L.
minimumlist([H1|[H2|T]], M) :-
    H1 >= H2 -> minimumlist([H2|T], M);
    minimumlist([H1|T], M).

% This a very inefficient sort algorithm, also order of clauses matters.
% sortlist needs to be the final clause.
% subtract(List1, List2, List3) removes all elements in List2 from List1 to provide List3.
sortlist([], []).
sortlist(L, SL) :- minimumlist(L, M),
                   subtract(L, [M], NL),
                   append([M], NL2, SL),
                   sortlist(NL, NL2).
