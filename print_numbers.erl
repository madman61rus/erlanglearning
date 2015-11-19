% A function print_numbers/1 return numbers from 1 to N
% A function print_odds/1 return odd numbers from 1 to N

-module(print_numbers).
-export([print_numbers/1,print_odds/1]).

print_numbers (N) -> prt_numbers (N,1).
print_odds (N) -> prt_odds (N,1).

prt_numbers (N,Count) when Count < N -> 
	io:format("Number: ~p~n",[Count]),
	prt_numbers (N, Count + 1);

prt_numbers (N,_) -> io:format("Number: ~p~n",[N]).

prt_odds (N,Count) when (Count =< N) ->
    case ((Count rem 2) > 0) of
    	true -> io:format("Number: ~p~n",[Count]);
    	false -> ok
    end,
	prt_odds(N, Count + 1);

prt_odds (_,_) -> ok .