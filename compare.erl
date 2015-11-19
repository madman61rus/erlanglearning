-module(compare).
-export([filter/2, reverse/1, concatenate/1]).


% A function filter/2 return all numbers, that less or equal of Number

filter (Array,Number) -> filter_pr (Array,Number,[]).

filter_pr ([Head | Tail], Number, Result) ->
	if (Head =< Number) -> filter_pr (Tail, Number, [ Head | Result]);
		true -> filter_pr (Tail, Number, Result)
	end;
	

filter_pr ([],_,Result) -> lists:reverse(Result) .


% A function reverse/1 return reversed list

reverse (List) -> lists:reverse(List).

% A function concatenate/1 return simple list from list of lists

concatenate (List) -> concatenate_pr (List,[]).

concatenate_pr ([Head | Tail], []) -> 
	Lst = concatenate_inner (Head,[]),
    concatenate_pr (Tail,Lst);

concatenate_pr ([Head | Tail], Result) -> 
	Lst = concatenate_inner (Head, Result),
    concatenate_pr (Tail,Lst);

concatenate_pr (_,Result) -> lists:reverse(Result).

concatenate_inner ([Head | Tail], Result) -> concatenate_inner (Tail, [Head | Result]);
concatenate_inner (_,Result) -> Result .