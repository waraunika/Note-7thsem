# Chapter 4: Knowledge Representation, Inference and Reasoning

## 4.1 Knowledge, Representation and Reasoning

- **Knowledge** is facts, concepts, rules and relationships about a domain that an agent can use.
- It sits above data and information in a hierarchy:
    - data is raw symbols,
    - information is data with context,
    - knowledge is information plus how to use it,
    - and intelligence is knowledge applied to a new situation.
- **Representation** is
    - writing that knowledge in a formal notation
    - that a machine
        - can store and manipulate, and
        - that supports inference.
- **Reasoning** is
    - deriving new sentences from the stored ones
    - so the agent knows things nobody explicitly told it.
- Knowledge representation exists to answer four questions:
    - how do we represent facts about the world,
    - how do we reason about them,
    - which representation suits the real world,
    - and how do we put it in a form a machine can compute with.

### Kinds of Knowledge


| Kind | What it is | Example |
|---|---|---|
| Declarative | Knowing *that*: facts, concepts, objects, stated without saying how to use them | "Kathmandu is the capital of Nepal" |
| Procedural | Knowing *how*: rules, strategies, procedures, agendas | the steps to sort a list |
| Heuristic | Rules of thumb from experience: good, not guaranteed | in chess, keep the opponent's king exposed |
| Structural | Relationships between concepts and objects | "a cow is-a mammal" |
| Meta | Knowledge *about* knowledge: what the agent knows, and how reliable it is | "my map of Pokhara is out of date" |


### Requirements of a Good Representation

- **Representational adequacy**: can it express everything in the domain?
- **Inferential adequacy**: can new knowledge be derived from it?
- **Inferential efficiency**: can the derivation be steered, so the search does not explode?
- **Acquisitional efficiency**: can new knowledge be added easily?

### Why Logic Is the Representation of Choice

- Logic is
    - concise, unambiguous, context-insensitive and expressive,
    - and it comes with a **proof theory**
    - that inference is defined for you.
- Logic is fixed by three things:
    - **Syntax**: which strings are sentences.
    - **Semantics**: what a sentence means about the world.
    - **Proof theory**: which new sentences may be derived from old ones.

### Knowledge-Based Agents

- A knowledge-based agent is an agent
    - whose behavior comes from a **knowledge base (KB)** of sentences about the world, 
    - plus an **inference engine** that derives new sentences from it.
- It acts on what it can prove, not on hard-wired reflexes.
- Two levels of description:
    - **Knowledge level**: what the agent knows and what goal it has, independent of any notation.
    - **Implementation level**: the sentences, data structures and algorithm that actually run.
- Three operations, in order, once per time step:
    1. **TELL** the KB what was perceived.
    2. **ASK** the KB which action to take.
    3. **TELL** the KB that the action was taken.
- Advantages: 
    - it can be told new facts without reprogramming 
        - i.e. add a sentence and the behavior changes,
    - and it handles partially observable worlds, 
        - since it reasons about what it has not directly seen. 
- Limitation: 
    - it is only as good as its KB, and 
    - inference costs time
        - a large KB with an undirected inference engine 
        - runs into the same search-explosion problem as blind search.

---

## 4.2 Propositional Logic

- A **proposition** is 
    - a declarative statement that is either true or false, never both. 
    - "5 is a prime number" is a proposition
    - "close the door" is not.
- Propositional logic provides a mathematical model
    - to reason about logical expressions as true or false. 
- Despite its limited expressiveness,
    - it illustrates many of the concepts of logic just as well as first-order logic.

### Syntax

The symbols of propositional logic are:

- **Logical constants**: true or false.
- **Propositional symbols**: such as P and Q, each a sentence by itself.
- **Logical connectives**:

| Symbol | Meaning | Mnemonic |
|---|---|---|
| ¬ | Negation | NOT |
| ∧ | Conjunction | AND |
| ∨ | Disjunction | OR |
| → | Implication | IF...THEN |
| ↔ | Biconditional | IF AND ONLY IF |
| ( ) | Parentheses | grouping |

An **atomic** sentence is a single propositional symbol (P, Q). A **compound** sentence joins atomic ones with connectives.

**Example propositions:**
- P = "The sun rises from the west" (a false proposition)
- Q = "5 is a prime number" (a true proposition)

### Well-Formed Formula (WFF)

A WFF is a string built only by these recursive rules:

- Any propositional symbol is a WFF.
- If $\alpha$ is a WFF, then ($\neg \alpha$) and ($\alpha$) are WFFs.
- If $\alpha, \beta$ are WFFs, then so are $(\alpha \land \beta), (\alpha \lor \beta), (\alpha \leftarrow \beta), (\alpha \leftrightarrow \beta)$
- Nothing else is a WFF.

Precedence, when brackets are missing: ¬, then ∧, then ∨, then →, then ↔.

### Properties of a Formula

- **Valid (a tautology)**: true under every interpretation. Example: P ∨ ¬P.
- **Satisfiable**: true under at least one interpretation. Example: P ∧ Q.
- **Unsatisfiable (a contradiction)**: true under no interpretation. Example: P ∧ ¬P.
- **Equivalent**: α ≡ β when they have the same truth value in every row; equivalently, α ↔ β is valid.

A useful link: α is valid if and only if ¬α is unsatisfiable. This is the reason proving a goal can be done by refuting its negation.

**Worked example: proving (A ∧ (A → B)) → B is a tautology**

| A | B | A → B | A ∧ (A → B) | (A ∧ (A → B)) → B |
|---|---|---|---|---|
| T | T | T | T | T |
| T | F | F | F | T |
| F | T | T | F | T |
| F | F | T | F | T |

