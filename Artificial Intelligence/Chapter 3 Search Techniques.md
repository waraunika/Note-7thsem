# Chapter 3: Search Techniques

## Exam Frequency Table


| Topic | Typical Marks | Frequency |
|---|---|---|
| BFS vs DFS (definition, comparison, performance criteria) | 4-9 | Very High, asked in nearly every paper |
| A* search (algorithm, worked example, admissibility/optimality, vs greedy) | 2-9 | Very High, several diagram-based questions |
| Hill climbing (algorithm, drawbacks, solutions) | 4-9 | Very High |
| Minimax + alpha-beta (procedure, drawbacks, worked tree) | 3-8 | Very High |
| Necessity/evaluation criteria of searching | 2-7 | High, usually paired with another topic |
| Informed vs uninformed search comparison | 4-8 | Moderate-High |
| Depth limit search (advantage, comparison) | 4 | Low-moderate |
| Simulated annealing | 2-8 | Moderate, usually paired with hill climbing |

**Reading tip:** Prioritize **BFS/DFS comparison**, **A\* search** (including a worked example, since diagram-based A\* questions appear repeatedly), and **hill climbing with its drawbacks and fixes**, these three with minimax/alpha-beta cover the overwhelming majority of marks in this chapter.

---

## 3.1 Search Fundamentals

Search is a universal problem-solving technique that finds the required states or nodes through the problem's state space, represented by a search tree.

**State-space search** is the process of searching through a state space for a solution by making explicit a sufficient portion of an implicit state-space graph to find a goal node.

Many problems don't have a simple algorithmic solution. Casting these problems as search problems is often the easiest way of solving them.

### Steps in Searching

1. Check whether the current state is the goal state or not.
2. Expand the current state to generate the new set of states.
3. Choose one of the new states generated for further search, depending on the search strategy.
4. Repeat steps 1-3 until the goal state is reached or no more states remain to be expanded.

### When Search Is Useful

Search is especially useful when the sequence of actions required to solve a problem is not known in advance:

- Path-finding problems, e.g., the 8-puzzle, travelling salesman problem.
- Two-player games, e.g., chess and checkers.
- Constraint satisfaction problems, e.g., 8-queens.

### Measuring Search Algorithm Performance

*(Frequently asked directly: "On what basis can we evaluate search algorithms?")*

A search algorithm is evaluated along four dimensions:

- **Completeness**:
    - an algorithm is complete if it is guaranteed to find a solution to the problem, whenever one exists.
- **Time complexity**:
    - how long (worst or average case) it takes to find a solution, usually measured in terms of the number of nodes expanded.
- **Space complexity**:
    - how much space is used by the algorithm, usually measured in terms of the maximum number of nodes held in memory at any one time.
- **Optimality/Admissibility**:
    - if a solution is found, is it guaranteed to be the optimal one (e.g., the one with minimum cost)?

---

## 3.2 Uninformed Search Techniques

Uninformed (blind) search strategies
- use only the information available in the problem definition
- have no additional information about the state space beyond that
- generally less effective than informed search.

**Strategy:**<br>
expand the current state to generate a new set of states, and distinguish a goal state from a non-goal state using only the problem definition.

**Types:**<br>
Breadth First Search, Depth First Search, Depth Limit Search.

### Breadth First Search (BFS)

Starting from the root node (the initial state),
- BFS explores all children of the root node (left to right)
- proceeds level by level down the search tree
- if no solution is found at a level, 
- it expands the first (leftmost) child of the root,
- then the second node at depth 1, and so on.

![BFS](attachments/bfs.png)

**Algorithm (FIFO Queue):**

1. Place the start node in the queue.
2. Examine the node at the front of the queue:
    - If the queue is empty, stop.
    - If the first node is the goal, stop.
    - Otherwise, add the children of the node to the end of the queue.
3. Repeat step 2 until the goal node is reached.

**Performance:**

- **Completeness**:
    - Yes, if the shallowest goal node is at some finite depth d and the branching factor b is finite.
- **Time complexity**:
    - $O(b^{d+1})$.
    - Worst case expands all but the last node at depth d,
    - giving total nodes generated 1 + b + b² + ... + (b^(d+1) - b) = O(b^(d+1)).
- **Space complexity**:
    - $O(b^{d+1})$,
    - since every generated node must remain in memory.
- **Optimal**:
    - Yes, if all step costs are equal.
    - Otherwise not strictly optimal, but finds the solution with the shortest path length.

