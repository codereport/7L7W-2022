-module(daytwo).
-export([finditem/2, shoppinglist/1]).

first_([]) -> "";
first_([H|_]) -> H.

finditem(Item, Items) -> first_([V || {K, V} <- Items, K == Item]).

shoppinglist(Items) -> [{I, Q * P} || {I, Q, P} <- Items].