The last column is true in every row, so the proposition is valid: a tautology.<br>
Rows 2-4 are true vacuously<br>
the antecedent A ∧ (A → B) is false, and false → anything is true.<br>
This formula is modus ponens written as a single proposition:
an inference rule is sound exactly when its implication form is a tautology.

### Equivalences

- α → β ≡ ¬α ∨ β
- α ↔ β ≡ (α → β) ∧ (β → α)
- De Morgan: ¬(α ∧ β) ≡ ¬α ∨ ¬β; ¬(α ∨ β) ≡ ¬α ∧ ¬β
- Distribution: α ∨ (β ∧ γ) ≡ (α ∨ β) ∧ (α ∨ γ)
- The contrapositive ¬β → ¬α is equivalent to α → β; the converse β → α and the inverse ¬α → ¬β are not.

### Rules of Inference

**Propositional rules:**

| Rule | From ∴ conclude |
|---|---|
| Modus ponens | P → Q, P ∴ Q |
| Modus tollens | P → Q, ¬Q ∴ ¬P |
| Hypothetical syllogism | P → Q, Q → R ∴ P → R |
| Disjunctive syllogism | P ∨ Q, ¬P ∴ Q |
| Addition | P ∴ P ∨ Q |
| Simplification | P ∧ Q ∴ P |
| Conjunction | P, Q ∴ P ∧ Q |
| Resolution | P ∨ Q, ¬P ∨ R ∴ Q ∨ R |

**Quantifier rules:**

- **Universal instantiation**: from ∀x P(x), infer P(c) for any constant c.
- **Existential instantiation**: from ∃x P(x), infer P(c) for a brand-new constant c (reusing an existing name is a common mistake - this is essentially skolemization in one line).
- **Universal generalization**: from P(c) for an arbitrary c, infer ∀x P(x).
- **Existential generalization**: from P\(c\), infer ∃x P(x).

**When these rules can be used:**
- only when the premises match the pattern exactly, 
    - after unification 
        - a rule is a syntactic license and never looks at meaning.
- They are sound
    - applied to true premises, they can only produce true conclusions
    - so a derivation built from them is a proof.
- They are used once the KB is in the right form:
    - modus ponens needs implications,
    - resolution needs CNF 
    - and forward/backward chaining need definite clauses.

---

## 4.3 First-Order Predicate Logic (FOPL)

### Why Propositional Logic Is Not Enough

- In propositional logic a whole statement is one indivisible symbol.
- "All humans are intelligent" & "Some humans are intelligent" become two unrelated letters P & Q, 
    - with no way to see that one relates to the other. 
- Propositional logic cannot express objects, their properties, or relations between them,
- and it has no quantifiers,
    - so a fact about many individuals needs one sentence per individual.
- FOPL fixes this by
    - breaking a sentence into subject and predicate,
    - and by quantifying over objects.
- It is an extension of propositional logic that
    - allows flexible knowledge representation in terms of
    - objects, properties, relations and functions.

### Syntax

- **Constants**: `John`, `Nepal`, `2`: named objects.
- **Variables**: `x`, `y`, `z`.
- **Predicates**: `Brother`, `Loves`, `>`: relations that are true or false of their arguments.
- **Functions**: `FatherOf()`, `sqrt()`: return an *object*, not a truth value.
- **Connectives**: `¬`, `∧`, `∨`, `→`, `↔`, plus equality (`=`) and quantifiers (`∀`, `∃`).

An **interpretation** specifies referents for these symbols:
- constant symbols map to objects,
- predicate symbols to relations, and
- function symbols to functional relations.

### Quantifiers

- Quantifiers permit
    - determining or identifying the range and scope of a variable in a logical expression.
- **Universal quantifier (∀)** 
    - "for all", "everyone", "everything".
    - States that the enclosed statement is true for every value of the variable.
    - Example: "Everyone at Pitt is smart": ∀x At(x, Pitt) → Smart(x)
- **Existential quantifier (∃)** 
    - "there exists", "for some", "at least one". 
    - States that the enclosed statement is true for some value of the variable.
    - Example: "Someone at Pitt is smart": ∃x At(x, Pitt) ∧ Smart(x)
- **The pairing rule**:
    - use ∀ with →, and ∃ with ∧.
- Swapping the connectives changes the meaning entirely:
    - ∀x (man(x) ∧ drinks(x, coffee)) says 
        - everything in the universe is a coffee-drinking man,
    - ∃x (student(x) → fails(x)) 
        - is satisfied by any non-student at all.
        - i.e. people who fail may not be students.
- **Duality**, needed in every CNF conversion:
    - ¬∀x P ≡ ∃x ¬P
    - ¬∃x P ≡ ∀x ¬P
- **Quantifier order carries meaning**: 
    - ∀x∃y is not the same as ∃y∀x.
    - "Each Stark hates some Lannister" -> (∀x∃y) is different from 
    - "one Lannister is hated by all Starks" (∃y∀x).

### Translation Patterns

- "All A are B" → ∀x A(x) → B(x)
- "Some A are B" → ∃x A(x) ∧ B(x)
- "No A is B" → ∀x A(x) → ¬B(x), equivalently ¬∃x (A(x) ∧ B(x))
- "A has at least one B" → ∃x B(x) ∧ has(A, x)
- "No" negates the whole existential, not just the predicate
    - "no Lannister loves Bran" is ¬∃x [Lannister(x) ∧ loves(x, Bran)],
    - not a statement that everything is a Lannister that doesn't love Bran.

### Skolemization

- Skolemization is the process of 
    - removing existential quantifiers by
    - replacing the resulting free variables with 
    - terms called Skolem functions (or Skolem constants).