**Advantages:**
- Complete if the goal node is at a finite depth.
- Provides an optimal solution when path costs are uniform.

**Disadvantages:**
- Needs a lot of time if the solution is far from the root.
- Requires large memory, since the queue grows with depth.

### Depth First Search (DFS)

DFS expands the deepest unexpanded node in the tree first. 
- expands the root node
- then the leftmost child of the root
- then the leftmost child of that node
- and so on. 
- When the search hits a dead end
    - i.e. a partial solution that cannot be extended further
    - it backtracks and expands nodes at a higher level instead.

![DFS](attachments/dfs.png)

**Algorithm (LIFO/Stack):**

1. Put the start node on the stack.
2. While the stack is not empty:
   - Pop the stack.
   - If the top of stack (TOS) is the goal, stop.
   - Otherwise, push the nodes connected to the top of the stack, provided they are not already on the stack.
3. Repeat step 2 until the goal node is reached.

**Performance:**

- **Completeness**:
    - No. Fails in infinite-depth spaces and in the presence of loops.
- **Time complexity**:
    - O(b^m), where m is the maximum depth of the tree. Terrible if m is much larger than d, but if solutions are dense, DFS may be much faster than BFS.
- **Space complexity**:
    - O(bm), i.e., linear space, 
    - since only a single path plus expanded
    - but unexplored siblings need to be remembered.
- **Optimal**:
    - No. It may find a non-optimal (not shortest) goal first.

**Advantages:**
- Lower space complexity than BFS.

**Disadvantages:**
- May not always give the optimal solution.
- Can get stuck going down an infinite branch that never leads to a solution.

### Depth Limit Search (DLS)

![DLS](attachments/dls.png)

DFS can run off down a very long (or infinite) path, and any solution found may not be optimal.
- Depth Limit Search performs depth-first search
- but only up to a pre-specified depth limit **L**,
- truncating the search by considering only paths of length L or less.
- Infinite-length paths are no longer a problem,
- but the search will only find a solution if one exists at length $\le$ L.

**Performance** (DFS with depth limit l):

- **Completeness**:
    - No if l < d
    - Yes if l $\ge$ d, since the solution may otherwise lie beyond the specified depth.
- **Time complexity**:
    - $O(b^l)$
- **Space complexity**:
    - $O(bl)$, i.e., linear space.
- **Optimal**:
    - No, it may find a non-optimal goal first even if l ≥ d.

**Advantages:**
- Memory efficient.

**Disadvantages:**
- Incomplete in general.
- May not be optimal if the problem has more than one solution.

### Iterative Deepening

![Iterative deepening](attachments/iterative-deepening.png)

- Starting with a depth limit L = 0,
- iterative deepening repeatedly increases the depth limit
- and performs a depth-limited search at each new limit.
- It stops when either no solution is found,
- or the depth-limited search fails to find a solution
    - even without cutting off any nodes due to the depth limit.
- Iterative deepening uses only linear space
    - and not much more time than other uninformed algorithms,
    - combining DFS's space efficiency with BFS's completeness and optimality (for uniform costs).
- It is only worth the extra iterations when the solution's actual depth is not known in advance.

### Search Strategy Comparison


| Criterion | Breadth-First | Depth-First | Depth-Limited | Iterative Deepening |
|---|---|---|---|---|
| Complete? | Yes | No | No | Yes |
| Time | $O(b^{d+1})$ | $O(b^m)$ | $O(b^l)$ | $O(b^d)$ |
| Space | $O(b^{d+1})$ | $O(bm)$ | $O(bl)$ | $O(bd)$ |
| Optimal? | Yes | No | No | Yes |

---

## 3.3 Informed (Heuristic) Search Techniques

- Informed search techniques have problem-specific knowledge available
    - in addition to the problem definition.
- The use of a heuristic improves the efficiency of the search process:
    - domain-dependent (heuristic) information is used
    - to search the space more efficiently than blind search allows.
- A **heuristic function h(n)**
    - is domain-specific information that guesses the cost
    - of getting from node n to the goal.
- It is used to decide
    - which node to expand next and which nodes to discard or prune,
    - improving search efficiency.

### Informed vs Uninformed Search


