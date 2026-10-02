# Multi-processing and Multi-threading

## Multi-threading

- is a systm in which multiple threads are created of a process for increasing the computing speed of a system.
- in multithreading, many threads of a process are executed simultaneously.

General representation of multithreading in OS

```mermaid
flowchart TD
    G(Graphihc) -->|Thread| WP(Word Processor)
    K(Responding to Keystrokes) -->|Thread| WP
    GC(Grammar Check) -->|Thread| WP
    WP --> CPU
```

## Multi-processing

- multiprocessing is a system that has more than one or two processors.
- in multiprocessing, CPUs are added for increasing computing speed of teh system.
- because of multiprocessing, there are many processes thaht are executed simultaneously.
- can be classified into two categories
    - symmetric multiprocessing
    - asymmetric multiprocessing.

General representation of Multi-processing in OS

```mermaid
flowchart TB
    subgraph CPU1 ["CPU"]
        direction TB
        A[Register] --> B[Cache]
    end
    subgraph CPU2 ["CPU"]
        direction TB
        C[Register] --> D[Cache]
    end
    subgraph CPU3 ["CPU"]
        direction TB
        E[Register] --> F[Cache]
    end
    B --> G[Memory]
    D --> G
    F --> G
```

## Differences

| Multiprocessing | Multithreading |
| - | - |
| CPUs are added for increasing computing power | Many threads are created of a single process for increasing computing power |
| In Multiprocessing, Many processes are executed simultaneously | While in multithreading, many threads of a process are executed simultaneously |
| Multiprocessing are classified into Symmetric and Asymmetric | Multithreading is not classified in any categories |
| Process creation is a time-consuming process | Thread creation is not time-consuming |
| Every process owns separate address space | common address space for all threads. |

