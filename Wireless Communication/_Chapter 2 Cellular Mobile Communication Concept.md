# Background

- in wireless telephony, a **cell** is the geographical area covered by a cellular telephone transmitter.
- the transmitter facility tiself is called the **cell site**.
- teh cellular conept was a amjor breakthrough in solving the problem of **spectral congestion** and **user capacity**.
- It offered very high capacity in a limited sepctrum allocation without any major technological changes

## Cellular Concept

The cellular concept has the following system level ideas
- replacing a single, high power tranmitter with many low power transmistters, each providing coverage to only a small area.
- Neighboring cells are assigned different groups of channels in order to minimize interference
- The same set of channels is then reused at different geographical locations.
- each base station (**BS**) is allocated a portion of total no. of channels avialable to entire system.
- nearby base station are assigned different groups of channels so that all the avialable channels are assigned to a relatively small no. of neighboring base stations.
- Nearby BS are assigned different groups of channel so that interference between BS is minimized.
- When designing a cellular mobile communication system, it is important to provide good coverage and services in a high user-density area.
- Cellular advantage:
    - the use of low power transmitter
    - an allowance for frequency reuse.

## Cell Footprint

- The actual radio coverage of a cell is known as cell footprint
- Irregular cell structure and irregular placing of the transmitter may not be acceptable in the initial system in the initial system design.
- However, as traffic grows, where new cells and channels need to be added,
    - it may lead to inability to reuse frequencies because of co-channel interference.
- For systematic cell planning, a regular shape is assumed for the footprint
- Coverage contour should be circular.
    - However, it is impractical because it provides ambiguous areas with either multiple or no coverage.
- Due to economic reasons, the hexagon has been chosen due to its maximum area coverage.
- Hence a conventional cellular layout is often defeind by a uniform grid of regular hexagons.

# Frequency Reuse

- each cellular base station is allocated a group of radio channels within a small geographic area called a cell.
- Neighboring cells are assigned different channel groups.
- By limiting the coverage area to within the boundary of the cell, teh channel groups may be reused to cover different cells.
- Keep interference levels within tolerable limits.

Real world planning
- Consider a cellular system which has a total of $S$ duplex channels
- Each cell is associated with a group of $k$ channels, $k < S$.
- The $S$ channels are divided among $N$ cells.
- The total number of available radio channels: $S = kN$
- The $N$ cells which use the complete set of channel is called cluster.
- The cluster can be repeated $M$ times within the system.
- The total number of channels, $C$, is used as a measure of capacity.
    $$C = MkN = MS$$
- The capacity is directly proportional to the number of replication, $M$.
- The cluster size, $N$, is typically equal to 4, 7, 12.
- Small $N$ is desirable to maximize capacity.
- The frequency reuse factor is given by $1/N$
- for small $N$, we have to consider the co-channel interference.

## Terminology

- Cluster Size
    - The $N$ cells which collectively use teh complete set of avialable frequency is called the cluster size.
    - ![Illustration of cellular frequency reuse concept](attachments/cluster-description.png)
- Co-channel cell
    - the set of cells using the same set of frequencies as the target cell.
- Interference Tier
    - a set of co-channel cells at the same distance from the reference cell is called an interference tier.
    - The set of closet-co-channel cell is called first tier.
    - There is always 6 co-channel cells in the first tier.
    - example as a figure:
    - ![Interference-tier representation](attachments/interference-tier.png)
- Cluster Size
    - given by $N = i^2 + ij + j^2$
    - where, i = movement in perpendicular direction to any of 6 surfaces of original cell
    - j = movement of $60^0$ counter-clockwise/clock-wise to reach adjacent co-channel cell.
    - ![Calculation of N as cluster size](attachments/cluster-size-example.png)

## Channel Assignment Strategies

- Frequency reuse scheme
    - increases capacity
    - minimze interference
- Channel assignment strategy
    - fixed channel assignment
        - each cell is allocated a predetermined set of voice channel
        - any new call attempt can only be served by the unused channels
        - the call will be blocked if all channels in that cell are occupied
    - dynamic channel assignment
        - channels are not allocated to cells permanently
        - allocate channels based on request.
        - reduce the likelihood of blocking, increase capacity.

# Handoff Strategies

