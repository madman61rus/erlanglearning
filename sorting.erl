-module(sorting).
-export([fastsorting/1]).

fastsorting (List) -> 
	[Element | _ ] = List,
	{ Right , Left } = fastsorting (List,Element,{[],[]}),
	[ElementRight | ListRight] = Right,
	{ LessR , MoreR } = fastsorting (ListRight,ElementRight,{[],[]}),
	[ElementLeft | ListLeft ] = Left,
	{LessL , MoreL } = fastsorting (ListLeft, ElementLeft,{[],[]}),
	{compare(LessL,ElementLeft,MoreL), compare(LessR,ElementRight,MoreR)}.
	

fastsorting ([],_,{Right,Left}) -> 
	io:format("Lists: ~p~n",[{lists:reverse(Right),lists:reverse(Left)}]),
	{lists:reverse(Right),lists:reverse(Left)};
fastsorting ([Head | Tail], Element, {Right,Left}) ->
    if Head == Element -> fastsorting (Tail, Element,{Right,Left});
    		true -> 
		case Head < Element of 
			true -> fastsorting (Tail, Element,{[Head | Right],Left});
			false -> fastsorting (Tail, Element,{Right,[Head | Left]})
		end
	end.


compare (Left,Element,Right) ->
	Left ++ [Element | Right].	