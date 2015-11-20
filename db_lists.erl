-module(db_lists).
-export([new/0,destroy/1,write/3,read/2,match/2]).

new () -> [].

destroy(Db) -> Db = [] .

write (Key, Element, Db) -> [ {Key,Element} | Db].
read (Key, Db) -> lists:keysearch (Key, 1, Db).
match (Element,Db) -> lists:keyfind (Element, 2, Db).
	