- When a mobile moves into a different cell while a conversation is in progress, the MSC automatically transfers the call to a new channel belonging to the new base station.
- Handoff operation
    - identifying a new base station
    - re-allocating the voice and control channels with the new base station
- Handoff Threshold
    - Minimum usable signal for acceptable voice quality (-90 dBm to -100 dBm)
    - Handoff margin $\Delta = P_{\text{r, handoff}} - P_{\text{r, minimum usable}}$ cannot be too large or too small.
    - Where, $P_{r, h}$ = received handoff signal power
        - $P_{r, m}$ = minmum usable handoff power
    - If $\Delta$ is too large, unnecessary handoffs burden the MSC
    - If $\Delta$ is too small, there may be insufficient time to complete handoff before a call is lost.
- Proper vs Improper Handoff
    - ![Handoff situations](attachments/handoff-proper-vs-improper.png)
- Must ensure that the drop in measured signal is not due to momentary fading and that the mobile is actually moving away from the serving base station.
- Running average measurement of signal strength should be optimized so that unnecessary handoffs are avoided.
    - Depends on the speed at which the vehicle/mobile is moving
    - For steep short term average, the handoff should be made quickly
    - the speed can be estimated from the statistics of the received short-term fading signal at the base station
- Handoff Measurement
    - in first generation analog cellular systems, signal strength measurements are made by the base station and supervised by the MSC.
    - in 2nd generation systems (TDMA), handoff decisions are mobile assisted, called mobile assisted handoff (MAHO)
- Intersystem handoff
    - if a mobile moves from one cellular system to a different celllular system controlled by a different MSC.
- Handoff requests is much important than handling a new call
    - to maintain Grade of Servie (GOS)

## Practical Handoff Consideration

- Different type of users
    - High speed users need frequent handoff during a call.
    - Low speed users may never need a handoff during a call.
- **Microcells** to provide capacity, the MSC can become burdened if high speed users are constantly being passed between very small cells.
- **Considerations**:
    - Minimze handoff intervention
        - handle the simultaneous traffic of high speed and low speed users.
    - Large and small cells can be located a singl elocation (umbrella cell)
        - different antenna height
        - different power level
        - Figure representing Umbrella cell:
            - ![Large umbrella cell for traffic](attachments/handoff-umbrella.png)
    - Cell dragging problem
        - pedestrian users provide a very strong signal to the base station (due to LoS)
        - The user may travel deep within a neighboring cell
- On average:
    - femtocell: reach 10m
    - pico cell: 200m
    - microcell: 2km
    - macro cell: 10s of km

## Evolution of handoff

- Handoff for 1st generation analog cellular systems:
    - 10 second handoff time
    - $\Delta$ is in the order of 6dB to 12dB
- Handoff for second generation cellular systems, e.g., GSM
    - 1 to 2 seconds handoff time
    - mobile assists handoff (MAHO)
    - $\Delta$ is between 0dB and 6dB
    - Handoff decisions based on **signal strength**, **co-channel interference** and **adjacent channel interference**
- IS-95 CDMA spread spectrum cellular system
    - Mobiles share the channel in every cell.
    - No physical change of channel during handoff
    - MSC decides the base station with the best receiving signal as the service station

## Handover Indication

- each BS constantly monitors the signal strengths of all of its reverse voice channels to determine the relative location of each mobile user with respect to the BS.
- This information is forwarded to MSC who makes decisions regarding handover.
- Mobile assisted handover (MAHO): 
    - the mobile station measures the received power from surrouding BSs and continually reports the results of these measurements to the serving BS.

## Prioritizing Handover

- Dropped call is considered a more serious event than call blocking.
    - Channel assignment schemes therefore must give priority to handover requests
    - A fraction of the total available channels in a cell is reserved only for handover requests.
    - However, this reduces the total carried traffic
    - Dynamic allocation can improve this.
- Queuing of handover requests is another method to decrease the probability of forced terminatino of a cell due to a lack of available channel.
    - the time span over which a handover is usually required leaves room for queueing handover request.

## Practical Handover

- A hard handoever does "break before make"
    - the old channel connection is broken before the new allocated channel connection is setup.
    - this obviously can cause call dropping
- In soft handover, we do "make before break"
    - the new channel connection is established before the old channel connection is released.
    - This is realized in CDMA where also BS diversity is used to improve boundary condition.
- Representative figure
    - ![Handover soft and hard](attachments/handover-soft-vs-hard.png)
