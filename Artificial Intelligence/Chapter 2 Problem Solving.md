# Defining problems as a state space search
## Problem Solving
- Problem solving, particularly in artificial intelligence, may be characterized as a systematic search through a range  of possible actions in order to reach some predefined goal or solution.
- Problem is defined by:
    - a goal and a set of means (problem space) for achieving the goal.
- Problem is solved by searching of goal which is:
    - the processing of exploring what the means can d.
- State Representation
    - A state space consist of sets of nodes representation each node of the problem, arcs between node representing the legal moves (actions) from one staet to another
- ![sequence of actions](attachments/sequence%20of%20actions.png)
## Problem Space
- The problem space refers to:
    - the set of all possible states and actions that can be taken to reach a particular goal or solve a given problem.
    - e.g., highways and cities of Nepal
- A problem space can be represented by:
    -  directed graph (or trees), where nodes represent search state and paths represent the operators applied to change the state
- A tree is a graph
    - in which any two vertices are connected by exactly one path. Alternatively, any conencted graph with no cycles is a tree.
## Problem Solving Steps - Solving Agent
- Problem solving is a agent based system:
    - that finds sequence of actions that lead to desirable states from the initial state.
- Four steps of problem solving are:
    1. Goal Formulation:
        - What are the successful world states.
    2. Problem Formulation:
        - Possible sequence of actions and states to consider the goal.
    3. Searching:
        - Determine the possible sequence of actions that leads to the states of known values and then choosing the best sequence.
    4. Execution:
        - The solution returned by searching algorithm will be executed by the agent.
## A simple Problem - Solving Agent
- Assumptions:
    - World states (e.g., possible configurations of the chessboard in chess game)
    - Actions as transitions between states
    - Goal Formulation: A set of states
    - Problem Formulation: The sequence of required actions to move from current state to a goal state
## Problem Types
- Single-state problem
    - deterministic, accessible
    - agent knows everything about the world (e.g., playing chess)
- Multiple-state problem
    - deterministic, inaccessible
    - agent doesn't know exact state, could be in any of the possible state (e..g, walking in a dark room)
    - may not have sensors at all
- Contingency Problem:
    - non-determinstic, inaccissble
    - environment is partially observable or actions are uncertain
    - must use sensors during execution
- Exploration Problem
    - Unknown state spce (e.g., maze)
    - Discover and learn about the environment while taking actions)
## Goal Based Agent
- Agent with some sort of goal information
- Intelligent agents are supposed to act in such a way that:
    - the environment goes through a sequence of states that maximizes the performance measure.
![[Pasted image 20260801101702.png]]

# Problem Formulation
- A well defined problem is:
    - A problem in which initial state or starting position, the allowable operations and the goal state are clearly defined
    - an initial state: state from which agent start
    - actions & successor function: description of possible actions available to the agent
    - Goal test: determine whether the given state is goal state or not
    - Path cost: sum of cost of each path from initial state to the given state
- A solution is a sequence of actions from initial to goal state having the lowest path cost.
# Problem types, Well-defined problems, Constraint satisfacion problem
## Constraint Satisfaction Problem
- is a problem that requires its solution within some limitations or conditions also known as constraints (rules).
- a search procedure that operates in a space of constraints
- states are defined by the values and the goal test specifies a set of constraints that the values must obey.
- Constraints are discovered and propagated as far as possible throughout the system
- e.g., 
    - Cryptarithmetic - the columns is the problems must obey an addition constraint
    - VLSI layout problems - fixed circuit connections, minimize area and connection length, do not overlap, optimize of cell and channel routing
    - Map coloring - no adjacent have same color
    - Class scheduling by department
- consists of the following:
    - variables: these are the unknowns or decision variables that need to be assigned a value in order to find a solution ( V = [V1, V2, V3, ... Vn] )
    - Domain: are the sets of possible values that each variable can take (D = [D1, D2, D3, ..., Dn] )
    - Constraints: These are the rules or restrictions that define the relationships between the variables. (C = [C1, C2, C3, ...., Cn] )
- Constraint propagation terminates for one of two reasons
    - Contradiction detected i.e. no solution consistent with known constrainnts
    - Propagation has run off stream and there are no further changes that can be made on the basis of current knowledge -> a solution has been found.
## CSP Example - Farmer Crosses River Puzzle
- Question:
    - A farmer has a goat, a wolf and a cabbage.
    - He wants to get all of his animals and his cabbage across the river into the east side.
    - The farmer has a rowboat, but he only has enough room for himself and one other thing.
    - The wolf will eat the goat if they are left together alone
    - The goat will eat the cabbage if they are left together alone.
    - How can the farmer get everything to the east side?
- Answer:
    - Initial State:
        - Wolf, Goat, cabbage and farmer are on teh north side of the river.
    - Goal State:
        - Wolf, goat, cabbage and farmer are on the south side of the river
    - Operators:
        - Farmer can move one thing at a time across the river in the boat, or he can cross alone.
        - But the goat cannot be left alone with the cabbage or with the wolf
    - solution process:
        - state tuple of 4 states: farmer, wolf, goat, cabbage
        - state(w, w, w, w)
        - state(e, w, e, w)
        - state(w, w, e, w)
        - state(e, w, e, e)
        - state(w, w, w, e)
        - state(e, e, w, e)
        - state(e, e, e, e)