- It preserves satisfiability.
- **∃ not inside any ∀**: 
    - replace with a new **Skolem constant**. Example: ∃x rich(x) becomes rich(A).
- **∃ inside a ∀**:
    - replace with a **Skolem function** of the enclosing universal variable(s).
- Example: ∀x ∃y loves(x, y) becomes loves(x, F(x)).

### Horn Clauses and Definite Clauses

- A **clause** is a disjunction of literals, e.g., ¬P ∨ Q ∨ ¬R.
- A **definite clause** is a clause with exactly one positive literal, e.g., ¬P ∨ ¬Q ∨ K.
- A **Horn clause** is a clause with at most one positive literal. Every definite clause is therefore a Horn clause; the extra case a Horn clause allows is the **goal clause**, which has no positive literal at all.
- A definite clause is exactly an implication with a single conclusion, (P ∧ Q) → K, 
    - so inference collapses to modus ponens, and 
    - forward and backward chaining become possible in
        - time linear in the size of the KB, rather than exponential.
- Horn clauses are closed under resolution:
    - resolving two Horn clauses always produces another Horn clause. 
    - Prolog is built on exactly this: a Prolog program is a set of definite clauses.

### Unification

- **Unification** finds a substitution θ that makes two atomic sentences identical:
    - UNIFY(α, β) = θ where αθ = βθ.
- The substitution with the fewest commitments is the **most general unifier (MGU)**,
    - and it is the one that should be used
    - a more specific substitution can cause valid proofs to be missed. 
    - It is written as \[term/variable\].

**Worked examples:**

- King(x) and King(John) → θ = [John/x]
- P(x, y) and P(a, f(z)) → θ = [a/x, f(z)/y] 
    - z stays free - binding it further would be less general than necessary
- P(x, f(y)) and P(a, f(g(x))) → substitute [a/x] first,
    - then y must match g(x), and
    - x is already bound to a,
    - giving θ = \[a/x, g(a)/y\]
    - applying the earlier binding inside the later term is important
    - stopping at g(x)/y is a common incomplete answer
- Q(a, g(x,a), f(y)) and Q(a, g(f(b),a), x) → x must be f(b) from the second argument, and
    - then f(y) must match x = f(b), giving y = b, so θ = \[f(b)/x, b/y\]

**Unification fails when:**
- The predicate symbols or arities differ (P(x) and Q(x) never unify
    - neither do P(x) and P(x,y)).
- Two different constants must match 
    - King(John) and King(Ram) fail
    - a constant cannot be substituted
- A variable would have to bind to a term containing itself (the **occurs check**) 
    - x cannot bind to f(x), since the substitution would never terminate.

**Standardizing apart**: 
- if both clauses being unified use the same variable name 
    - e.g., both use x,
- one must be renamed first,
- or the unifier will tie together two variables
    - that have nothing to do with each other.

---

## 4.4 Conversion to Conjunctive Normal Form (CNF)

**CNF** is a conjunction of clauses, where each clause is a disjunction of literals:

(A ∨ ¬B) ∧ (C ∨ D ∨ ¬E)

### Why CNF Is Required

- Resolution is a single inference rule, and 
    - it only operates on clauses.
    - Everything else in a formula 
        - i.e. implications, biconditionals, nested negations, quantifiers 
    - has to be eliminated before resolution can be applied. 
    - Because the whole CNF formula is one large conjunction (AND),
    - each clause can be asserted separately and
    - stored as its own line in the knowledge base.
- Every sentence of propositional or first-order logic has an equivalent CNF form,
    - so nothing is lost by insisting on it
- this completeness is what makes resolution a general-purpose proof procedure.

### The Steps of CNF Conversion

1. **Eliminate ↔**: 
    - α ↔ β becomes (α → β) ∧ (β → α).
2. **Eliminate →**:
    - α → β becomes ¬α ∨ β.
3. **Move ¬ inwards**, 
    - until it applies only to atoms.
    - Use De Morgan's laws, double-negation elimination (¬¬α ≡ α),
    - and the quantifier duals (¬∀x P ≡ ∃x ¬P, ¬∃x P ≡ ∀x ¬P).
4. **Standardize variables apart**:
    - rename variables so that no two quantifiers bind the same variable name.
5. **Skolemize**:
    - drop each ∃, replacing its variable with a new constant, or
    - with a function of the enclosing universal variables
6. **Drop the universal quantifiers**:
    - every remaining variable is understood to be universally quantified.
7. **Distribute ∨ over ∧**:
    - α ∨ (β ∧ γ) becomes (α ∨ β) ∧ (α ∨ γ).
8. **Split**
    - the conjunction into separate clauses,
    - renaming variables again if needed so no two clauses share a variable.

Skipping standardizing apart (step 4) or the final split (step 8) risks <br>
unifying two variables that were never meant to refer to the same thing,<br>
and can lead to an unsound proof.

### Worked Example: "Everyone Who Loves All Animals Is Loved by Someone"

**FOPL:** ∀x [∀y Animal(y) → Loves(x,y)] → [∃z Loves(z,x)]

**Step 2, eliminate →** (twice): ∀x ¬[∀y ¬Animal(y) ∨ Loves(x,y)] ∨ [∃z Loves(z,x)]

**Step 3, move ¬ inward** (using the dual and De Morgan): ∀x [∃y Animal(y) ∧ ¬Loves(x,y)] ∨ [∃z Loves(z,x)]

**Step 5, skolemize.** Both existentials sit inside ∀x, so both become functions of x: y ⟹ F(x), z ⟹ G(x):

∀x [Animal(F(x)) ∧ ¬Loves(x, F(x))] ∨ Loves(G(x), x)

