# <img src='https://github.com/adriandavila/spectra-graph/blob/main/docs/assets/logo/icon.png?raw=true' width='30' alt="Spectra-Graph Logo"> Spectra-Graph Planning

The core functionality of the spectra-graph program will revolve around drawing graphs on an infinite plane.

## Modelling the problem

The basic structure of the graph can be modelled as follows:

```python
@dataclass
class Node:
    id: NodeId
    width: int    # width of drawing
    height: int   # height of drawing
    weight: int   # weight of node (increases attraction)

@dataclass
class Edge:
    source: NodeId
    target: NodeId
```

We also want to be able to constrain a graph - both the position of the nodes and the routes the edges take. There are two types of constraints: absolute & relative.

An absolute constraint would be fixing the position of a node or fixing the route an edge takes

```python
@dataclass 
class AbsoluteConstraint:
    pass

@dataclass
class FixedNodeLocation(AbsoluteConstraint):
    x: float
    y: float

@dataclass
class FixedRouteConstraint(AbsoluteConstraint):
    # not sure how to represent this yet
```

A relative constraint would be specifying things like "node A should be to the left of node B", expressed as `RelativeNodeLocation(source=A, target=B, direction=W)`

```python
@dataclass
class RelativeConstraint:
    pass

@dataclass
class RelativeNodeLocation(RelativeConstraint):
    source: NodeId
    target: NodeId
    direction: enum{N, NE, E, SE, S, SW, W, NW}
```

## Supported graphs

The program would aim to support a range of graphs, from fully constrained graphs to fully unconstrained graphs, and anything in the middle. Some examples of graphs that could be fun to test out are:

- something topological (i.e. neural network layer graph - hierarchy represented through relative constraints)
- something where every Node has a constraint (i.e. drawing an abstracted chip)

## Other considerations

- The goal is to write the package in C++ and distribute through PyPi
- pybind for the interface?
- how do we use this in an e2e flow?
- how long is acceptable for a compilation?

## Program Output

We would want to output a collection of placed nodes and routed edges.

```python
@dataclass
class PlacedNode(Node):
    x: float
    y: float

@dataclass
class RoutedEdge(Edge):
    # not sure how to model this
```
