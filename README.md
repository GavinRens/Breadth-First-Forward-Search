# Breadth-First-Forward-Search

Breadth_First_Forward_Search_for_PDDL.pl is a planning algorithm implemented in Prolog, specifically, SWI-Prolog. It performs breadth-first search from a specified start state until the specified goal state is found, at which time, a sequence of actions (plan) is 'returned'. The algorithm expects the planning domain and problem to be given in a STRIPS/PDDL-like syntax. This project provides a blocks-world example domain/problem in Blocks_World_for_BFFS.pl. The Blocks_World_for_BFFS.pl program calls Breadth_First_Forward_Search_for_PDDL.pl.

## Usage

- Open your (SWI) Prolog interface / command prompt.
- Point the interface to the directory containing the Prolog files: cd('directort/to/PrologPrograms'). (including the full-stop)
- Load the program: consult('Blocks_World_for_BFFS.pl').
- Run the query:  start(Start), bffs( Start, FinalState, Plan).
