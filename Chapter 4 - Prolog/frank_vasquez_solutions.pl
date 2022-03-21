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
% mergesort solution by Roman Barták
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

% Day 3

% Modify the Sodoku solver to work on six-by-six puzzles (squares are 3x2)

sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Puzzle = [S11, S12, S13, S14, S15, S16,
              S21, S22, S23, S24, S25, S26,
              S31, S32, S33, S34, S35, S36,
              S41, S42, S43, S44, S45, S46,
              S51, S52, S53, S54, S55, S56,
              S61, S62, S63, S64, S65, S66],
    fd_domain(Puzzle, 1, 6),
    Row1 = [S11, S12, S13, S14, S15, S16],
    Row2 = [S21, S22, S23, S24, S25, S26],
    Row3 = [S31, S32, S33, S34, S35, S36],
    Row4 = [S41, S42, S43, S44, S45, S46],
    Row5 = [S51, S52, S53, S54, S55, S56],
    Row6 = [S61, S62, S63, S64, S65, S66],
    Col1 = [S11, S21, S31, S41, S51, S61],
    Col2 = [S12, S22, S32, S42, S52, S62],
    Col3 = [S13, S23, S33, S43, S53, S63],
    Col4 = [S14, S24, S34, S44, S54, S64],
    Col5 = [S15, S25, S35, S45, S55, S65],
    Col6 = [S16, S26, S36, S46, S56, S66],
    Square1 = [S11, S12, S13, S21, S22, S23],
    Square2 = [S14, S15, S16, S24, S25, S26],
    Square3 = [S31, S32, S33, S41, S42, S43],
    Square4 = [S34, S35, S36, S44, S45, S46],
    Square5 = [S51, S52, S53, S61, S62, S63],
    Square6 = [S54, S55, S56, S64, S65, S66],
    valid([Row1, Row2, Row3, Row4, Row5, Row6,
           Col1, Col2, Col3, Col4, Col5, Col6,
           Square1, Square2, Square3, Square4, Square5, Square6]).
valid([]).
valid([Head | Tail]) :- fd_all_different(Head), valid(Tail).

% | ?- sudoku([1, 5, 6, 2, 3, 4,
%              2, 3, 4, 1, 6, 5,
%              4, 2, _, _, _, _,
%              _, _, _, _, 2, 1,
%              6, 1, 2, 5, 4, 3,
%              3, 4, 5, 6, 1, 2],
%             What).

% What = [1,5,6,2,3,4,2,3,4,1,6,5,4,2,1,3,5,6,5,6,3,4,2,1,6,1,2,5,4,3,3,4,5,6,1,2]
% yes

% Solve the Eight Queens problem by taking a list of queens
% Rather than a tuple, represent each queen as an integer from 1 to 8
% Get the row of a queen by its position in the list
% Get the column of a queen by its value in the list

valid_queen(Col) :- member(Col, [1,2,3,4,5,6,7,8]).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

diags1(_, [], []).
diags1(Row, [Col|QueensTail], [Diagonal|DiagonalsTail]) :-
    Diagonal is Col - Row,
    diags1(Row + 1, QueensTail, DiagonalsTail).

diags2(_, [], []).
diags2(Row, [Col|QueensTail], [Diagonal|DiagonalsTail]) :-
    Diagonal is Col + Row,
    diags2(Row + 1, QueensTail, DiagonalsTail).

eight_queens(Board) :-
    length(Board, 8),
    valid_board(Board),

    diags1(1, Board, Diags1),
    diags2(1, Board, Diags2),

    fd_all_different(Board),
    fd_all_different(Diags1),
    fd_all_different(Diags2).

% | ?- eight_queens([A,B,C,D,E,F,G,H]).

% A = 1
% B = 5
% C = 8
% D = 6
% E = 3
% F = 7
% G = 2
% H = 4 ?
