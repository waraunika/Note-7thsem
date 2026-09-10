# Chapter 1: Introduction to Artificial Intelligence

## Exam Frequency Table

| Topic | Typical Marks | Frequency |
|---|---|---|
| Turing Test (definition, importance, factors to pass) | 2–7 | Very High: asked almost every year |
| Definition of AI + applications | 2–7 | Very High |
| Intelligent agent, types of agents, PEAS | 2–8 | High |
| Brief history of AI | 2–8 | Moderate |
| Natural vs Artificial Intelligence / can AI replace humans | 1–7 | Low–Moderate (recent trend) |
| Knowledge vs Learning, role of learning | 2–8 | Moderate |
| Rational agent / acting humanly vs thinking humanly | 1–7 | Moderate |

**Reading tip:** Prioritize the **Turing Test** (definition, factors required to pass it, and whether passing it proves real intelligence), **Intelligent Agents with PEAS**, and **AI definitions + applications**.

---

## 1.1 Definition of Artificial Intelligence

**AI** is the branch of computer science concerned with building machines/systems that can perform tasks which would normally require human intelligence.

Some standard definitions:

- *"The art of creating machines that perform functions that require intelligence when performed by people."*, Kurzweil, 1990
- *"The science of making computers do things that require intelligence like humans."*, Minsky
- *"AI is the study of how to make computers do things at which, at the moment, people are better."*, Elaine Rich
- Artificial Intelligence is a branch of science which deals with helping machines find solutions to complex problems in a more human-like fashion.

**Intelligence** itself can be understood as:
- The ability to reason
- The ability to understand
- The ability to create

### Intelligent Behaviors (categories of tasks AI attempts)

- **Everyday tasks**: recognizing a friend or a caller's voice, translating between languages, interpreting a photograph, talking, cooking a meal.
- **Formal tasks**: proving a logic theorem, geometry, calculus, playing chess, checkers, or Go.
- **Expert tasks**: engineering design, medical diagnosis, financial analysis.

### Types of AI (by capability)

- **Artificial Narrow (Weak) Intelligence**: designed to perform a specific task or a narrow range of tasks within a specific domain.
- **Artificial General (Strong) Intelligence**: capable of performing any intellectual task that a human can.
- **Artificial Super Intelligence**: surpasses human intelligence in all aspects.

---

## 1.2 Approaches to AI (Thinking vs Acting, Humanly vs Rationally)

AI is commonly organized along two axes: **thinking vs acting**, and **humanly vs rationally**, giving four approaches.

### Thinking Humanly

- Based on the **cognitive modelling approach**: build a precise cognitive model of exactly how humans think.
- Once a precise theory of mind exists, it can in principle be expressed as a computer program.
- **Example:** General Problem Solver (GPS), developed by Newell & Simon in 1961, attempted to synthesize the human problem-solving process.
- **Critique:** Lacks scientific theories of the internal activities of the brain, so it is not currently possible to build machines that think exactly like a human brain does.

### Acting Humanly: The Turing Test

*(Frequently asked directly: "What is the Turing Test and its importance in AI?")*

- This approach models exactly how humans **act**, rather than how they think: i.e., models of human behavior (what people do, not how they think).
- Alan Turing's relevant papers asked: *"Can machines think?"* and *"Can machines behave intelligently?"*
- Turing (1950), in the paper *Computing Machinery and Intelligence*, proposed what became known as the **Turing Test**.

**The Turing Test:**
- Turing defined intelligent behavior as the ability to achieve human-level performance in all cognitive tasks, sufficient to fool a human interrogator.
- Setup: an interrogator communicates (via text) with two hidden respondents: one human, one machine, and must decide which is which.
- If the interrogator is wrong roughly half the time, the machine is considered to have demonstrated human-like intelligence.

**Factors required for a machine to pass the Turing Test:**
1. **Natural Language Processing (NLP)**: to communicate successfully in a human language.
2. **Knowledge Representation**: to store what it knows or hears.
3. **Automated Reasoning**: to use the stored information to answer questions and draw new conclusions.
4. **Machine Learning**: to adapt to new circumstances and to detect and extrapolate patterns.

*(Frequently asked directly: "Does passing the Turing Test prove that a computer is truly intelligent?")*

