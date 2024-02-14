% BLOCKS WORLD

% Adapted from Ivan Bratko (2012). Prolog Programming for Artificial Intelligence, Fourth Edition
% With inspiration from Russell & Norvig (2022). Artificial Intelligence: A Modern Approach, Fourth Edition

:- include('Breadth_First_Forward_Search_for_PDDL.pl').


% Must define the following predicates for BFFS planner
% apply( +State, +Action, -NewState)



% BLOCKS WORLD DOMAIN

% Definition of action move( Block, From, To)

% -------- PRECONDITIONS --------
% precond_pos( Action, PosCondition): Conditions to be true for Action to be applicable
precond_pos( move( Block, From, To), [ clear( Block), clear( To), on( Block, From)]) :-
  block( Block),			% Block to be moved
  block( To),				% Block to which to moved
  To \== Block,				% Block cannot be moved to itself
  From \== To,				% Move to new position
  Block \== From.			% Block not moved from itself
% precond_neg( Action, NegCondition): Conditions to be false for Action to be applicable
precond_neg( move( Block, From, To), [ ]) :-
  block( Block),			% Block to be moved
  block( To),				% Block to which to moved
  To \== Block,				% Block cannot be moved to itself
  From \== To,				% Move to new position
  Block \== From.			% Block not moved from itself
  
% -------- EFFECTS --------
% adds( Action, Relationships): Action establishes Relationships
adds( move(Block, From, To), [ on(Block, To), clear(From)]).
% deletes( Action, Relationships): Action destroys Relationships
deletes( move(Block, From, To), [ on(Block, From), clear(To)]).


% Definition of action move_to_table( Block, From) in blocks world

% -------- PRECONDITIONS --------
% precond_pos( Action, PosCondition): Conditions to be true for Action to be applicable
precond_pos( move_to_table( Block, From), [ clear( Block), on( Block, From)]) :-
  block( Block),			% Block to be moved
  block( From),				% Block from which to moved
  Block \== From.			% Block not moved from itself
% precond_neg( Action, NegCondition): Conditions to be false for Action to be applicable
precond_neg( move_to_table( Block, From), [ ]) :-
  block( Block),			% Block to be moved
  block( From),				% Block from which to moved
  Block \== From.			% Block not moved from itself
  
% -------- EFFECTS --------
% adds( Action, Relationships): Action establishes Relationships
adds( move_to_table(Block, From), [ on(Block, table), clear(From)]).
% deletes( Action, Relationships): Action destroys Relationships
deletes( move_to_table(Block, From), [ on(Block, From)]).

  
  

% BLOCKS WORLD PROBLEM

% Name the blocks
block( a).
block( b).
block( c).
block( d).
block( e).

% A state in the blocks world
%
%          
%          a  b
% table	=  =  =  =
%
start([ clear(a), clear(b), on(a, table), on(b, table) ]).
goal_pos([ on(a, b)]).
goal_neg([ ]).
% Requires 1 move


% A state in the blocks world
%
%          
%          a  b  c
% table	=  =  =  =
%
%
%start([ clear(a), clear(b), clear(c), on(a, table), on(b, table), on(c, table) ]).
%goal_pos([ on(a, b)]).
%goal_neg([ ]).
% Requires 1 move


% A state in the blocks world
%
%          
%          a  b  c
% table	=  =  =  =
%
%
%start([ clear(a), clear(b), clear(c), on(a, table), on(b, table), on(c, table) ]).
%goal_pos([ on(a, b), on(c, a)]).
%goal_neg([ ]).
% Requires 2 moves


% A state in the blocks world
%
%          c 
%          a  b
% table	=  =  =  =
%
%
%start([ clear(b), clear(c), on(a, table), on(b, table), on(c, a) ]).
%goal_pos([ on(a, c)]).
%goal_neg([ on(c, b)]).
% Requires 2 moves


% A state in the blocks world
%
%          c 
%          a  b
% table	=  =  =  =
%
%
%start([ clear(b), clear(c), on(a, table), on(b, table), on(c, a) ]).
%goal_pos([ on(a, b), on(b, c)]).
%goal_neg([ ]).
% Requires 3 moves


% A state in the blocks world
%
%          c
%          b
%          a  d  e
% table	=  =  =  =
%
%
%start([ on(a, table), on(d, table), on(e, table), on(b, a), on(c, b), clear(c), clear(d), clear(e) ]).
%goal_pos([ on(a, b), on(b, c) ]).
%goal_neg([ ]).
% Requires 3 moves


% A state in the blocks world
%
%          c  e
%          a  b  d
% table	=  =  =  =
%
%
%start([ clear(c), clear(e), clear(d), on(a, table), on(b, table), on(d, table), on(c, a), on(e, b) ]).
%goal_pos([ on(a, b), on(b, c)]).
%goal_neg([ clear(e)]).
% Requires 4 moves


% A state in the blocks world
%
%          c  e
%          a  b  d
% table	=  =  =  =
%
%
%start([ clear(c), clear(e), clear(d), on(a, table), on(b, table), on(d, table), on(c, a), on(e, b) ]).
%goal_pos([ on(a, b), on(b, c)]).
%goal_neg([ clear(d)]).
% Requires 4 moves


% A state in the blocks world
%
%          e
%          d
%          c
%          b
%          a 
% table	=  =  =  =
%
%
%start([ on(a, table), on(b, a), on(c, b), on(d, c), on(e, d), clear(e) ]).
%goal_pos([ on(a, b), on(b, c), on(c, d), on(d, e) ]).
%goal_neg([ ]).
% Requires 5 moves


% A state in the blocks world
%
%          e
%          d
%          c
%          b
%          a 
% table	=  =  =  =
%
%
%start([ on(a, table), on(b, a), on(c, b), on(d, c), on(e, d), clear(e) ]).
%goal_pos([ on(a, e), on(c, d) ]).
%goal_neg([clear(b), clear(a) ]).
% Requires 8 moves




% Use this query:
% start(Start), bffs( Start, FinalState, Plan).
