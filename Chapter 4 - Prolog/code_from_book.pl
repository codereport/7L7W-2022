% Day 1

likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

% | ?- likes(wallace,sheep).

% no
% | ?- likes(grommit,cheese).

% yes
% | ?- friend(wallace,wallace).

% no

food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).

% | ?- food_type(What,meat).

% What = spam ? ;

% What = sausage ? ;

% no

different(red, green). different(red, blue).
different(green, red). different(green, blue).
different(blue, red). different(blue, green).

coloring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
  different(Mississippi, Tennessee),
  different(Mississippi, Alabama),
  different(Alabama, Tennessee),
  different(Alabama, Mississippi),
  different(Alabama, Georgia),
  different(Alabama, Florida),
  different(Georgia, Florida),
  different(Georgia, Tennessee).

% | ?- coloring(Alabama, Mississippi, Georgia, Tennessee, Florida).

% Alabama     = blue
% Florida     = green
% Georgia     = red
% Mississippi = red
% Tennessee   = green ?

% Day 2

count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/Count.

% | ?- count(What, [1]).

% What = 1 ? ;
% no

% | ?- sum(What, [1,2,3]).

% What = 6 ? ;
% (1 ms) no

% | ?- average(What, [1,2,3,4]).

% What = 2.5 ? ;
% no
