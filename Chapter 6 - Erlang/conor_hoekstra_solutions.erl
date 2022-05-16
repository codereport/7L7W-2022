
-module(hw).
-export([count_to_ten/0]).
-export([count_words/1]).
-export([sum/1, listener/0, queuer/2, parallel_sum/2, iota/1, chunk/2]).

% Day 1

% 1. Write a function that uses recursion to return the number of words in a string.

mylength([])    -> 0;
mylength([_|T]) -> 1 + mylength(T). 

count_words([]) -> 0;
count_words(Str) -> mylength(re:split(Str, " ")).

% Test:

% > hw:count_words("Hello World").
% 2

% 2. Write a function that uses recursion to count to ten.

count_to(N, N) -> N;
count_to(X, N) -> io:fwrite("~w~n", [X]), count_to(X + 1, N).

count_to_ten() -> count_to(0, 10).

% Test:

% 15> hw:count_to_ten().
% 0
% 1
% 2
% 3
% 4
% 5
% 6
% 7
% 8
% 9
% 10

% 3. Write a function that uses matching to selectively print “success” or “error: message” given input of the form {error, Message} or success .

% Skip.

% Day 2

% 1. Consider a list of keyword-value tuples, such as 
% [{erlang, "a functional language"}, {ruby, "an OO language"}]. 
% Write a function that accepts the list and a keyword and returns 
% the associated value for the keyword.

% KeywordValue = fun(KV, K) -> [ Value || {Key, Value} <- KV, Key == K ] end.

% Tests

% > KeywordValue(List, erlang).                                                           
% ["a functional language"]
% > KeywordValue(List, ruby).  
% ["an OO language"]

% 2. Consider a shopping list that looks like [{item quantity price}, ...]
% Write a list comprehension that builds a list of items of the form 
% [{item total_price}, ...] , where total_price is quantity times price.

% TotalPrices = fun(List) -> [ {I, Q * P} || {I, P, Q} <- List ] end. 

% Test

% > GroceryList = [{apple, 10, 0.25}, {orange, 5, 0.3}, {donut, 3, 1.10}].
% [{apple,10,0.25},{orange,5,0.3},{donut,3,1.1}]
% > TotalPrices(GroceryList).
% [{apple,2.5},{orange,1.5},{donut,3.3000000000000003}]

% 3. (Bonus) Write a program that reads a tic-tac-toe board presented as a list or a tuple of size nine. Return the winner ( x or o ) if a winner has been determined, cat if there are no more possible moves, or no_winner if no player has won yet.

% Skip

% Day 3

% Try to write a parallel sum.

sum([]) -> 0;
sum([H|T]) -> H + sum(T).

listener() -> 
    receive
        {From, List} -> 
            io:fwrite("Summing on process id: ~w~n", [self()]),
            From ! sum(List)
    end.

queuer(To, List) -> 
    To ! {self(), List},
    receive
        Result -> Result
    end.

% iota
iota(N) -> iota_helper(N, []).

iota_helper(0, L) -> L;
iota_helper(N, L) -> iota_helper(N-1, [N|L]).

% chunk
chunk(List, N) -> 
    ChunkSize = ceil(length(List) / N),
    Starts = [ (X - 1) * ChunkSize + 1 || X <- lists:seq(1,N) ],
    [ lists:sublist(List, Start, ChunkSize) || Start <- Starts ].

% lol

% 21> hw:chunk(hw:iota(100), 5).
% [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
%  [21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
%   40],
%  ")*+,-./0123456789:;<","=>?@ABCDEFGHIJKLMNOP",
%  "QRSTUVWXYZ[\\]^_`abcd"]


parallel_sum(List, N) ->
    Ls = [ spawn(fun hw:listener/0) || _ <- hw:iota(N) ],
    sum(lists:zipwith(fun hw:queuer/2, Ls, hw:chunk(List, N))).

% Test

% 14> hw:parallel_sum(hw:iota(1000), 10).
% Summing on process id: <0.190.0>
% Summing on process id: <0.191.0>
% Summing on process id: <0.192.0>
% Summing on process id: <0.193.0>
% Summing on process id: <0.194.0>
% Summing on process id: <0.195.0>
% Summing on process id: <0.196.0>
% Summing on process id: <0.197.0>
% Summing on process id: <0.198.0>
% Summing on process id: <0.199.0>
% 500500