## CSP - Cryptoarithmetic Examples
### Question
FORTY
+ TEN
+ TEN
`-----`
SIXTY
### Solution
#### Step 1
Y + N + N = C1 * 10 + Y
2 N = C1 * 10
N = C1 * 5
### Step 2
T + E + E + C1 = C2 * 10 + T
2E = C2 * 10 - C1
2E = C2 * 10 - C1 * 5
E = C2 * 5 - C1 * 2.5

Since E has to be integer and C1 * 2.5 is not integer, therefore C1 = 0
so:
E = C2 * 5
N = 0
Say C2 = 1

E = 5
N = 0
C1 = 0
C2 = 1
### Step 3
R + T + T + C2 = C3 * 10 + X
R + 2T + C2 = C3 * 10 + X

Say C3 = 2

R + 2T - X = 2*10 - 1 = 19
R + 2T - X = 19

E = 5
N = 0 
C1 = 0
C2 = 1
C3 = 2

### Step 4
O + C3 = C4 * 10 + I
O + 2 = C4 * 10 + I

say C4 = 1
O + 2 = 10 + I
O - I = 8

E = 5
N = 0
C1 = 0
C2 = 1
C3 = 2
C4 = 1
### Step 5
F + C4 = S
S - F = 1

E = 5
N = 0
C1 = 0
C2 = 1
C3 = 2
C4 = 1
conditions:
S - F = 1
O - I = 8
R + 2T - X = 19
remaining numbers:
1, 2, 3, 4, 6, 7, 8, 9
### Step 6

for 2nd condition, we need O - I = 8
- only possible value for O, I:
    - 9 - 1 = 8
- O = 9
- I = 1

for 1st condition, we need S - F = 1 
- possible values:
    - 8 - 7 = 1
    - 7 - 6 = 1
    - 4 - 3 = 1
    - 3 - 2 = 1

for 3rd condition, we need R + 2T > 19
- possible values for R, T then become:
    - 9 + 2 * 8 = 27, 
        - need to subtract X, with 7 being largest value possible
        - but 27 - 7 = 20
        - rejected
    - 8 + 2 * 7 = 22
        - need to subtract X, with 3 as possible value:
        - 22 - 3 = 19
        - accepted: 8, 7, 3
    - 7 + 2 * 8 = 23
        - need to subtract X, with 4 as possible value:
        - 23 - 4 = 19
        - accepted: 7, 8, 4
    - 7 + 2 * 6 = 19
        - need to subtract X, with 0 as possible value
        - 0 already taken by N
        - rejected
    - 6 + 2 * 7 = 20
        - need to subtract X, with 1 as possible value
        - 1 already taken by 2nd condition
    - 6 + 2*5 = 16, invalid
    - 5 + 2*6 = 16, invalid, and all other possiblities are invalid
    - so possible states for R T X:
        - 8, 7, 3
        - 7, 8, 4

- if we take R T X = 8 7 3
- then possible S and F are: none
- thus R T X = 7, 8, 4

- remaining value for S F = 3 2
- remaining value: 6

- taken values:
     - 0 = N
     - 1 = I
     - 2 = F
     - 3 = S
     - 4 = X
     - 5 = E
     - 6 = S
     - 7 = T
     - 8 = R
     - 9 = O
## Similar Questions
1. a
    `  LOGIC`
    + LOGIC
    `-------`
    ` PROLOG`
2. b
    ` CROSS`
    + ROADS
    `-------`
    ` DANGER`
3. c
    `  BASE`
    + BALL
    `------`
    ` GAMES`
4. d
    `  ONE`
    + ONE
    `-----`
    `  TWO`
5. e
    ` KYOTO`
    + OSAKA
    `-------`
    `  TOKYO`
6. f
    `  APPLE`
    + GRAPE
    `-------`
    ` CHERRY`
7. g
    `  ONE`
    + ONE
    + TWO
    `-----`
    ` FOUR`
# Game playing, Production Systems
## Game Playing
- A game can be defined by:
    - the initial state (how the board is set up)
    - the operators (which define the legal moves)
    - a terminal test (which says when the game is over)
    - and a utility or payoff function (which says who won, and by how much)
- Each player try to win the game by making a best move
- In two player games with perfect information
    - the minimax algorithm can determine the best move for a player (assuming the opponent plays perfectly) by enumerating the entire game tree.
- The alpha-beta algorithm does the same calculation as minimax:
    - but is more efficient because it prunes away branches of the search tree that it can prove that are irrelevant to the final outcome.
## Production System
- In production system consist of set of rules in the form Ci -> Ai:
    - Ci = LHS (pattern) that determines applicability of rules
    - Ai - RHS (action) describes the operation to be performed if the rule is applied.
    - The consequent of each implication is interpreted as an action recommendation, rather than simply a logical conclusion

- e.g., (Vacuum World)
    - [A, clean] => move right
    - [A, dirt] => clean

- the typical production system has these features:
    - working memory - maintains a knowledge base
    - Rule memory - contains a set of inference rules in the form of Ci -> Ai where Ci is the condition part and Ai is the action part
    - Match phase - computes the subset of rules whose left hand side is satisfied by knowledge base
    - Conflict resolution phase - decides the rules and their correct order that should be executed.
    - Act phase - final step in each cycle is to execute the action(s) in the chosen rule(s).

- Practical uses of production systems:
    - Autonomous Robots. Expert systems
    - models of human reasoning - such as ACT (Anderson, 1983) and SOAR (Laird et al, 1987)