**Does passing the Turing Test prove real intelligence?** This is a recurring discussion-style PYQ. Key points to argue:
- The Turing Test only measures a machine's ability to *imitate* human conversational behavior: it is a test of behavioral equivalence, not of internal understanding or consciousness.
- **Critics' argument (e.g., Searle's "Chinese Room" argument, commonly cited):** a system could manipulate symbols convincingly enough to fool an interrogator without actually "understanding" anything, i.e., simulation of intelligent behavior is not the same as possessing genuine intelligence or consciousness.
- Supporters argue that if a machine's behavior is functionally indistinguishable from a human's across all cognitive tasks, denying it "intelligence" becomes a matter of philosophical definition rather than a practical, testable difference.
- **Practical limitation:** the test is also sensitive to superficial factors
    - a machine might fool an interrogator through deception or a poorly designed test rather than genuine reasoning, and conversely a genuinely intelligent system that reasons in a non-human-like manner could fail the test.
- **Conclusion to write in exam:** Passing the Turing Test is strong evidence of sophisticated language and reasoning ability, but it does not conclusively prove "intelligence" in the deeper cognitive/conscious sense: it is a practical, behaviorist benchmark rather than a definitive theoretical proof.

### Thinking Rationally: The "Laws of Thought" Approach

- Models how ideal agents "should think," with emphasis on correct inference
    - this is the origin of the term **rational agent**.
- **Formal logic** provides precise notation for statements and their relations, and a reasoning system can then apply logical rules to solve problems.
    - Classic example: *Socrates is a man; all men are mortal; therefore Socrates is mortal.*
- **Critique:** It is not easy to take informal, real-world knowledge and state it formally enough for logical notation, especially under uncertainty.

### Acting Rationally: The Rational Agent Approach

*(Frequently asked directly: "What is a rational agent?")*

- Perfect rationality is not always achievable in complex, real-world environments.
- A **rational agent** acts to achieve the best expected outcome, given the available beliefs/evidence, even under uncertainty.
- Acting rationally means achieving one's goals based on one's beliefs.
- This approach models how ideal agents "should act", the actions taken must be rational, but not necessarily the result of formal, human-style rational *reasoning* (e.g., a reflex action can still be rational).
- It is more of a **black-box / engineering approach**: what matters is that the agent behaves rationally, not how internally "human-like" its reasoning process is.

**"Systems that think like humans" vs "systems that act like humans":
- justification with example:**
- The "thinking humanly" school (cognitive modelling) tries to replicate the human reasoning *process* itself,
- while "acting humanly" (Turing Test tradition) only cares about matching human *behavior/output*,
- regardless of the internal mechanism.
- Example:
    - a chess-playing program using brute-force minimax search
    - plays like a strong human without literally replicating a human's intuitive thought process,
    - it belongs to "acting" rather than "thinking" humanly.

---

## 1.3 Natural (Human) Intelligence vs Artificial Intelligence

*(Frequently asked directly: "Differentiate between Natural Intelligence and Artificial Intelligence. Can AI replace humans?")*

| Aspect | Natural (Human) Intelligence | Artificial Intelligence |
|---|---|---|
| Origin | Biological, evolved over millions of years | Engineered by humans using algorithms and data |
| Learning basis | Learns from lived experience, emotion, and context | Learns from data, patterns, and predefined objective functions |
| Creativity & intuition | Genuine creativity, emotional and ethical intuition | Simulated creativity; pattern recombination from training data |
| Adaptability | Naturally generalizes across completely novel, unseen situations | Often narrow; generalizes only within/near its training distribution (except AGI, which is not yet realized) |
| Consciousness | Self-aware, has subjective experience | No verified consciousness or genuine understanding |
| Speed & scale | Limited by biology (fatigue, memory limits) | Can process huge data volumes very fast, tirelessly |
| Error type | Errors from fatigue, bias, emotion | Errors from bad/biased training data, edge cases, lack of common sense |
| Energy efficiency | Very energy-efficient (the human brain runs on ~20W) | Often energy-intensive, especially large models |

**Can AI replace humans? (justify):**
- AI already **outperforms** humans in narrow, well-defined domains: large-scale data processing, repetitive tasks, certain pattern-recognition tasks (e.g., beating world champions at chess/Go), and speed of computation.
- However, AI currently **lacks**: genuine consciousness, common-sense reasoning outside its trained domain, emotional understanding, ethical judgment grounded in lived experience, and true general-purpose adaptability (Artificial General Intelligence does not yet exist).
- Many roles require human judgment, empathy, creativity, and accountability (e.g., medicine, law, leadership, caregiving) that current AI cannot genuinely replicate, it can *assist* and *augment* these roles rather than fully replace them.
- **Conclusion to write in exam:** AI can replace humans in specific, narrow, repetitive, or data-heavy tasks, but cannot (at least with current technology) fully replace humans in tasks requiring general intelligence, consciousness, empathy, or ethical/contextual judgment. AI is best understood as augmenting human capability rather than wholesale replacing it.