**Steps 6-8, drop ∀, distribute, split:**

- Animal(F(x)) ∨ Loves(G(x), x)
- ¬Loves(x, F(x)) ∨ Loves(G(x), x)

Reading the Skolem functions back: F(x) is "an animal that x does not love, if one exists," and G(x) is "someone who loves x."

### Other Worked Examples

**P ∨ (¬P ∧ Q ∧ R):** no ↔, →, or negation to move, so this goes straight to step 7, distributing ∨ over ∧:

P ∨ (¬P ∧ Q ∧ R) = (P ∨ ¬P) ∧ (P ∨ Q) ∧ (P ∨ R)

Since P ∨ ¬P is a tautology (true in every model), that clause contributes nothing and can be dropped, leaving (P ∨ Q) ∧ (P ∨ R): two clauses, {P, Q} and {P, R}.

**P → ((Q ∧ ¬R) → S):**

- Inner implication: (Q ∧ ¬R) → S = ¬(Q ∧ ¬R) ∨ S
- Outer implication: P → [¬(Q ∧ ¬R) ∨ S] = ¬P ∨ ¬(Q ∧ ¬R) ∨ S
- De Morgan then double negation: ¬(Q ∧ ¬R) = ¬Q ∨ R
- Result: ¬P ∨ ¬Q ∨ R ∨ S

Nothing here needed to be distributed, so the answer is a single clause with four literals - a conjunction of one clause is still valid CNF. As a set: {¬P, ¬Q, R, S}.

**P → ((Q ∧ ¬R) ↔ S):** Let M = Q ∧ ¬R to simplify the working.

- Eliminate ↔: M ↔ S = (M → S) ∧ (S → M)
- Eliminate → inside: = (¬M ∨ S) ∧ (¬S ∨ M)
- Substitute M back and apply De Morgan to ¬M: (¬Q ∨ R ∨ S) ∧ (¬S ∨ (Q ∧ ¬R))
- Distribute in the right half: ¬S ∨ (Q ∧ ¬R) = (¬S ∨ Q) ∧ (¬S ∨ ¬R)
- So the inner formula is (¬Q ∨ R ∨ S) ∧ (¬S ∨ Q) ∧ (¬S ∨ ¬R)
- Apply the outer implication, P → X = ¬P ∨ X, distributing ¬P into every clause of X:

(¬P ∨ ¬Q ∨ R ∨ S) ∧ (¬P ∨ ¬S ∨ Q) ∧ (¬P ∨ ¬S ∨ ¬R)

Three clauses in total.

A note on expanding biconditionals: A ↔ B can also be written as (A ∧ B) ∨ (¬A ∧ ¬B), which is logically correct but is a *disjunction* of conjunctions, requiring extra work to push back into CNF. Using the two-implications form (M → S) ∧ (S → M) is more direct.

### Common Errors

- **Skolemizing to a constant inside a ∀**: ∀x∃y must become F(x), never a bare constant A
    - this is the single most common error and silently changes the meaning of the sentence.
- **Distributing where it isn't valid**: ¬(A ∧ ¬B) ∨ C is ¬A ∨ B ∨ C - a single clause.
    - It is *not* the same as (¬A ∨ C) ∧ (B ∨ C).
    - The negation here lands on a conjunction (¬(A ∧ ¬B) = ¬A ∨ B), and
        - there is nothing left to distribute.
    - This is different from a case where the negation lands on a *disjunction* (¬(A ∨ B) = ¬A ∧ ¬B),
        - which genuinely does split into two separate clauses.
- **Forgetting to standardize apart**:
    - two clauses that both happen to use x will unify incorrectly if their variables are not renamed to be distinct first.
- **Dropping ∀ before skolemizing**:
    - the order in the procedure matters
    - once the ∀ is gone, there is nothing left for a Skolem function to depend on.
- **Simplification is allowed and worth doing**:
    - a clause containing both P and ¬P is a tautology and can be dropped entirely
    - duplicate literals within one clause collapse to a single occurrence.

---

## 4.5 Resolution Refutation

### The Procedure

1. Convert every premise into **FOPL**.
2. Convert every FOPL sentence into **CNF** (Section 4.4), and number the clauses.
3. **Negate the goal**, convert that negation to CNF too, and add it to the clause set.
4. Repeatedly **resolve** two clauses that contain complementary literals, unifying them with the MGU, and add the resulting **resolvent** to the set.
5. Stop when the **empty clause** (□) is derived. The clause set is then unsatisfiable, so the negated goal must be false, so the original goal is proved true.

### Why Refute Rather Than Prove Directly

Resolution is **refutation complete**, not complete in general: it is guaranteed to find a contradiction in an unsatisfiable set of clauses, but it is not guaranteed to derive an arbitrary true sentence directly. The proof is therefore turned around using the equivalence:

KB ⊨ α if and only if KB ∧ ¬α is unsatisfiable

### How to Write Up a Resolution Proof

- Number every clause, and beside each resolvent, note which two clauses it came from and which substitution was used.
- Resolve starting from the negated goal clause and work downward - this both prunes the search and reads naturally as a proof rather than an undirected search log.
- Resolve on only one complementary pair of literals per step; combining two cancellations in a single step is unsound.
- Standardize variables apart before each resolution step.
- Finish with an explicit closing statement: "the empty clause is derived, so the assumption contradicts the premises, hence the goal is proved."

### Contradiction vs. Extraction

- **Proof by contradiction** (the standard method): negate the goal and derive the empty clause. Used whenever the question says "prove that...".
- **Proof by extraction**: do not negate the goal; instead chain the clauses forward until the goal literal itself is produced. Used when the question asks "who" or "what" rather than "prove," e.g., "did Marcus hate Caesar?" Both methods use the same clauses and the same resolution rule; only the starting point differs.

