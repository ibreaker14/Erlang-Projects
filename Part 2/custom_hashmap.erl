-module(custom_hashmap).

%% This program contains functions that reads a text file, put words into tuples, generate custom hashmap, and sort the hashmap
-export([read_file/1,tuples/2,hash/1,sort/1]).

% This function reads in text files
read_file(File_Name) ->
	case file:open(File_Name,read) of {ok,FileDescr} ->
 		Li = io:get_line(FileDescr, ''),
 		% get rid of unnecessary symbols
 		string:tokens(string:strip(re:replace(Li, "(<+|>+|=+|[0-9]+|-+|\\\\+|\\+|\\.+|\\)+|\\(+|,+)", "", [global,{return,list}]),right, $\n)," ");
 	Otherwise ->
 		% prints error when read fails
 		io:format("~n~p~not",[Otherwise]),
            {error, "File does not exist"}
 	end.

% generates tuples based on strings found in list
tuples(String,List) ->
	% looks for the string in the tuple list
	case lists:keyfind(String,1,List) of {Key,Frequency} -> 
		% if word already exists in a list, update frequency
	    lists:keyreplace(String,1,List,{Key,Frequency + 1});
	false -> 
		% if word does not exist in list, append to list
		lists:append(List, [{String,1}])
	end.

% generates a hashmap based on list of tuples provided
hash(List) ->
	% initialize empty list for hashmap
	Hashmap = [],
	% converts all strings to lowercase
 	Thelist = lists:map(fun(Result) -> string:to_lower(Result) end, List),
 	% push tuples into hashmap
	lists:foldl(fun tuples/2, Hashmap,Thelist).

% sorts hashmap from high to low based on frequencies
sort(File_Name) ->
	% reads text file
	File = read_file(File_Name),
	% converts file to hashmap
	Hashmap = hash(File),
	% sorts list based on frequencies
	SortedList = lists:sort(fun({KeyX,ValueX},{KeyY,ValueY}) -> {ValueY,KeyY} < {ValueX,KeyX} end, Hashmap),
	% print list
	io:format("~p~n",[SortedList]).