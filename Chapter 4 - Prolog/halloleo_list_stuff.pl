% Reverse list
rev([],[]).
rev([H1|T1], L) :- append(T2, [H1], L), rev(T1, T2).

% Smallest element of list
minOfList([A], A).
minOfList([H|T], M) :- minOfList(T, E2), M is min(H, E2).