### Worked Example: "John Likes Peanuts"

**Premises:** John likes all kinds of food; apples are food; chicken is food; anything anyone eats and isn't killed by is food; Bill eats peanuts and is still alive; Sue eats everything Bill eats.

**Step 1, facts into FOPL:**

1. ∀x food(x) → likes(John, x)
2. food(Apple)
3. food(Chicken)
4. ∀y∀x [eats(y,x) ∧ ¬killed(y)] → food(x)
5. eats(Bill, Peanuts) ∧ ¬killed(Bill)
6. ∀x eats(Bill, x) → eats(Sue, x)

("Is still alive" is written as ¬killed rather than as a separate predicate "alive" - this avoids needing an extra clause linking the two.)

**Step 2, into CNF:**

1. ¬food(x) ∨ likes(John, x)
2. food(Apple)
3. food(Chicken)
4. ¬eats(y,x) ∨ killed(y) ∨ food(x)
5a. eats(Bill, Peanuts)
5b. ¬killed(Bill)
6. ¬eats(Bill, x) ∨ eats(Sue, x)

**Step 3, negate the goal:**

7. ¬likes(John, Peanuts)

**Step 4, resolution:**

8. ¬food(Peanuts) - from (7, 1), [Peanuts/x]
9. ¬eats(y, Peanuts) ∨ killed(y) - from (8, 4), [Peanuts/x]
10. killed(Bill) - from (9, 5a), [Bill/y]
11. □ - from (10, 5b)

The empty clause is derived, so "John likes peanuts" is proved. Clauses 2, 3, and 6 (apples, chicken, and Sue) are never used in this proof - they are distractors not needed to reach the goal.

**A note on clause 4's structure**: the premise has the shape ¬[A ∧ ¬B] ∨ C, which correctly simplifies to ¬A ∨ B ∨ C - a single clause (see the CNF error notes in Section 4.4). Splitting it into two separate clauses, ¬eats(y,x) ∨ food(x) and ¬killed(y) ∨ food(x), is not a valid equivalence, since it would incorrectly assert that merely not being killed is sufficient on its own to make something food.

### Worked Example: "Colonel West Is a Criminal"

**Premises:** It is a crime for an American to sell weapons to hostile nations. Nono has some missiles. All the missiles owned by Nono were sold to it by Colonel West. Missiles are weapons. An enemy of America counts as hostile. Colonel West is an American. Nono is an enemy of America.

**Step 1, facts into FOPL:**

1. ∀p∀q∀r [American(p) ∧ Weapon(q) ∧ Sells(p,q,r) ∧ Hostile(r)] → Criminal(p)
2. ∃x Missile(x) ∧ Owns(Nono, x)
3. ∀x [Missile(x) ∧ Owns(Nono,x)] → Sells(West, x, Nono)
4. ∀x Missile(x) → Weapon(x)
5. ∀x Enemy(x, America) → Hostile(x)
6. American(West)
7. Enemy(Nono, America)

"Nono has some missiles" is existential, not universal - it is not saying every object is a missile, and no specific missile is named in the premises. Skolemizing it introduces a brand-new constant M1, splitting it into two ground facts.

**Step 2, into CNF:**

1. ¬American(p) ∨ ¬Weapon(q) ∨ ¬Sells(p,q,r) ∨ ¬Hostile(r) ∨ Criminal(p)
2a. Missile(M1)
2b. Owns(Nono, M1)
3. ¬Missile(x) ∨ ¬Owns(Nono,x) ∨ Sells(West,x,Nono)
4. ¬Missile(x) ∨ Weapon(x)
5. ¬Enemy(x, America) ∨ Hostile(x)
6. American(West)
7. Enemy(Nono, America)

**Step 3, negate the goal:**

8. ¬Criminal(West)

**Step 4, resolution:**

9. ¬American(West) ∨ ¬Weapon(q) ∨ ¬Sells(West,q,r) ∨ ¬Hostile(r) - (8, 1), [West/p]
10. ¬Weapon(q) ∨ ¬Sells(West,q,r) ∨ ¬Hostile(r) - (9, 6)
11. ¬Missile(q) ∨ ¬Sells(West,q,r) ∨ ¬Hostile(r) - (10, 4), [q/x]
12. ¬Missile(q) ∨ ¬Owns(Nono,q) ∨ ¬Hostile(Nono) - (11, 3), [q/x, Nono/r]
13. ¬Owns(Nono, M1) ∨ ¬Hostile(Nono) - (12, 2a), [M1/q]
14. ¬Hostile(Nono) - (13, 2b)
15. ¬Enemy(Nono, America) - (14, 5), [Nono/x]
16. □ - (15, 7)

"Colonel West is a criminal" is proved in eight resolution steps, and every premise is used in this particular proof.

**Note on missing bridging premises**: some versions of this puzzle omit the "missiles are weapons" and/or "enemy implies hostile" premises. Without them, the proof cannot close, since the crime rule (clause 1) needs all four conditions - American, weapon, sale, and hostile buyer - explicitly linked. If a premise set is missing one of these links, it must be stated as an assumption before the proof can proceed; a resolution proof is a formal derivation, and skipping a required bridging axiom while still claiming the proof closes is not valid.

### Worked Example: "Charlie Is a Horse"

**Premises:** horses, cows, pigs are mammals; an offspring of a horse is a horse; Bluebeard is a horse; Bluebeard is Charlie's parent; offspring and parent are inverse relations; every mammal has a parent.

**Step 1, facts into FOPL:**

