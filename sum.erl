-module(sum).
-export([average/1 , sum/1]).

average(List) -> average_acc(List, 0, 0).

average_acc([], Sum, Lenght) -> Sum / Lenght;
average_acc([Head | Tail], Sum, Lenght) -> average_acc ( Tail, Sum + Head, Lenght +1).

sum(N) -> sum_to(N, Sum).

sum_to(N,Sum) when N > 0 -> sum_to(N - 1, Sum + N);
sum_to(N,Sum) -> Sum.