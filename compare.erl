-module(compare).
-export([filter/2, reverse/1, concatenate/1, flatten/1]).


% A function filter/2 returns all numbers, that less or equal of Number

filter (Array,Number) -> filter (Array,Number,[]).

filter ([Head | Tail], Number, Result) ->
	if (Head =< Number) -> filter (Tail, Number, [ Head | Result]);
		true -> filter (Tail, Number, Result)
	end;
	

filter ([],_,Result) -> lists:reverse(Result) .


% A function reverse/1 returns reversed list

reverse (List) -> lists:reverse(List).

% A function concatenate/1 returns a simple list from list of lists

concatenate (List) -> concatenate (List,[]).

concatenate ([], Result) -> lists:reverse(Result);
concatenate ([Head | Tail],Result) ->
	Lst = concatenate_inner (Head,Result),
	concatenate (Tail,Lst).

concatenate_inner ([Head | Tail], Result) -> concatenate_inner (Tail, [Head | Result]);
concatenate_inner ([],Result) -> Result.


% A function flatten/1 returns a simple list from list of lists

flatten (List) -> flatten(List, []).

flatten ([],Result) -> lists:reverse(Result);

flatten ([Head | Tail], Result) -> 
	case is_list (Head) of 
		true -> flatten ( Head, Result);
		false -> flatten (Tail,[Head | Result])
	end.