1. ∀x horse(x) → mammal(x) (and similarly for cow, pig)
2. ∀x∀y [offspring(x,y) ∧ horse(y)] → horse(x)
3. horse(Bluebeard)
4. parent(Bluebeard, Charlie)
5. ∀x∀y offspring(x,y) ↔ parent(y,x)
6. ∀x mammal(x) → ∃y parent(y, x)

**Step 2, into CNF:**

1a. ¬horse(x) ∨ mammal(x) (1b, 1c likewise for cow, pig)
2. ¬offspring(x,y) ∨ ¬horse(y) ∨ horse(x)
3. horse(Bluebeard)
4. parent(Bluebeard, Charlie)
5a. ¬offspring(x,y) ∨ parent(y,x)
5b. ¬parent(y,x) ∨ offspring(x,y)
6. ¬mammal(x) ∨ parent(f(x), x)

(The ∃y in premise 6 sits inside ∀x, so it correctly skolemizes to a function f(x): each mammal has its own parent, not a shared one.)

**Step 3, negate the goal:**

7. ¬horse(Charlie)

**Step 4, resolution:**

8. ¬offspring(Charlie, y) ∨ ¬horse(y) - (7, 2), [Charlie/x]
9. ¬offspring(Charlie, Bluebeard) - (8, 3), [Bluebeard/y]
10. ¬parent(Bluebeard, Charlie) - (9, 5b), [Charlie/x, Bluebeard/y]
11. □ - (10, 4)

"Charlie is a horse" is proved in four resolution steps. Premises 1 and 6 (the general mammal rule) are never used - being a horse follows from the offspring rule alone.

**The role of premise 5**: written as a biconditional, it yields two clauses (5a and 5b), and only 5b is actually used - it turns the given parent(Bluebeard, Charlie) into the offspring(Charlie, Bluebeard) that rule 2 needs. A one-directional reading of "inverse relations" would not be sufficient to close this proof.

**Argument order matters**: offspring(x,y) means "x is the offspring of y," so its inverse is parent(y,x), not parent(x,y). Getting this reversed is a common source of error on this style of problem.

### Worked Example: A Goal That Is Itself an Implication

**Premises:** All hounds howl at night. Anyone who has any cat will not have any mice. Light sleepers do not have anything that howls at night. John has either a cat or a hound. **Goal:** if John is a light sleeper, then John does not have any mice.

**Step 1, facts into FOPL:**

1. ∀x Hound(x) → Howl(x)
2. ∀x∀y [Have(x,y) ∧ Cat(y)] → ∀z [Have(x,z) → ¬Mouse(z)]
3. ∀x LS(x) → ∀y [Have(x,y) → ¬Howl(y)]
4. ∃x Have(John, x) ∧ [Cat(x) ∨ Hound(x)]

**Step 2, into CNF:**

1. ¬Hound(x) ∨ Howl(x)
2. ¬Have(x,y) ∨ ¬Cat(y) ∨ ¬Have(x,z) ∨ ¬Mouse(z)
3. ¬LS(x) ∨ ¬Have(x,y) ∨ ¬Howl(y)
4a. Have(John, a) (Skolem constant a)
4b. Cat(a) ∨ Hound(a)

**Step 3, negate the goal - this produces three clauses, not one:**

¬[LS(John) → ∀z (Have(John,z) → ¬Mouse(z))] = LS(John) ∧ ∃z [Have(John,z) ∧ Mouse(z)]

5a. LS(John)
5b. Have(John, b) (Skolem constant b)
5c. Mouse(b)

This is the main difficulty of this style of problem: since ¬(P → Q) = P ∧ ¬Q, negating an implication produces a conjunction, and the existential inside that negated consequent then skolemizes to a fresh constant. Treating the negated goal as a single clause instead of three is the most common way this kind of proof fails to close.

**Step 4, resolution:**

6. ¬LS(x) ∨ ¬Have(x,y) ∨ ¬Hound(y) - (3, 1), [y/x]
7. ¬Have(John,y) ∨ ¬Hound(y) - (6, 5a), [John/x]
8. ¬Hound(a) - (7, 4a), [a/y]
9. Cat(a) - (8, 4b)
10. ¬Have(x,a) ∨ ¬Have(x,z) ∨ ¬Mouse(z) - (9, 2), [a/y]
11. ¬Have(John,z) ∨ ¬Mouse(z) - (10, 4a), [John/x]
12. ¬Mouse(b) - (11, 5b), [b/z]
13. □ - (12, 5c)

The implication is proved in eight resolution steps. In words: John is a light sleeper, so he has nothing that howls; it was a cat or a hound, so it must be a cat; anyone with a cat has no mice; so John has no mice.

Two distinct Skolem constants appear here: a is the animal John owns (from premise 4), and b is the mouse the negated goal claims he has - these must stay distinct, since conflating them would produce an unsound proof that happens to still close.

### General Lessons Across Resolution Proofs

- A clause may be reused as many times as needed in a single proof; nothing about resolution restricts a clause to being used only once.
- "Has some" or "there exists" in a premise is existential and skolemizes to a new constant (if not inside a universal) or a new function (if inside one) - never to a free variable, which would incorrectly claim the property holds universally.
- Not every premise in a given set is necessarily used in the shortest proof; some are included as distractors and are consistent with, but irrelevant to, the specific goal.
- When a premise is phrased ambiguously (e.g., "X only likes Y" could mean "liking implies Y" or its converse), the reading actually needed for the proof to close should be stated explicitly before proceeding.

---

## 4.6 Rule-Based Reasoning: Forward and Backward Chaining

**Rule-based reasoning** stores knowledge as IF-THEN rules and uses an inference engine to decide which rule to fire, in order to derive conclusions or make decisions.

**Components:**

