% Day 1

book_author(the_recognitions, william_gaddis).
book_author(times_arrow, martin_amis).
book_author(the_information, martin_amis).
book_author(gravitys_rainbow, thomas_pynchon).
book_author(the_crying_of_lot_49, thomas_pynchon).
book_author(you_bright_and_risen_angels, william_t_vollmann).
book_author(the_new_york_trilogy, paul_auster).
book_author(the_information, paul_auster).
book_author(white_noise, don_delillo).

% | ?- book_author(What, paul_auster).

% What = the_new_york_trilogy ? ;
% What = the_information ? ;
% no

musician_instrument(billie_holiday, vocals).
musician_instrument(john_coltrane, saxophone).
musician_instrument(art_blakey, drums).
musician_instrument(dave_grohl, drums).
musician_instrument(carol_kaye, bass_guitar).
musician_instrument(keith_richards, guitar).
musician_instrument(robert_johnson, guitar).
musician_instrument(sonny_terry, harmonica).

musician_genre(billie_holiday, jazz).
musician_genre(john_coltrane, jazz).
musician_genre(art_blakey, jazz).
musician_genre(dave_grohl, rock).
musician_genre(carol_kaye, rock).
musician_genre(keith_richards, rock).
musician_genre(robert_johnson, blues).
musician_genre(sonny_terry, blues).

% | ?- musician_instrument(What, guitar).

% What = keith_richards ? ;
% What = robert_johnson ? ;
% no

% | ?- musician_genre(What, rock).

% What = dave_grohl ? ;
% What = carol_kaye ? ;
% What = keith_richards ? ;
% no

% Day 2

% Reverse the elements of a list

rev(List, Reversed) :- revrec(List, [], Reversed).
revrec([], Acc, Acc).
revrec([Head|Tail], Acc, Reversed) :- revrec(Tail, [Head|Acc], Reversed).

% | ?- rev([1,2,3,4,5], What).  

% What = [5,4,3,2,1]
% yes

% | ?- rev([], What).

% What = []
% yes

% Find the smallest element of a list

minimum([Head|Tail], Min) :- minrec(Tail, Head, Min).
minrec([], Acc, Acc).
minrec([Head|Tail], Acc, Min) :- (
    Head < Acc, minrec(Tail, Head, Min);
    Head >= Acc, minrec(Tail, Acc, Min)
).

% | ?- minimum([7,5,9,3,1], What).

% What = 1 ? ;
% no

% | ?- minimum([2022, 1974, 1776, 1849, 3030], What).

% What = 1776 ? ;
% no

% Sort the elements of a list
% http://kti.mff.cuni.cz/~bartak/prolog/sorting.html

mergesort([], []).
mergesort([X], [X]).
mergesort(List, Sorted) :-
    List = [_, _|_], divide(List, L1, L2),
	mergesort(L1, Sorted1), mergesort(L2, Sorted2),
	merge(Sorted1, Sorted2, Sorted).
divide([], [], []).
divide([X], [X], []).
divide([X,Y|T], [X|L1], [Y|L2]) :- divide(T, L1, L2).
merge([], L, L).
merge(L, [], L) :- L \= [].
merge([X|T1], [Y|T2], [X|T]) :- X =< Y, merge(T1, [Y|T2], T).
merge([X|T1], [Y|T2], [Y|T]) :- X > Y, merge([X|T1], T2, T).

% | ?- mergesort([2,7,6,4,3,5,9,1,8], What).

% What = [1,2,3,4,5,6,7,8,9] ? ;
% no
