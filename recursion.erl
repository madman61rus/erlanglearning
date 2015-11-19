-module(recursion).
-export([even_tail/2, even/2]).

even_tail([], Newarray) -> lists:reverse(Newarray);
even_tail([Head | Tail], Newarray ) when Head rem 2 == 0 -> 
		even( Tail , [Head | Newarray]);
even_tail([Head | Tail], Newarray ) when Head rem 2 > 0 ->
		even( Tail , Newarray).


even([], Newarray) -> lists:reverse(Newarray);
even([Head|Tail], Newarray) ->
     case Head rem 2 == 0 of
     	true -> even(Tail,[Head | Newarray]);
     	false -> even (Tail, Newarray)
     end.