---

## 1.4 Importance of Artificial Intelligence

- Automation of repetitive tasks
- Improved decision making
- Enhanced customer experience
- Increased efficiency and productivity
- Better resource management
- Advancements in scientific research
- Increased safety and security

---

## 1.5 AI and Related Fields

Different fields have contributed to AI in the form of ideas, viewpoints, and techniques:

- **Philosophy:** Logic, reasoning, mind as a physical system, foundations of learning, language and rationality.
- **Mathematics:** Formal representation and proof algorithms, computation, undecidability, intractability, probability, statistics, linear algebra, calculus.
- **Psychology:** Adaptation, phenomena of perception and motor control.
- **Economics:** Formal theory of rational decisions, game theory.
- **Linguistics:** Knowledge representation, grammar.
- **Neuroscience:** Physical substrate for mental activities.
- **Control theory:** Stability, optimal agent design.

---

## 1.6 Brief History of AI

*(Frequently asked directly: "Discuss the brief history of AI with chronological development.")*

| Year | Milestone |
|---|---|
| 1943 | McCulloch & Pitts: Boolean circuit model of the brain |
| 1950 | Turing's *Computing Machinery and Intelligence* |
| 1956 | Dartmouth meeting: the term "Artificial Intelligence" is adopted |
| 1950s | Early AI programs: Samuel's Checkers Program, Newell & Simon's Logic Theorist, Gelernter's Geometry Engine |
| 1965 | Robinson's complete algorithm for logical reasoning (resolution) |
| 1966–73 | AI discovers computational complexity; early neural network work |
| 1969–79 | Early development of knowledge-based / expert systems |
| 1980 | AI becomes an industry |
| 1986 | Neural networks return to popularity |
| 1987 | AI becomes a science (more rigorous, empirical methodology) |
| 1995 | Emergence of intelligent agents as a unifying paradigm |

---

## 1.7 Applications of AI

*(Frequently asked directly: "Discuss any two fields of your daily life where AI has been applied.")*

- **Game playing:** IBM's Deep Blue became the first computer program to defeat a reigning world chess champion, beating Garry Kasparov 3.5–2.5 in an exhibition match in 1997.
- **Autonomous control:** The ALVINN computer-vision system was trained to steer a car and keep it in its lane. Installed in CMU's NavLab computer-controlled minivan, it steered the vehicle for 2,850 miles, in control 98% of the time (a human took over for the remaining 2%, mostly at exit ramps). NavLab's video cameras transmitted road images to ALVINN, which computed the best steering direction based on experience from prior training runs.
- **Language understanding and problem solving**
- **Business intelligence**
- **Medical diagnosis**
- **Scientific analysis**
- **Weather forecasting**
- **AI Today (further real-world deployments):**
    - Diagnosing lymph-node diseases
    - Monitoring space shuttle missions
    - Automatic vehicle control
    - Large-scale scheduling
    - Detection of money laundering
    - Classifying astronomical objects
    - Speech understanding systems
    - Beating world-class human players at chess, checkers, and backgammon

### Example: ELIZA

- **ELIZA** was a program that simulated a psychotherapist interacting with a patient, and is often cited as an early system that could fool people in a Turing-Test-like manner.
- Coded at MIT during 1964–1966 by Joseph Weizenbaum.
- The first script used was called **DOCTOR**.
- The script was simply a collection of syntactic patterns, not unlike regular expressions; each pattern had an associated reply that could reuse fragments of the input (after simple transformations, e.g., "my" → "your").
- Weizenbaum was reportedly shocked at people's reactions:
  - Psychiatrists thought the approach had real clinical potential.
  - Ordinary users unequivocally anthropomorphized the program, treating it as if it genuinely understood and cared about them.

### Is AI Ethical?

Weizenbaum, in *Computer Power and Human Reason*, argues:
- A genuinely capable AI would be an autonomous, intelligent agent, and therefore out of our control.
- It would not necessarily share human motives, constraints, or ethics.
- There may be no obvious upper bound on machine intelligence
    - perhaps no upper bound at all.
- When human interests and an AI's interests conflict, it is not guaranteed that humans would come out ahead.
- On this reasoning, Weizenbaum concludes that AI research is, in a meaningful sense, unethical to pursue unchecked.

### AI Topics (broad subfields)

- Robotics
- Search
- Planning
- Machine Learning
- Image Processing
- Expert Systems
- Natural Language Processing

### Programming Languages in AI

