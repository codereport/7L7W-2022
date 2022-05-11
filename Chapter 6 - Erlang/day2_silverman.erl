-module(day2_silverman).
-export([day2/0]).

getval(List, Key) ->
    maps:get(Key, maps:from_list(List), "Default Value").

shoplist(List) ->
    [{Item, Quantity*Price} || {Item, Quantity, Price} <- List].

printboard(Board) ->
    XYB = dict:from_list([{1, 'X'}, {-1, 'O'}, {0, '_'}]),
    Boardshow = [[dict:fetch(K1, XYB), dict:fetch(K2, XYB), dict:fetch(K3, XYB)] || [K1, K2, K3] <- Board],
    lists:foreach(fun(Row) -> io:format("~w~n", [Row]) end, Boardshow).

transpose([[]|_]) -> [];
transpose(M) ->
  [lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].

diags(List) ->
    [[lists:nth(I,lists:nth(I,List)) || I <- lists:seq(1,length(List))],
    [lists:nth(I,lists:nth(length(List) - I + 1,List)) || I <- lists:seq(1,length(List))]].

win(Board)->
    Winner = [lists:sum(R) || R <- Board ++ transpose(Board) ++ diags(Board), abs(lists:sum(R)) == 3],
    Available = lists:any(fun(E) -> E == true end, [lists:member(0,R) || R  <- Board]),
    case Winner of
      [3]  ->  W = 'X';
      [-3] ->  W = 'O';
      []   ->   if Available ->
                    W = 'no_winner';
                true ->
                    W = 'cat'
                end
    end,
    W.

day2() ->
    Langs = [ { erlang , "a functional language" } ,
              { ruby , "an OO language" } ,
              { apl , "an array language" } ,
              { prolog , "a logic language" } ,
              { brainfk , "an esolang" } ],
    io:format("~p ~n", [getval(Langs, brainfk)]),

    Shoplist = [{grape, 5, 10}, {banana, 3, 200}, {pear, 150, 1}],
    lists:foreach(fun(X) -> io:format("~p~n", [X]) end, shoplist(Shoplist)),

    Board = [[1, 1, -1], [-1, 1, 1], [1, -1, -1]],
    printboard(Board),
    io:format("Winner? ~w~n",[win(Board)]),

    Board2 = [[1, 1, -1], [-1, 1, 1], [1, -1, 1]],
    printboard(Board2),
    io:format("Winner? ~w~n",[win(Board2)]).