| Aspect | Uninformed (Blind) Search | Informed (Heuristic) Search |
|---|---|---|
| Extra knowledge | None beyond the problem definition | Uses a heuristic function h(n) estimating distance to goal |
| Node selection | Fixed order (e.g., FIFO for BFS, LIFO for DFS) | Guided by evaluation function, e.g., f(n) = h(n) or f(n) = g(n) + h(n) |
| Efficiency | Explores many irrelevant nodes | Generally far fewer nodes explored, with a good heuristic |
| Examples | BFS, DFS, DLS | Greedy Best-First Search, A* |
| Time/space complexity | Depends only on b, d, m | Can be much lower in practice, though worst case is still exponential |
| Completeness/optimality | BFS complete and optimal (uniform cost); DFS neither | A* complete and optimal if h(n) is admissible; Greedy is neither in general |


### Best First Search

- A node is selected for expansion based on an evaluation function f(n):
    - the node with the lowest value of f(n) is expanded first.
- The evaluation function must represent
    - some estimate of the cost of the path
    - from the current state to the closest goal state.

**Types:** Greedy Best-First Search, A* Search.

### Greedy Best-First Search

Greedy search tries to get as close as it can to the goal as quickly as possible:<br>
it expands the node that appears to be closest to the goal.

It evaluates a node using the heuristic function only:
- Evaluation function: **f(n) = h(n)**.
- h(n) estimates the cost from n to the goal.
- h(n) = 0 for the goal state.

**Algorithm:**

1. Place the starting node into the OPEN list.
2. If the OPEN list is empty, stop and return failure.
3. Remove the node n with the lowest value of h(n) from the OPEN list, and place it in the CLOSED list.
4. Expand node n, generating its successors.
5. Check each successor:
    - if any successor is the goal node,
        - return success and terminate
    - otherwise proceed to step 6.
6. For each successor, compute its evaluation function f(n) and check whether it is already in the OPEN or CLOSED list. If it is in neither, add it to the OPEN list.
7. Return to step 2.

**Example (the Bucharest problem):**

![Bucharest example](attachments/Bucharest.png)

Goal: reach Bucharest from Arad, with each node labeled by its straight-line-distance heuristic h.

![h-value](attachments/h-value.png)

Greedy search is not optimal here
- it returns the path Arad-Sibiu-Fagaras-Bucharest (450 km),
- while the optimal path is Arad-Sibiu-Rimnicu-Pitesti-Bucharest (418 km).
- Greedy search picks Fagaras over Rimnicu because
    - Fagaras has a lower straight-line distance to Bucharest,
    - ignoring the actual path cost already incurred.

**Performance:**

- **Completeness**:
    - No, can get stuck in loops.
- **Time complexity**:
    - $O(b^m)$, though a good heuristic can give a dramatic improvement.
- **Space complexity**:
    - $O(b^m)$, since it keeps all generated nodes in memory.
- **Optimal**:
    - No.

### A* Search

- A* is a mix of uniform-cost search and best-first search.
- It always selects the node on the frontier
    - with the lowest estimated total cost of a path
    - from the start to the goal that is constrained to pass through that node.
- A* uses both **path cost** and **heuristic value**, 
    - avoiding the expansion of paths that are already expensive.
- Its evaluation function is:
    - **f(n) = g(n) + h(n)**
    - where:
    - g(n): actual cost so far to reach n from the start.
    - h(n): estimated cost from n to the goal.
    - f(n): estimated total cost of the path through n to the goal.

![costs](attachments/ghf.png)

**Algorithm:**