- **Rule base**: the IF-THEN rules (long-term knowledge).
- **Working memory**: the facts known right now.
- **Inference engine**: matches rules against working memory, resolves conflicts when multiple rules match, and fires the chosen rule.

The engine's cycle - match, resolve conflicts, execute - is the same recognize-act cycle as a production system (Chapter 2).

**Advantages**: rules are modular (one can be added or removed without touching the rest); they are readable by a domain expert who is not a programmer; and the chain of fired rules serves as an explanation, which is how an expert system justifies its conclusions (Chapter 7).

**Disadvantages**: no learning occurs on its own, and large rule bases can become slow or contain conflicting rules.

### Forward Chaining (Data-Driven)

Forward chaining starts from the known facts. It fires every rule whose premises are all currently satisfied, adds each rule's conclusion to the fact base, and repeats until the goal appears or nothing new can be derived. It is bottom-up, and uses modus ponens on definite clauses.

- Advantage: derives everything that follows from the known facts, which suits monitoring, alarms, and planning, where new data arrives and its consequences must be worked out.
- Disadvantage: can do a lot of irrelevant work, proving facts nobody actually asked about.

**Worked example (forward chaining on the Colonel West premises):**

Start with the ground facts: American(West), Missile(M1), Owns(Nono, M1), Enemy(Nono, America).

**Iteration 1** - fire every rule whose premises are all present:
- Rule 4 with [M1/x] → Weapon(M1)
- Rule 3 with [M1/x], needing both Missile(M1) and Owns(Nono,M1), both present → Sells(West, M1, Nono)
- Rule 5 with [Nono/x] → Hostile(Nono)
- Rule 1 does not fire yet - not all four of its premises are known.

**Iteration 2** - rule 1 now matches, with American(West), Weapon(M1), Sells(West,M1,Nono), and Hostile(Nono) all in the fact base:

→ Criminal(West)

Goal reached, stop.

### Backward Chaining (Goal-Driven)

Backward chaining starts from the goal. It finds a rule that concludes the goal, makes that rule's premises into new sub-goals, and recurses until every sub-goal is a known fact. It is top-down and depth-first, again using modus ponens.

- Advantage: touches only what the goal actually needs, which suits diagnosis, query answering, and theorem proving. Prolog works this way.
- Disadvantage: can loop on recursive rules, and it only answers the specific question asked.

**Worked example (backward chaining on the same premises):**

Goal: Criminal(West). Only rule 1 concludes Criminal, so unify [West/p] and take its four premises as sub-goals:

- American(West): a known fact, done.
- Weapon(q) → sub-goal Missile(q): matches the fact Missile(M1), binding [M1/q].
- Sells(West, M1, r) → sub-goals Missile(M1) (already satisfied) and Owns(Nono, M1) (a fact), binding [Nono/r].
- Hostile(Nono) → sub-goal Enemy(Nono, America): a known fact.

Every leaf is a fact, so the goal is proved.

**Comparing the two runs**: forward chaining derived three facts along the way (Weapon, Sells, Hostile) that happened to all be needed here, but on a larger knowledge base most such derived facts would be irrelevant to the specific goal. Backward chaining touched only the four conjuncts of the one relevant rule, and a binding found while resolving one sub-goal (M1/q) was carried into resolving the next sub-goal, which is why the third sub-goal could be matched at all.

### Comparison Table

| | Forward Chaining | Backward Chaining |
|---|---|---|
| Starts from | Known facts / data | The goal to be proved |
| Direction | Bottom-up, data-driven | Top-down, goal-driven |
| Question answered | "What can I conclude?" | "Can I prove this?" |
| Search | In effect breadth-first: all consequences of the current facts | Depth-first: one sub-goal chain at a time |
| Work done | Derives many facts, most possibly irrelevant to any one goal | Derives only what the goal needs |
| Suits | Monitoring, alarms, planning, real-time control, design | Diagnosis, query answering, theorem proving, Prolog |
| Number of goals | Handles many goals at once | Handles one goal at a time |
| Efficiency | Slower when the goal is very specific | Slower when the fact base is small and rule chains are deep |

The core distinction: forward chaining asks "what follows from what I know," while backward chaining asks "what would I need to know for this to be true." Both use the same underlying rules and modus ponens, just applied from opposite ends.

**A simple illustrative rule base:**

- R1: IF fever AND cough THEN flu.
- R2: IF flu THEN prescribe rest.

Facts: fever, cough.
- Forward: R1 fires (flu is added), then R2 fires (prescribe rest is concluded).
- Backward, from the goal "prescribe rest": needs flu, which needs fever and cough, both of which are already known facts.

---

## 4.7 Statistical Reasoning: Uncertainty, Bayes' Theorem and Belief Networks

### Why Logic Alone Is Not Enough

FOPL is monotonic and categorical: a fact is either true or false, and adding more knowledge never retracts an earlier conclusion. The real world is neither strictly binary nor monotonic. Three sources of uncertainty commonly arise:

- **Incomplete knowledge**: not all relevant facts are available.
- **Imprecise or unreliable data**: from a sensor, or a reported symptom.
- **Rules that are only usually true**: e.g., "a stiff neck suggests meningitis" is not a strict logical implication - writing it as one would simply be false, since listing every exception is impractical. Attaching a numeric degree of belief instead is the standard fix.

### Approaches for Measuring Uncertainty

