-module(basic).
-export([mirror/1]).
-export([fact/1]).

% Day 1

mirror(Anything) -> Anything.

fact(0) -> 1;
fact(N) -> N * fact(N-1).
