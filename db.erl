-module(db).
-export([new/0, write/3, read/2, match/2, delete/2]).

new() -> [].
write (Name,City,Db) -> [ {Name,City} | Db].

read (Name, [Head | Tail]) -> 
	{N,_} = Head,
	case N == Name of
		true -> Head ;
		false -> read (Name, Tail)
	end;

read (_,[]) -> throw ({error,instance}).

match ( City , Db) -> match_pr (City,[],Db).

match_pr (City, Result, [Head | Tail]) ->
	{N,C} = Head,
	case C == City of 
		true -> match_pr (City, [ N | Result], Tail);
		false -> match_pr (City, Result, Tail)
	end;

match_pr (_,[],_) -> throw ({error,'Not_matching'});
match_pr (_,Result,[]) -> Result.

% Delete a record in database

delete (Key, Db) -> delete_pr (Key, Db, []).

delete_pr (Key, [Head | Tail], Result) ->
	{N,_} = Head,
	case N == Key of 
		true -> delete_pr (Key, Tail, Result);
		false -> delete_pr (Key, Tail, [ Head | Result])
	end;

delete_pr (_,_,Result) -> Result;
delete_pr (_,_,[]) -> throw ({error,'Not matching for delete'}).

