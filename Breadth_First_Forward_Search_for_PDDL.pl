% Breadth-First Forward Search
% From: Ivan Bratko (2012). Prolog Programming for Artificial Intelligence, Fourth Edition


% Helper predicate to force breadth-first search

list([ ]).

list([_| L]) :-
	list(L). 


% The goal is satisfied at state S if the positive goals (FluentsPos) are in S
% and none of the negative goals (FluentsNeg) are in S.

satisfies_goal(State) :-
	goal_pos(FluentsPos),
	goal_neg(FluentsNeg),
	subset(FluentsPos, State),
	intersection(FluentsNeg, State, []).
	
	
% The action is applicable at state S if its positive preconditions (FluentsPos) are in S
% and none of its negative preconditions (FluentsNeg) are in S.

satisfies_precond(State, Action) :-
	precond_pos(Action, FluentsPos),
	precond_neg(Action, FluentsNeg),
	subset(FluentsPos, State),
	intersection(FluentsNeg, State, []).
	

% Execute Action in State to move agent to NewState

apply( CurState, Action, NewState) :-
	deletes(Action, DelList),
	subtract( CurState, DelList, State), !,
	adds( Action, AddList),
	union( AddList, State, NewState).
	
	
% bffs( StartState, FinalState, Plan)
% The agent starts in StartState and ends in FinalState where the goal is satisfied.
% Plan is the sequence of action to reach the goal.

bffs( StartState, FinalState, Plan) :-					
	list_to_set(StartState, SetBasedState), !,
	list(Plan),
	plan(SetBasedState, FinalState, Plan).


plan( State, State, [ ]) :-					
	satisfies_goal(State).

plan( State, FinalState, [ Action | RestOfPlan]) :-
	satisfies_precond(State, Action),
	apply( State, Action, Successor),
	plan( Successor, FinalState, RestOfPlan). 	
