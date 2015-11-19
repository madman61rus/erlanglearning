% sum/1 - Function for adding the numbers from 1 to N
% sum/2 - Function for adding the numbers between N and M
-module(summarize).
-export([sum/1, sum/2]).

sum (N) -> sum_to (N,0).
sum (N,M) when N =< M -> sum_two (N,M,0);
sum (N,M) when N > M -> throw ({'error'}).

sum_to (N,Sum) when N == 0 -> Sum ; 
sum_to (N,Sum)  -> sum_to ( N - 1, Sum + N ).

%sum_two (N,M,Sum) when N > M -> 1;
sum_two (N,M,Sum) when N =< M -> sum_two (N + 1,M, Sum + N);
sum_two (_,_,Sum) -> Sum .