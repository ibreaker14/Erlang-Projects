-module(candy).

%% This program aims to distribute candies differently and increments number of turns it takes to do it based on a starting value of user's choice
-export([whistle/4]).

whistle(A,B,C,D) -> % A,B,C is number of candies. D is turns
	io:format("~nwhistle!~n"),
	io:format("\tStudent 1 has ~w pieces of candy~n",[A]),
	io:format("\tStudent 2 has ~w pieces of candy~n",[B]),
	io:format("\tStudent 3 has ~w pieces of candy~n",[C]),
	io:format("Turn #: ~w~n",[D]),
	if
		((A =:= B) and (B =:= C)) -> % if all students have the same number of candies, quit
			io:format("all candies were divided after ~w turns~n", [D]);
		true ->
			% recursively split candies between students until everyone has the same amount
			whistle(adjust((A div 2) + (B div 2)), adjust((B div 2) + (C div 2)), adjust((C div 2) + (A div 2)), D + 1)
	end.
		
% helper function that adjusts candies
% if a student has an odd number of candies, he/she gets one extra
adjust(Candy) -> 
	if
		Candy rem 2 =/= 0 ->
			Candy + 1;
		true ->
			Candy
	end.		


%% Same function, except it decrements turns and stops either when out of turns or when candies are evenly distributed
%% Uncomment to use
% -export([whistle/4]).

% whistle(A,B,C,0)->
% 	io:format("\tStudent 1 has ~w pieces of candy~n",[A]),
% 	io:format("\tStudent 2 has ~w pieces of candy~n",[B]),
% 	io:format("\tStudent 3 has ~w pieces of candy~n",[C]),
% 	if
% 		((A =:= B) and (B =:= C)) ->
% 			io:format("the candies were divided evenly~n");
% 		true ->
% 			io:format("the candies were not divided evenly~n")
% 	end;
		


% whistle(A,B,C,D) -> % A,B,C is number of candies. D is turns
% 	io:format("~nwhistle!~n"),
% 	io:format("\tStudent 1 has ~w pieces of candy~n",[A]),
% 	io:format("\tStudent 2 has ~w pieces of candy~n",[B]),
% 	io:format("\tStudent 3 has ~w pieces of candy~n",[C]),
% 	io:format("Turn #: ~w~n",[D]),
% 	if
% 		((A =:= B) and (B =:= C)) ->
% 			io:format("all candies were divided evenly after reaching turn # ~w~n", [D]);
% 		true ->
% 			whistle(adjust((A div 2) + (B div 2)), adjust((B div 2) + (C div 2)), adjust((C div 2) + (A div 2)), D - 1)
% 	end.
	

% adjust(Candy) -> 
% 	if
% 		Candy rem 2 =/= 0 ->
% 			Candy + 1;
% 		true ->
% 			Candy
% 	end.	