- **Probability theory**: degree of belief in [0,1], updated by Bayes' rule. This is the mainstream approach.
- **Certainty factors**: an ad-hoc score in [-1, +1] attached to each rule, as used in the MYCIN expert system. Simple to apply, but not probabilistically rigorous.
- **Dempster-Shafer theory**: assigns belief to *sets* of hypotheses, allowing ignorance to be represented separately from active disbelief.
- **Fuzzy logic**: handles vagueness (e.g., "tall," "warm"), which is a distinct concept from uncertainty - probability is about not knowing which case holds, while fuzzy logic is about a case not having a sharp boundary in the first place.
- **Non-monotonic / default reasoning**: assumes the normal case by default, and retracts the conclusion if it is later contradicted by new information.

### Prior, Posterior, and Bayes' Theorem

- **Prior probability** P(A): belief in A before any evidence is considered. Example: 1 person in 50,000 has meningitis.
- **Posterior probability** P(A|B): belief in A after evidence B has been observed. Example: the probability of meningitis given that the patient has a stiff neck.
- **Likelihood** P(B|A): how probable the evidence is, assuming the hypothesis holds. This is typically the number that is actually known or measurable in practice (e.g., a doctor knows how often meningitis causes a stiff neck), which is precisely why Bayes' theorem is needed - it converts a known likelihood into the desired posterior.
- **Marginal probability** P(B): the overall probability of the evidence, however it arose.

**Bayes' theorem:**

$$P(A|B) = \dfrac{P(B|A) \cdot P(A)}{P(B)}$$

When P(B) is not given directly, it is expanded using the **law of total probability**:

$$P(A|B) = \dfrac{P(B|A) \cdot P(A)}{P(B|A)\cdot P(A) + P(B|\neg A) \cdot P(\neg A)}$$

### How Bayes' Theorem Aids Reasoning

- It **reverses the direction of a conditional**.
    - Causal knowledge typically runs cause → effect (e.g., P(symptom | disease),
    - which is stable and directly measurable, 
    - while diagnosis needs the reverse direction, effect → cause. 
    - Bayes' theorem converts one into the other.
- It gives a **principled update rule**: 
    - posterior is proportional to likelihood times prior.
    - Evidence revises a belief rather than replacing it outright.
- It makes the **base rate** explicit.
    - A 99%-accurate test for a disease affecting only 1 in 10,000 people
    - can still leave a positive result far more likely to be a false positive than a true one,
    - because the prior probability of having the disease is so small to begin with.
- It composes across multiple pieces of evidence, applied one at a time,
    - which is exactly the mechanism a belief network relies on internally.

**Practical tips for Bayes calculations:**

- Name the events clearly before substituting numbers - misreading which probability is P(A|B) versus P(B|A) is the most common source of error.
- When a question gives percentages across several exhaustive groups (e.g., three factories, or men and women), the denominator is the total-probability sum across all of those groups.
- P(¬A) = 1 - P(A) is almost always needed in a calculation, and is rarely given directly in the question.

### Causal / Belief Networks

A **causal network** (also called a belief network, Bayesian network, or Bayesian belief network - these are different names for the same structure) is a **directed acyclic graph (DAG)** in which:

- each **node** is a random variable, and
- each **edge** X → Y indicates that X has a direct causal influence on Y,

together with a **conditional probability table (CPT)** at every node, giving P(node | its parents). A root node (no parents) has a CPT that is simply its prior probability.

**The joint distribution as a product of local factors:**

P(x₁, ..., xₙ) = ∏ P(xᵢ | parents(xᵢ))

**Why this is useful**: a full joint distribution over n binary variables requires 2ⁿ - 1 independent numbers in general. A network in which each node depends only on a small number of parents needs far fewer - for example, a five-variable network might need only around 10 numbers instead of 2⁵ - 1 = 31, because each node's probability table is conditioned only on its own parents rather than on all other variables. This compactness, made possible by **conditional independence** (a node is independent of its non-descendants, given its parents), is the main reason to use a belief network at all.

### Modes of Reasoning in a Belief Network

- **Causal (top-down)**:
    - reasoning from cause to effect, 
    - e.g., "a burglary occurred: how likely is it that John calls?"
    - This uses the CPTs directly, following the arrows.
- **Diagnostic (bottom-up)**:
    - reasoning from effect to cause,
    - e.g., "John called: how likely is a burglary?"
    - This is where Bayes' theorem is needed,
    - since it reasons against the direction of the arrows.
- **Intercausal**:
    - reasoning between two causes of a single observed effect,
    - e.g., "the alarm rang, and an earthquake was independently reported, so burglary becomes less likely as an explanation" 
    - this pattern is known as **explaining away**.
- **Mixed**:
    - evidence is available both above and below the query node simultaneously.

**Method for a numerical question**: write out the product form for the specific joint probability requested, substitute the one relevant CPT entry per variable (remembering P(¬X) = 1 - P(X) where a complement is needed), and multiply.

**Worked example: the wet-grass network**

Query: find P(C=True, S=True, R=False, W=True), i.e., cloudy, sprinkler on, no rain, and wet grass.

P(C, S, ¬R, W) = P(C) × P(S|C) × P(¬R|C) × P(W|S, ¬R)

Reading each factor from its own CPT (values illustrative):
- P(C) = 0.6 (root node prior)
- P(S|C=T) = 0.10 (sprinkler table)
- P(R|C=T) = 0.80, so P(¬R|C=T) = 1 - 0.80 = 0.20
- P(W|S=T, R=F) = 0.90 (wet-grass table)

P = 0.6 × 0.10 × 0.20 × 0.90 = 0.0108 = 1.08%

**The overall connection between belief networks and Bayes' theorem**: a belief network stores causal conditional probabilities as compactly as possible, and Bayes' theorem is what allows those stored probabilities to be run backwards to support diagnostic reasoning. Without the network structure, a full joint distribution would be needed; without Bayes' theorem, inference could only proceed in the direction the arrows already point.

---