- **Prolog**
  - First Prolog program for AI written in France, 1970.
  - Major development work at the University of Edinburgh, 1975–79.
  - A logic programming language: programs are composed of facts and rules.
- **LISP**
  - Proposed by John McCarthy in the late 1950s; a contemporary of COBOL and FORTRAN.
  - A functional programming language.
  - Supports an interactive interpreter as well as a compiler.

---

## 1.8 Intelligent Agents

*(One of the most repeated topics in this chapter)*

An **agent** is anything that can be viewed as **perceiving its environment through sensors** and **acting upon that environment through actuators**, and that can learn from the environment to achieve its goals.

**Ideal rational agent:**
- Should do whatever action is expected to maximize its **performance measure** (an objective criterion for the success of the agent's behavior), given the evidence provided by its percept sequence and whatever built-in knowledge it has.
- Classic example: the vacuum-cleaner agent.

![Agent with sensor and effectors](attachments/agent%20with%20sensor%20effectors.png)

### PEAS Framework

*(Frequently asked directly: "Explain PEAS for a Medical Diagnosis System.")*

Every rational agent can be specified using the **PEAS** framework:

- **P : Performance measure:** the criteria used to judge how successful the agent's behavior is.
- **E : Environment:** the world the agent operates in.
- **A : Actuators:** the mechanisms through which the agent acts on the environment.
- **S : Sensors:** the mechanisms through which the agent perceives the environment.

**Worked PEAS examples:**

**Taxi driver**
- Performance measure: safe, fast, legal, comfortable trip; maximize profits.
- Environment: roads, other traffic, pedestrians, customers.
- Actuators: steering wheel, accelerator, brake, signal, horn.
- Sensors: cameras, sonar, speedometer, GPS, odometer, engine sensors.

**Medical Diagnosis System**
- Performance measure: healthy patient, minimize costs, minimize lawsuits.
- Environment: patient, hospital, staff.
- Actuators: screen display (questions, tests, diagnoses, treatments, referrals).
- Sensors: keyboard (entry of symptoms, findings, patient's answers).

**Part-picking robot**
- Performance measure: percentage of parts placed in the correct bins.
- Environment: conveyor belt with parts, bins.
- Actuators: jointed arm and hand.
- Sensors: camera, joint-angle sensors.

**Medicine-delivery drone**
- Performance measure: medicine delivered intact, to the right address, within the time window; maximize payload per charge; no collisions; no airspace violations.
- Environment: air corridor, buildings, terrain and hills, trees and power lines, weather and wind, other drones/aircraft, the recipient, the dispatch centre.
- Actuators: rotors and motors, payload-release hatch, landing gear, status lights, radio downlink to the dispatch centre.
- Sensors: GPS, camera, LIDAR or ultrasonic altimeter, IMU and gyroscope, barometer, wind/temperature sensors, battery gauge, radio uplink.

### Types of Agents

*(Frequently asked directly: "Differentiate between the different types of intelligent agent with examples.")*

There are five basic agent types, arranged in **order of increasing generality**
    - each type below can, in principle, be built out of the ones before it,
    - with progressively more sophisticated internal machinery.

#### 1. Table-Driven Agent

![Block Diagram for Table Driven Agent](attachments/agent-table-driven.png)

- The simplest conceivable agent: it consults a **percept-sequence → action** table stored in memory to decide its next action.
- Implemented as a (typically very large) lookup table mapping every possible percept sequence the agent might ever encounter to an action.
- **Limitation:** the table can become astronomically large for any non-trivial environment (since it must have one entry per possible percept *sequence*, not just per percept), it has to be built in advance by hand, and it has no ability to generalize to percept sequences not already in the table. It is more of a theoretical baseline than a practical design.

#### 2. Simple Reflex Agent

![Simple Reflex Agent block diagram](attachments/agent-simple-reflex.png)

- Selects actions using **condition–action rules** ("if condition then action"), typically implemented via a production system.
- It works by finding a rule whose condition matches the current percept and then executing the associated action.
- These agents are **stateless**: they have no memory of past world states, and decide purely from the current percept.
- **Limitation:** works only in environments that are fully observable from the current percept alone; fails in partially observable environments where the correct action depends on history (e.g., it cannot tell whether it has already visited a location).

#### 3. Model-Based Reflex Agent

![Model-based Reflex Agent block diagram](attachments/agent-model-based-reflex.png)

- Extends the simple reflex agent by maintaining an **internal state** that tracks aspects of the world not visible in the current percept.
- This internal state is updated using a **model of the world**
    - knowledge of how the world evolves and how the agent's own actions affect it.
- This allows the agent to handle **partially observable environments**, since it can rely on its internal state to fill in what it currently cannot directly perceive.

#### 4. Goal-Based Agent

![Goal based agents block diagram](attachments/agent-goal-based.png)

- In addition to state information, goal-based agents maintain **goal information** describing desirable situations to be achieved.
- Unlike reflex agents, they consider **future consequences of actions**
    - essentially performing a form of search or planning to choose actions that will lead toward the goal.
- More flexible than reflex agents since the goal can be changed without redesigning the agent's rules, but computationally more expensive since it may need to search over possible action sequences.

#### 5. Learning Agent (incl. Utility-Based Agents)

![Learning agents block diagram](attachments/agents-learning-utility.png)

- A **utility-based agent** extends the goal-based agent by using a **utility function**
    - a mapping from world states to a real number indicating "degree of happiness"
    - rather than a simple binary goal-satisfied/not-satisfied criterion.
    - This allows it to choose rationally between multiple ways of achieving a goal
    - e.g., picking the fastest or cheapest of several valid routes
    - and to weigh trade-offs when goals conflict,
    - including reasoning under uncertainty using expected utility.
- A **learning agent** goes a step further by having the ability to **improve its own performance over time** through experience,
    - rather than relying solely on a fixed, hand-designed set of rules or a static utility function. A learning agent is generally composed of four conceptual components:
    - **Learning element:** responsible for making improvements based on feedback from the environment.
    - **Performance element:** responsible for selecting external actions (this is essentially the whole agent as described in the earlier, non-learning designs).
    - **Critic:** provides feedback to the learning element on how well the agent is doing, measured against a fixed performance standard.
    - **Problem generator:** suggests exploratory actions that may not be optimal in the short run but could lead to better long-run performance (uncovering new, potentially better strategies).

---

## 1.9 Definition and Importance of Knowledge and Learning

### Knowledge

- Knowledge is the insight and understanding gained by processing and analyzing information.
- It can include knowledge about patterns, relationships, and correlations within data, represented in the form of models or mathematical relationships.
- Key issues confronting the designer of an AI system:
  - **Knowledge acquisition:** gathering the knowledge from the problem domain.
  - **Knowledge representation:** expressing the identified knowledge in a usable form.
  - **Knowledge manipulation:** manipulating the represented knowledge to draw conclusions from the knowledge base.

### Information vs Knowledge vs Intelligence

| | Information | Knowledge | Intelligence |
|---|---|---|---|
| Definition | Raw data or facts that have been collected or received | The organized and structured information that has been processed, analyzed, and understood | The ability to learn, reason, and adapt to new situations |
| Form | Often stored in a structured format, such as a database | Often stored as rules, procedures, or models that can be used to solve problems or make decisions | Often associated with human-like cognitive abilities, such as language, perception, and creativity |
| Use | Can be accessed or processed by humans or machines | Can be used to solve problems or make decisions | Can be used to create intelligent systems and solve complex problems |
| Example | V = 12, I = 6, R = 2 <br> V = 24, I = 12, R = 2 | V = I × R | Using V = IR to design an electronic circuit |
| Relationship | Information is the input to the knowledge-acquisition process | Knowledge is the result of processing and understanding information | Intelligence is the ability to use knowledge to solve problems and adapt to new situations |

### Learning (vs Knowledge)

*(Frequently asked directly: "Learning is an essential characteristic for intelligent agents, justify.")*

- Learning is the process of constructing or modifying representations of what is being experienced.
- It denotes changes in a system that are **adaptive**, in the sense that they enable the system to perform the same task **more efficiently and more effectively** the next time.
- Learning is the phenomenon of knowledge acquisition **in the absence of explicit programming**.

Learning involves three key factors:
1. **Changes**: determining the optimum state/parameters and a suitable internal representation.
2. **Generalization**: performance must improve on similar, not just identical, tasks.
3. **Improvement**: the system becomes more efficient and effective on subsequent attempts.

**Justification that learning is essential for intelligent agents:**
- A purely reflex or fixed-rule agent can only perform as well as its designer anticipated at design time,
- and cannot adapt to environments or situations the designer did not foresee.
- Learning allows an agent to improve autonomously from experience,
- generalize to novel situations, and correct its own errors over time without this,
- an agent's competence is permanently capped by its initial programming.
- This is why "learning" is treated as one of the four core factors
- alongside NLP, knowledge representation, and automated reasoning
- required for a machine to exhibit genuinely intelligent behavior,
- as in the Turing Test criteria above.

--- 
