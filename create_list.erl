% A function get_list/1 create list [1,2...N]
% A function reverse_list/1 create list [N,N-1...1]

-module(create_list).
-export([get_list/1, reverse_list/1]).

get_list (N) -> lists:reverse(get_list_pr (N,1,[])).
reverse_list (N) -> get_list_pr(N,1,[]).


get_list_pr (N,Count, List) when Count =< N -> get_list_pr (N,Count+1,[Count | List]);
get_list_pr (_,_,List) -> List.