1. Place the starting node into the OPEN list, with g = 0 and f(n) = h(n).
2. If the OPEN list is empty, stop and return failure.
3. Remove the node n with the lowest value of f(n) from the OPEN list, and place it in the CLOSED list.
4. If n is the goal node, stop and return the path (success).
5. Otherwise, expand n, generating its successors. For each successor n':
   - Compute g(n') = g(n) + cost(n, n'), and f(n') = g(n') + h(n').
   - If n' is not already in OPEN or CLOSED, add it to OPEN with these values.
   - If n' is already in OPEN or CLOSED with a higher g-value,
        - update it with the new, lower g(n') and f(n'), and
        - re-insert it into OPEN if it was in CLOSED.
6. Return to step 2.

**Worked example: how A\* fixes greedy search's flaw**

Consider a small graph with start node S and goal node G:

- Edges (with path costs): S-A = 1, S-B = 4, A-B = 2, A-G = 5, B-G = 1.
- Heuristic values (estimated distance to goal): h(S) = 6, h(A) = 4, h(B) = 1, h(G) = 0.

**Greedy Best-First Search** (using only h(n)):
- from S, h(A) = 4 and h(B) = 1,
- so greedy picks B (lower h).
- From B, the only move is to G.
- This gives the path **S-B-G**,
- with actual cost 4 + 1 = **5**.

**A\* Search** (using f(n) = g(n) + h(n)):
- from S, f(A) = 1 + 4 = 5 and f(B) = 4 + 1 = 5 (tied),
- so both are explored.
- Expanding via A: f(A-B) = g(3) + h(1) = 4,
    - which is lower than continuing via B directly.
- This leads A* to the path **S-A-B-G**,
    - with actual cost 1 + 2 + 1 = **4**,
    - which is the true optimal path.

Greedy search was misled by B's low heuristic value
- into ignoring the cheaper route through A
- where, A* avoids this because
    - it also accounts for the cost already spent getting to each node.

**Performance:**

- **Completeness**:
    - Yes, A* always finds a solution if one exists 
    - given a finite branching factor and positive edge costs
- **Optimality**:
    - Yes, A* gives the optimal solution
    - when the heuristic function is admissible 
    - never overestimates the true cost to the goal
- **Time complexity**:
    - $O(b^d)$, exponential in the path length,
    - where d is the depth of the goal node from the start.
- **Space complexity**:
    - A* keeps all generated nodes in memory,
    - so space is the major limiting factor in practice.

**Admissibility and optimality** *(directly asked as a definition pair)*:

- A heuristic h(n) is **admissible** if
    - it never overestimates the actual cost to reach the goal from n,
    - i.e., h(n) ≤ h*(n) for all n,
    - where h*(n) is the true minimum cost from n to the goal.
- A search algorithm is **optimal** if
    - it is guaranteed to find the lowest-cost solution
    - whenever one exists.
- **A\* is guaranteed to be both complete and optimal precisely when its heuristic is admissible** 
    - and, for graph search with revisited states, also *consistent*,
        - meaning h(n) ≤ cost(n, n') + h(n') for every successor n')
    - An admissible heuristic never causes A* to overlook a cheaper path 
        - in favor of a more expensive one,
        - since it never makes a node look worse (more costly) than it truly is.

---

## 3.4 Local Search: Hill Climbing and Simulated Annealing

### Hill Climbing

- Hill climbing is a local search, greedy approach with no backtracking.
- It can be thought of as depth-first search with a heuristic measurement
    - that orders the choices as nodes are expanded.
- It always selects the most promising successor of the most recently expanded node,
    - moving in the direction of increasing value.
- Hill climbing does not look ahead beyond the immediate neighbors of the current state
    - one move is selected
    - and all other candidate nodes are rejected and never reconsidered.

**Algorithm:**

```
function HillClimbing(graph, initialState):
    current := initialState
    loop:
        neighbor := the highest-valued successor of current
        if neighbor.value <= current.value:
            return current
        current := neighbor
```

1. Determine the successors of the current state.
2. Choose the successor of maximum goodness (breaking ties randomly).
3. If the goodness of the best successor is less than the current state's goodness, stop.
4. Otherwise, make the best successor the current state and return to step 1.

**Drawbacks:**

- **Local maxima**:
    - a peak that is lower than the global maximum,
    - from which every neighboring move looks worse, trapping the search.
- **Plateau**:
    - a region of the search space where the evaluation function is flat,
    - giving the search no direction to move in without a random walk.
    - The search might be unable to find its way off the plateau.
- **Ridge**:
    - a region with steep slopes where
    - the only uphill directions point sideways
    - rather than toward the true peak,
    - so the search direction doesn't align with the top.

![Illustration-1](attachments/ill-1.png)
![Illustration-2](attachments/ill2.png)

**Solutions:**

- **Local maxima**:
    - backtrack to an earlier node and try a different direction.
- **Plateau**:
    - make a large jump in some direction to try to reach a new section of the search space.
- **Ridge**:
    - apply two or more rules together,
        - such as a form of bi-directional search, before testing,
    - or move in several directions at once.

### Simulated Annealing

Simulated annealing escapes local maxima by allowing some "bad" moves,<br>
while gradually decreasing the frequency with which such moves are accepted.

A move is picked at random:
- If it improves the situation, it is accepted immediately.
- If it worsens the situation, it is accepted with some probability less than 1,
    - which decreases exponentially with how bad the move is
    - i.e., for very bad moves the acceptance probability is low,
    - while for only slightly bad moves it is higher
- The probability of accepting downward steps is controlled by a **temperature** parameter:
    - **High temperature**:
        - means a high chance of trying locally bad moves
        - allowing nondeterministic exploration.
    - **Low temperature**
        - makes the search behave more deterministically,
        - like ordinary hill climbing.
- Temperature begins high and gradually decreases
    - according to a predetermined annealing schedule.
- Initially, many possible paths are tried.
- Over time, the search gradually settles on the most promising path.
- If the temperature is lowered slowly enough, an optimal solution will be found.

**Algorithm:**

```
function SIMULATED-ANNEALING(problem, schedule) returns solution state
    current <- MAKE-NODE(problem.INITIAL-STATE)
    for t = 1 to infinity do
        T <- schedule(t)             // get the temperature at time t
        if T = 0 then
            return current.STATE
        neighbor <- a randomly selected successor of current
        delta_E <- VALUE(neighbor) - VALUE(current)
        if delta_E > 0 then
            current <- neighbor       // move to a better state
        else
            with probability exp(delta_E / T) do
                current <- neighbor   // sometimes move to a worse state
```

---

## 3.5 Adversarial Search

- Adversarial search is used in game-playing scenarios
    - where two or more players compete against each other.
- Its goal is to find the best possible move for a player,
    - given the actions available to other players,
    - while minimizing the opponent's chances of winning.
- The situation is adversarial because of the opposition between the players' utility functions.

**Example algorithms:** Minimax and alpha-beta pruning.

### Minimax Procedure

- Minimax is a backtracking, best-move strategy.
    - A value is associated with each position or state of the game,
    - computed by means of a position evaluation function that
    - indicates how good it would be for a player to reach that position.
- Player **MAX** tries to maximize its own utility, by making the best move available to it.
- Player **MIN** tries to minimize MAX's utility, by making the move that is worst from MAX's perspective.

![minimax](attachments/minmax.png)

**Algorithm:**

```
minimax(player, board)
    if (game over in current board position)
        return winner
    children = all legal moves for player from this board
    if (max's turn)
        return maximal score of calling minimax on all the children
    else (min's turn)
        return minimal score of calling minimax on all the children
```

**Problem:** the number of nodes to expand is exponential in both the depth of the tree and the branching factor.

**Performance:**

- **Complete**: 
    - Yes, if the game tree is finite.
- **Optimal**:
    - Yes, against an optimal opponent.
- **Time complexity**:
    - O(b^d), which can be reduced using alpha-beta pruning.
- **Space complexity**:
    - O(bm) (depth-first exploration).
- **Example**:
    - for chess, b $\approx$ 35 and m $\approx$ 100 for a reasonable game,
    - making an exact solution completely infeasible in practice.

### Alpha-Beta Pruning

- Alpha-beta pruning is a modified, optimized version of the minimax algorithm.
- It is a technique for evaluating nodes of a game tree
    - that eliminates unnecessary evaluations,
    - using two parameters, alpha and beta.
- It improves the search efficiency of minimax without sacrificing accuracy
    - the final result is exactly the same as plain minimax would produce.

**Algorithm:**

```
function alphabeta(node, depth, alpha, beta, maximizingPlayer)
    if depth = 0 or node is a terminal node
        return the heuristic value of node
    if maximizingPlayer
        for each child of node
            alpha := max(alpha, alphabeta(child, depth - 1, alpha, beta, FALSE))
            if beta <= alpha
                break    // beta cut-off
        return alpha
    else
        for each child of node
            beta := min(beta, alphabeta(child, depth - 1, alpha, beta, TRUE))
            if beta <= alpha
                break    // alpha cut-off
        return beta
```

**Procedure:**

1. At each non-leaf node, store two values, alpha and beta.
2. Let alpha be the best (maximum) value found so far at a "max" node.
3. Let beta be the best (minimum) value found so far at a "min" node.
4. Initially assign alpha = -infinity and beta = +infinity at the root.
5. Alpha is monotonically non-decreasing and beta is monotonically non-increasing as the search proceeds up the tree.
6. Given a node n, cut off the search below it (generate no more children) if:
   - n is a "max" node and alpha(n) >= beta(i) for some "min" ancestor i of n, or
   - n is a "min" node and beta(n) <= alpha(j) for some "max" ancestor j of n.

**Performance:**

- Pruning does not affect the final result:
    - alpha-beta always returns the same move minimax would.
- Good move ordering improves the effectiveness of pruning.
- With "perfect ordering," time complexity reduces to $O(b^{m/2})$,
    - effectively doubling the search depth achievable in the same time as plain minimax.

![Pruning-1](attachments/pruning.png)
![Pruning-2](attachments/pruning2.png)
