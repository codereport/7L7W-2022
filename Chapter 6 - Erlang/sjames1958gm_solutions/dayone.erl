-module(dayone).
-export([wordcount/1, counttoten/0, result/1]).

count("", Count) -> Count;
count([_|[]], Count) -> Count + 1;
count([_|T], Count) -> count(string:split(T, " "), Count + 1).
wordcount("") -> 0;
wordcount(S) -> count(string:split(S, " "), 0).

counttoten_(10) -> 10;
counttoten_(N) -> counttoten_(N + 1).
counttoten() -> counttoten_(1).

result(success) -> "success";
result({error, Message}) -> Message.
