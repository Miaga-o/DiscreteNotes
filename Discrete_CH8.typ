#set page("a4", numbering: "1 of 1")
//#set text(font: "")
//#show math.equation: set text(font: "Luciole Math", size: 10pt)
#show title: set text(size: 24pt)
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 2): set text(size: 18pt)
#show heading.where(level: 3): set text(size: 16pt)

#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes

#figure([
  #title([Discrete Mathematics Notes Part 3])
    #text(
    size: 16pt,
    [Miagao]
  )])
#outline()
#pagebreak()

//Functions and variables
#let theorem(num, body) = {
  box(
    stroke: blue,
    inset: 8pt,
    radius: 10pt,
    width: 100%,
    [#text(fill: blue, size: 14pt, [*Theorem #num:*]) \
    #body]
  )
}

#let lemma(num, body) = {
  box(
    stroke: blue,
    inset: 8pt,
    radius: 10pt,
    width: 100%,
    [#text(fill: blue, size: 14pt, [*Lemma #num:*]) \
    #body]
  )
}

#let corollary(num, body) = {
  box(
    stroke: blue,
    inset: 8pt,
    radius: 10pt,
    width: 100%,
    [#text(fill: blue, size: 14pt, [*Corollary #num:*]) \
    #body]
  )
}

#let definition(body) = {
  box(
    stroke: black,
    inset: 8pt,
    radius: 10pt,
    width: 100%,
    [#text(fill: black, size: 14pt, [*Definition:*]) \
    #body]
  )
}

#let example(title, body) = {
  box(
    stroke: navy,
    inset: 8pt,
    radius: 10pt,
    width: 100%,
    [#text(fill: navy, size: 14pt, [*Example:* #title]) \
    #body]
  )
}

#let varnothing = $text(font: "Fira Sans", nothing)$ //LaTeX ahh 





//Notes
= 8 Properties of Relations





== 8.1 Relations on Sets
- This section will review relations from Chapter 1.
- Recall that an element of one set may be related to another by a relation $R$ as long as they satisfy its definition.
#example([Less-than Relation], [
  A relation $L$ from $RR$ to $RR$ is defined as follows: \

  #set align(center)
  _For all real numbers $x$ and $y$,_
  $ x op(L) y <=> x < y $  
  #set align(left)

  - $53 op(L) 67$?
    - True, $ 53  < 67$.
  - $141 op(L) 141$?
    - False, $141 = 141$.
  - $12 op(L) -1$?
    - False, $12 > -1$.

    Additionally, $L$ may be graphed as a subset of $RR times RR$, the Cartesian plane using its rule, $x < y$.
    #figure(
      cetz.canvas({
        import cetz.draw: *

        set-style(
          content: (padding: 1pt)
        )

        line((0,0), (0,-2), mark: (end: "stealth"))
        line((0,0), (0,2), mark: (end: "stealth"))
        content((), $y$, anchor: "west", padding: 4pt)

        line((0,0), (-2,0), mark: (end: "stealth"))
        line((0,0), (2,0), mark: (end: "stealth"))
        content((), $x$, anchor: "west", padding: 2pt)
      

        line((-2,-2), (2,2), stroke: (paint: blue, dash: "dashed"), fill: black)

        content((-1,1), [#text(fill:blue, $x<y$)])
      })
    )
])

#example([Congruence Modulo $2$ Relation],[
  A relation $E$ from $ZZ$ to $ZZ$ is defined as follows: \
  
  #set align(center)
  _For every $(m, n) in ZZ times ZZ$,_
  $
    m op(E) n <=> m-n "is even"
  $
  #set align(left)

  - Prove that if $n$ is any odd integer, then $n op(E) 1$.
  *Proof:* \
  Suppose $n$ is any odd integer.  \
  By definition of odd, $n = 2k+1$ for some integer $k$. \
  By definition of $E$, $n op(E) 1$ if, and only if, $n-1$ is even. \
  By substituion,
  $ 2k+1 op(E) 1 <=> 2k+1-1 " is even" $
  As said earlier, $k$ is an integer, so by extension, $2k$ is even by definition of even. \
  - Therefore, $n op(E) 1$.

  - Notably, integers $m$ and $n$ are only related by  $E$ if, and only if,
  $ m op("mod" 2) = n op("mod") 2 $
  - This means that $m$ and $n$ are *congruent modulo $2$*.
])

This may also apply to modulo relations other than 2. For example, 
if $T$ is defined from $ZZ$ to $ZZ$ as follows:

#set align(center)
_For all integers $m$ and $n$_
$
  m op(T) n <=> 3 divides (m-n)
$
#set align(left)
then $m$ and $n$ are *congruent modulo 3* by the relation $T$.




#pagebreak()
=== Inverse Relations
#definition([
  Let $R$ be relation from $A$ to $B$. The inverse relation $R^(-1)$ may be defined as follows:
  $ R^(-1) = {(y,x) in B times A | (x,y) in R} $
])

- Or, more formally,
$
  forall x in A " and " y in B, space \
  (y,x) in B times A <=> (x,y) in R
$
- The arrow diagram for an inverse relation may be found by reversing the direction of the arrows.

#example([Finite Relation Inverse],[
  Given $A={2,3,4}$ and $B={2,6,8}$, \
  let $R$ be the _divides_ relation from $A$ to $B$ defined as follows:

  #set align(center)
  _For every ordered pair $(x,y) in A times B$,_
  $
    x op(R) y <=> x divides y
  $
  #set align(left)
  - What are the ordered pairs of $R$ and $R^(-1)$?
  $
    R &= {(2,2), (2,6), (2,8), (3,6), (4,8)} \ 
    R^(-1) &= {(2,2), (6,2), (8,2), (6,3), (8,4)} 
  $
  Inverses for finite relations are easy to express explicitly 
  because all values of $R$ can be listed before being reversed.

  #figure(
      diagram(
        node-fill: none,
        node-stroke: 1.4pt,
        edge-stroke: 1.5pt,
        node((-3.5, -0.5), text(fill: blue, [*$A$*]), stroke: 0pt),
        edge((0.5, -0.5), "-|>", $R$, bend: 20deg, layer: 100),
        node((-3.5, 0.5), [$2$], fill: blue.lighten(65%), stroke: blue),
        edge((0.5, 0.5)),
        edge((0.5, 1.3)),
        edge((0.5, 2.1)),
        node((-3.5, 1.3), [$3$], fill: blue.lighten(65%), stroke: blue),
        edge((0.5, 1.3)),
        node((-3.5, 2.1), text[$4$], fill: blue.lighten(65%), stroke: blue),
        edge((0.5, 2.1)),
        node((-3.5, 3.3), stroke: 0pt),
        edge((0.5, 3.3), "<|-", bend: -20deg, $R^(-1)$),

        
        node((0.5, -0.5), text(fill: red, [*$B$*]), stroke: 0pt),
        node((0.5, 0.5), [$2$], fill: red.lighten(65%), stroke: red),
        node((0.5, 1.3), [$4$], fill: red.lighten(65%), stroke: red),
        node((0.5, 2.1), [$8$], fill: red.lighten(65%), stroke: red),
      )
    )
])

#example([Infinite Relation Inverse],[
  Let $R$ be a relation from $RR$ to $RR$ defined as follows:

  #set align(center)
  _For every ordered pair $(x,y) in RR times RR$_
  $
    x op(R) y <=> y = 2|x|
  $
  #set align(left)

  - If the graph of $R^(-1)$ are drawn on the Cartesian plane, will it be a function?
    - Using $R$'s definition, $R^(-1)$ may be expressed as a function of $y$.
    $
      R^(-1) = {(y,x) in RR | x=2|y|}
    $
    #figure(
      cetz.canvas({
        import cetz.draw: *
        line((0,0), (0,-2), mark: (end: "stealth"))
        line((0,0), (0,2), mark: (end: "stealth"))
        content((), $y$, anchor: "west", padding: 4pt)

        line((0,0), (-2,0), mark: (end: "stealth"))
        line((0,0), (2,0), mark: (end: "stealth"))
        content((), $x$, anchor: "west", padding: 2pt)

        line((0,0), (1,2), stroke: red)
        line((0,0), (-1,2), stroke: red)
        content((-1.5,1.3), [#text(fill:red, $y=2|x|$)])

        line((0,0), (2,1), stroke: blue)
        line((0,0), (2,-1), stroke: blue)
        content((1.7,0.3), [#text(fill:blue, $x=2|y|$)])
      })
    )

    - Given this, the following tables may be procured:
    #set align(center)
    #grid(
      columns: 2,
      column-gutter: 100pt,
      [#table(
        columns: 2,
        fill: (x, y) => if y == 0 {red},
        table.header([*$x$*], [*$y$*]),
        [$0$], [$0$], [$1$], [$2$], [$-1$], [$2$], [$2$], [$4$], [$-2$], [$4$]
      )],
      [#table(
        columns: 2,
        fill: (x, y) => if y == 0 {blue},
        table.header([*$y$*], [*$x$*]),
        [$0$], [$0$], [$2$], [$1$], [$2$], [$-1$], [$4$], [$2$], [$4$], [$-2$]
      )]
    )
    #set align(left)
    - From the table above, it can be seen that $R^-1$ has two $x$-values for each $y > 0$. For instance, both $(2,1)$ and $(2,-1)$ are in $R^(-1)$, so it is not a function.
])





=== Directed Graph of a Relation
#definition([A *relation on a set* $A$ is a relation from $A$ to $A$.])
- In this case, if a relation $R$ is defined on set $A$, then the relation's arrow diagram may also be expressed as a *directed graph*.
- Elements related to themselves are expressed as a loop.

#example([Directed Graph of a Relation], [
  Let set $A= {3,4,5,6,7,8}$\
  Let a relation $R$ be defined on set $A$ as follows:

  #set align(center)
  _For every $x, y in A$,_
  $
    x op(R) y <=> 2 divides (x-y)
  $
  #set align(left)

  - A directed graph can be created as follows: 
  #figure(
    diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((-1, 0), [*8*], radius: 0.75em),
      edge((-1, 0), "-|>", bend: 160deg, loop-angle: 135deg),
      edge((1, 0), "-|>", bend: 20deg),
      edge((0, 2), "-|>", bend: 20deg),

      node((1,0), [*4*], radius: 0.75em),
      edge((1, 0), "-|>", bend: 160deg, loop-angle: 45deg),
      edge((-1, 0), "-|>", bend: 20deg),
      edge((0, 2), "-|>", bend: 20deg),

      node((-1, 1), [*7*], radius: 0.75em),
      edge((-1, 1), "-|>", bend: 160deg, loop-angle: 225deg),
      edge((1, 1), "-|>", bend: 20deg),
      edge((0, -1), "-|>", bend: 20deg),

      node((1, 1), [*5*], radius: 0.75em),
      edge((1,1), "-|>", bend: 160deg, loop-angle: 315deg),
      edge((0, -1), "-|>", bend: 20deg),
      edge((-1, 1), "-|>", bend: 20deg),

      node((0, -1), [*3*], radius: 0.75em),
      edge((0, -1), "-|>", bend: 160deg, loop-angle: 90deg),
      edge((1, 1), "-|>", bend: 20deg),
      edge((-1, 1), "-|>", bend: 20deg),

      node((0, 2), [*6*], radius: 0.75em),
      edge((0, 2), "-|>", bend: 160deg, loop-angle: 270deg),
      edge((-1, 0), "-|>", bend: 20deg),
      edge((1, 0), "-|>", bend: 20deg),
    )
  )

  Notice how every vertex in the directed graph connects to itself. 
  This means that every element in $A$ is related to itself by $R$.
  By extension, all vertices are only connected to vertices with the same parity.
])





=== *$N$*-ary Relations and Relational Databases
- Particular relations formed from Cartesian products of $n$ sets, known as $N$-ary relations, are the mathematical basis for relational database theory.
#definition([
  Given the sets $A_1, A_2, dots, A_n$, the *$n$-ary relation* on \
  $A_1 times A_2 times dots.h.c times A_n$ is a subset of $A_1 times A_2 times dots.h.c times A_n$. 
  The following special cases are defined as the following:
  - $2$-ary is *binary*.
  - $3$-ary is *tertiary*.
  - $4$-ary is *quaternary*.
])
In a database, these $n$-ary relations can be thought of as tables with $n$ 
columns with the headers $A_1, A_2, dots, A_n$.









#pagebreak()
== 8.2 Reflexivity, Symmetry, and Transitivity
#definition([
  Let $R$ be a relation on set $A$.

  + $R$ is *reflexive* $<=>$ for all $x in A$, $x op(R) x$.
  + $R$ is *symmetric* $<=>$ for every $x,y in A$, if $x op(R) y$, then $y op(R) x$.
  + $R$ is *transitive* $<=>$ for all $x,y,z in A$, if $x op(R) y$ and $y op(R) z$, then $x op(R) z$.
])

- Relating this back to directed graphs for relations, these properties may be identified graphically:
  + The reflexive property may be shown by loops on every vertex.
  + The symmetric property may be shown by connections between two vertices always being through opposite parallel edges.
  + The transitive property may be shown by there being no _incomplete directed triangles_.
- Logically, the following negations may be used to disprove them:
  + $R$ is *not reflexive* $<=> exists x in A$ such that $(x,x) in.not R$.
  + $R$ is *not symmetric* $<=> exists x,y in A$ such that if $(x,y) in R$, then $(y,x) in.not R$.
  + $R$ is *not transitive* $<=> exists x,y,z in A$ such that if $(x,y) in R$ and $(y,z) in R$, then $(x,z) in.not R$.

#example([Properties of Relations on Finite Sets], [
  Let $A = {0,1,2,3}$ and $R$, $S$, and $T$ be defined as follows:
  $
    R &= {(0,0), (0,1), (0,3), (1,0), (1,1), (2,2), (3,0), (3,3)} \
    S &= {(0,0), (0,2), (0,3), (2,3)} \
    T &= {(0,1), (2,3)}
  $

  - Is $R$ reflexive, symmetric, and/or transitive?
    - We can create a simple graph representing $R$.
    #figure(
      diagram(
        node-fill: none,
        node-stroke: 1pt,
        edge-stroke: 0.8pt,
        node((-1, 1), [*0*], radius: 0.75em),
        edge((-1, 1), "-|>", bend: 160deg, loop-angle: 135deg),
        edge((1,1), "-|>", bend: 20deg),
        edge((-1, 3), "-|>", bend: -20deg),
        node((1,1), [*1*], radius: 0.75em),
        edge((1, 1), "-|>", bend: 160deg, loop-angle: 45deg),
        edge((-1,1), "-|>", bend: 20deg),
        node((-1, 3), [*3*], radius: 0.75em),
        edge((-1, 3), "-|>", bend: 160deg, loop-angle: 225deg),
        edge((-1,1), "-|>", bend: -20deg),
        node((1, 3), [*2*], radius: 0.75em),
        edge((1,3), "-|>", bend: 160deg, loop-angle: 315deg)
      )
    )
    - $R$ is reflexive because there is a loop an each vertex in the directed graph.
    - $R$ is also symmetric because for each connection from one vertex to another, 
      there is a second connection from the second vertex to the first.
    - However, $R$ is not transitive because there is no complete 
      directed triangle on the directed graph (no directed edge from 1 to 3).
])

#pagebreak()
#example([_Properties of Relations on Finite Sets continued_], [
  - Is $S$ reflexive, symmetric, and/or transitive?
    - Similar to the first example, creating a directed graph makes this easier.
  
    #figure(
        diagram(
          node-fill: none,
          node-stroke: 1pt,
          edge-stroke: 0.8pt,
          node((-1, 1), [*0*], radius: 0.75em),
          edge((-1, 1), "-|>", bend: 160deg, loop-angle: 135deg),
          edge((-1, 3), "-|>"),
          edge((1,3), "-|>"),
          node((1,1), [*1*], radius: 0.75em),
          node((-1, 3), [*3*], radius: 0.75em),
          node((1, 3), [*2*], radius: 0.75em),
          edge((-1,3), "-|>")
        )
    )

    - $S$ is not reflexive because the only vertex with a loop is 0.
    - $S$ is not symmetric because when there are connections between vertices,
      it is only from one vertex to another.
    - $S$ is transitive because there is one case where a vertex is both directly 
      and transitively connected to a vertex ($0 -> 2 ->3$ and $0 -> 3$)
  
  - Is $T$ reflexive, symmetric, and/or transitive?
    - Again, we will create a directed graph to represent $T$.

    #figure(
        diagram(
          node-fill: none,
          node-stroke: 1pt,
          edge-stroke: 0.8pt,
          node((-1, 1), [*0*], radius: 0.75em),
          edge((1, 1), "-|>"),
          node((1,1), [*1*], radius: 0.75em),
          node((-1, 3), [*3*], radius: 0.75em),
          node((1, 3), [*2*], radius: 0.75em),
          edge((-1,3), "-|>")
        )
    )
    - $T$ is not reflexive because no vertices on the graph are connected to themselves via a loop.
    - $T$ is not symmetric because when there are connections between vertices, it is only from one vertex to another.
    - $T$ is not transitive because there only exists two edges in the graph.
])
  




=== Properties of Relations on Infinite Sets
- For proving relation properties on infinite sets, we have to refer back to their definitions
  - Recall that to prove that a relation is symmetric, we must prove
  $
    forall x,y in A, x op(R) y => y op(R) x
  $
- For instance, to prove an _equality_ relation on the set of all real numbers, we have to prove
  $
    forall x, y in RR, x = y => y = x
  $
- While these examples are intuitive, generalizing 
  from the generic particular is often neccessary to prove properties.

#example([Equality Relation], [
  Let $R$ be a relation defined on $RR$ as follows:
  
  #set align(center)
  _For all real numbers $x$ and $y$,_
  $
    x op(R) y <=> x=y
  $
  #set align(left)

  - Is $R$ reflexive?
    - Yes. $x$ is equal to itself, meaning that $x op(R) x$.
  - Is $R$ symmetric?
    - Yes. Equality is symmetric; $x = y => y=x$. Thus,\ $x op(R) y => y op(R) x$.
  - Is $R$ transitive?
    - Yes. Equality is transitive; $x = y$ and $y = z => x=z$. Thus, \ $x op(R) y  and y op(R) z=> x op(R) z$
])

#example([Properties of Congruence Modulo 3], [
  Let a relation $T$ be defined on $ZZ$ as follows:

  #set align(center)
  _For all integers $m$ and $n$,_
  $
    m op(T) n <=> 3 divides (m-n)
  $
  #set align(left)

  - Is $T$ reflexive?
    - *Proof:* \
      Suppose $m$ is a _particular but arbitrarily chosen_ integer such that $m op(T) m$.
      By definition of $T$,
        $
          3 divides (m-m) = 3 divides 0
        $
      By definition of divisiblity, $3$ divides $0$ because $0 = 0 dot 3$.
    - Thus, $T$ is reflexive.

  - Is $T$ symmetric?
    - *Proof:* \
      Suppose $m$ and $n$ are _particular but arbitrarily chosen_ integers such that $m op(T) n$. \
      By definition of $T$,
        $
          3 divides (m-n)
        $
      By definition of divisibility, $m-n = 3k$ for some integer $k$.
        $
          m - n &= 3k "for some integer" k \
          n - m &= 3(-k) "for some integer" k "by algebra"
        $
      $ZZ$ is closed under multiplication, so $-k$ is an integer. \
      Therefore, by definition of divisibility, $3 divides(n-m)$.
    - Thus, $T$ is symmetric.
])

#example([_Properties of Congruence Modulo 3 continued_], [
  - Is $T$ transitive?
    - *Proof:* \
      Suppose $m$, $n$, and $p$ are _particular but arbitrarily chosen_ integers such that $m op(T) n$ and $n op(T) p$. \
      By definition of $T$,
        $
          3 divides (m-n) "and" 3 divides (n-p)
        $
      By definition of divisibility, $m-n = 3r$ and $n-p = 3s$ for some integers $r$ and $s$.
        $
         (m-n) + (n-p) &= 3r + 3s "by adding both together" \
         m-p &= 3(r+s) "by algebra" \
        $
      $(r+s)$ is an integer because $ZZ$ is closed under addition. \
      Therefore, by definition of divisibility, $3 divides (m-p)$.
    - Thus, $T$ is transitive.
])





=== The Transitive Closure of a Relation
#definition([
  The *transitive closure* of $R$, denoted $R prime$, is a relation on set $A$
  that satisfies the following three properties:

  + $R^t$ is *transitive*.
  + $R subset.eq R^t$.
  + Given $S$, another transitive relation containing $R$,  $R^t subset.eq S$.
])
#example([Transitive Closure of a Relation], [
  Let $A = {0,1,2,3}$. \
  Let relation $R$ be defined on $A$ as follows:
  $
    R={(0,1), (1,2), (2,3)}
  $
  - What is the transitive closure of $R$? \
    - Given the *second property* of transitive closures defined earlier:
    $
      {(0,1), (1,2), (2,3)} subset.eq R^t
    $
    - First, a directed graph for $R$ may be constructed.   
    #figure(
      diagram(
        node-fill: none,
        node-stroke: 1pt,
        edge-stroke: 0.8pt,
        node((-1, 1), [*0*], radius: 0.75em),
        edge((1, 1), "-|>"),
        node((1,1), [*1*], radius: 0.75em),
        edge((1,3), "-|>"),
        node((-1, 3), [*3*], radius: 0.75em),
        node((1, 3), [*2*], radius: 0.75em),
        edge((-1,3), "-|>")
    )
  )

    - Now we can look for potential edges that can be added to create $R^t$. 
    - From vertex $0$, we know that we can add edges to vertex $2$ and $3$ because vertex $0$ has indirect connections to them.
    - Additionally, we can add an edge from vertex $1$ to $3$ because it is transitively connected to it through vertex $2$.
    - Thus, we can say that $R^t$ equals
    $
      R^t = {(0,1), (0,2), (0,3), (1,2), (1,3), (2,3)}
    $
    - This works because we know that the previous ordered pairs are at least in $R^t$. 
      However, this relation is transitive, thus it equals $R^t$.

    #figure(
          diagram(
            node-fill: none,
            node-stroke: 1pt,
            edge-stroke: 0.8pt,
            node((-1, 1), [*0*], radius: 0.75em),
            edge((1, 1), "-|>"),
            edge((1, 3), "-|>"),
            edge((-1, 3), "-|>"),
            node((1,1), [*1*], radius: 0.75em),
            edge((1,3), "-|>"),
            edge((-1, 3), "-|>"),
            node((-1, 3), [*3*], radius: 0.75em),
            node((1, 3), [*2*], radius: 0.75em),
            edge((-1,3), "-|>")
          )
    )
])





== 8.3 Equivalence Relations





=== The Relation Induced by a Partition
- Recall that a *partition* of a set is a collection of mutually disjoint sets whose union is the original set.

#definition([
  Given a partition of set $A$, the *relation induced by the partition*, $R$, 
  is defined on $A$ as follows:

  #set align(center)
  _For every $x,y in A$_,
  $
    x op(R) y <=> "There is a subset" A_i "of the partition such that both" x "and" y "are in" A_i.
  $
])
#example([Relation Induced by the Partition],[
Let $A={0,1,2,3,4}$. A partition of $A$ is as follows:
$
  {0,3,4},{1},{2}
$
- What is the relation $R$ induced by this partition?
  - _We can evaluate the ordered pairs in $R$ by analyzing the contents of each set in the partition._
  - According to the contents of the first set:
    $
      0 op(R) 0 \
      0 op(R) 3 \
      0 op(R) 4 \
      3 op(R) 0 \
      3 op(R) 3 \
      3 op(R) 4 \
      4 op(R) 0 \
      4 op(R) 3 \
      4 op(R) 4
    $
  - Additionally, acording to the contents of the other sets:
    $
      1 op(R) 1 \
      2 op(R) 2
    $
  - Therefore,
$
  R = {(0,0), (0,3), (0,4), (3,0), (3,3), (3,4), (4,0), (4,3), (4,4), (1,1), (1,2)}
$
])

#theorem([8.3.1], [
  Let $A$ be a set with a partition and let $R$ be the relation induced by the partition. 
  Then $R$ is reflexive, symmetric, and transitive.
])





=== Definition of an Equivalence Relation
#definition([
  Let $A$ bet a set and $R$ be a relation on $A$. $R$ is an *equivalence relation*,
  if, and oly if, $R$ is reflexive, symmetric, and transitive.
])

#example([An Equivlanece Relation on a Set of Subsets], [
  Let $X$ be the set of all nonempty subsets of ${1,2,3}$. Then,
  $
    X = {{1}, {2}, {3}, {1,2}, {1,3}, {2,3}, {1,2,3}}
  $
  - Define a relation $R$ on $X$ as follows:

  #set align(center)
  _For every $A$ and $B$ in $X$_,
  $
    A op(R) B <=> "The least element in" A "equals the least element in" B.
  $
#set align(left)

  - _Prove that $R$ has all three properties._
  - *Prove that $R$ is reflexive:*
    - Suppose that $A$ is a nonempty subset of ${1,2,3}$. \
    - Logically, the least element of $A$ should always equal the least element of $A$. \
    - Therefore, $A op(R) A$. \
    - $R$ is reflexive.
  - *Prove that $R$ is symmetric:*
    - Suppose that $A$ and $B$ are nonempty subsets of ${1,2,3}$ such that $A op(R) B$.
    - If $A op(R) B$, then the least element of $A$ equals the least element in $B$.
    - This implies that the least element in $B$ equals the last element of $A$.
    - So, in this case, $B op(R) A$.
    - $R$ is symmetric.
  - *Prove that $R$*
    - Suppose that $A$, $B$, and $C$ are nonempty subsets of ${1,2,3}$ such that $A op(R) B$ and $B op(R) C$.
    - By definition of $R$, the least element of $A$ equals the least element in $B$, and the least element in $B$ equals the least element in $C$.
    - As a result, the least element of $A$ must equal the least element in $C$.
    - Hence, $A op(R) C$.
    - $R$ is transitive.
  Because $R$ is reflexive, symmetric, and transitive, it is an equivalence relation.
])





=== Equivalence Classes of an Equivalence Relation
#definition([
  Suppose that $R$ is an equivalence relation on a set $A$. For each element $a$ in $A$,
  the *equivalence class of $a$*, denoted *$[a]$* and called the *class of a* for short,
  is the set of all elements $x in A$ such that $x op(R) a$.
  $
    [a] = {x in A | x op(R) a}
  $
])
- Procedurely,
  $
    "for every" x in A, x in [a] <=> x op(R) a
  $
- The notation $[a]_R$ may be used to specify an equivalence class of $a$ for a particular relation $R$.
- An important property of equivalence classes is that they can take on *different names*.

#example([Equivalence Classes of a Relation Given as a Set of Ordered Pairs], [
  Let $A={0,1,2,3,4}$ and define relation $R$ on $A$ as follows:
  $
    R = {(0,0), (0,4), (1,1), (1,3), (2,2), (3,1), (3,3), (4,0), (4,4)} //finish later
  $
  Additionally, the directed graph is as follows:

  #figure(
      diagram(
        node-fill: none,
        node-stroke: 1pt,
        edge-stroke: 0.8pt,
        node((-3, 0), [*0*], radius: 0.75em),
        edge((-3, 0), "-|>", bend: 150deg, loop-angle: 45deg),
        edge((-4, 1), "-|>", bend:20deg),
        node((-4, 1), [*4*], radius: 0.75em),
        edge((-4, 1), "-|>", bend: 150deg, loop-angle: 225deg),
        edge((-3, 0), "-|>", bend:20deg),
        node((-1, 0), [*3*], radius: 0.75em),
        edge((-1, 0), "-|>", bend: 150deg, loop-angle: 45deg),
        edge((-2, 1), "-|>", bend:20deg),
        node((-2, 1), [*1*], radius: 0.75em),
        edge((-2, 1), "-|>", bend: 150deg, loop-angle: 225deg),
        edge((-1, 0), "-|>", bend:20deg),
        node((0, 0.5), [*2*], radius: 0.75em),
        edge((0, 0.5), "-|>", bend: 150deg, loop-angle: 270deg)
    )
  )
  - What are the distinct equivalence classes of $R$?
  $
    [0] &= {x in A | x op(R) 0} = {0,4}\
    [1] &= {x in A | x op(R) 1} = {1,3}\
    [2] &= {x in A | x op(R) 2} = {2}\
    [3] &= {x in A | x op(R) 3} = {1,3}\
    [4] &= {x in A | x op(R) 4} = {0,4}\
  $
  Removing duplicate sets, the distinct equivalence classes are as follows:
  $
    {0,4}, {1,3}, {2}
  $
])

#example([Equivalent Classes of the Identity Relation], [
  Let $A$ be any set and define a relation $R$ on $A$ as follows:

  #set align(center)
  _For every $x,y in A$_
  $
    x op(R) y <=> x=y
  $
  #set align(left)
  $R$ is also an equivalence relation.
  - What are the distinct equivalence classes of $R$?
  $
    [a] &= {x in A | x op(R) a} \
    [a] &= {x in A | x = a} "by definition of" R\
    [a] &= {a}
  $
  Given this definition, the classes for all elements in $A$ are all distinct equivalence classes of $R$.
])

#lemma([8.3.2], [
  Suppose $R$ is an equivalence relation on set $A$, and $a$ and $b$ are elements of $A$.
  $
    a op(R) b =>[a] = [b]
  $
])

#lemma([8.3.3], [
  If $R$ is an equivalence relation on set $A$, and $a$ and $b$ are elements of $A$, 
  then
  $
    [a] inter [b] = varnothing "or" [a] = [b]
  $
])

#theorem([8.3.4], [
  Given equivalence relation $R$ on set $A$, the distinct equivalence classes of $R$ altogether are equivalent to $A$'s partition.
])





=== Congruence Modulo *$n$*
#example([Equivalence Classes of Congruence Modulo 3], [
  Let $R$ be the congruence modulo 3 relation on $ZZ$, or
  $
    m op(R) n <=> 3 divides (m-n)
  $
  - What are the equivalence classes of $R$?
    - For each integer $a$,
      $
        [a] &= {x in ZZ | x op(R) a} \
        [a] &= {x in ZZ | 3 divides (x-a)} "by definition of" R\
        [a] &= {x in ZZ | (x-a) = 3k "for some integer" k} "by definition of divisibility"\ 
        [a] &= {x in ZZ | x = 3k + a} \
      $
    - It should follow that there are three equivalence classes of $R$.
    $
      [0] &= {x in ZZ | x = 3k "for some integer" k}\
      [1] &= {x in ZZ | x = 3k + 1 "for some integer" k}\
      [2] &= {x in ZZ | x = 3k + 2 "for some integer" k}
    $
    This is an instance of a relation where equivalence classes can take on different names.
    Since the relation in based on remainders, $[0]$ is the same equivalence class as $[3]$ or $[6]$.
])

#definition([
  Suppose $R$ is an equivalence relation on set A and S is an equivalence class for $R$.
  A *representative* of the class $S$ is an element is any element a such that $[a] = S$.
])

#definition([
  Let $m$ and $n$ be integers and let $d$ be a positive integer. 
  $m$ is said to be *congruent to $n$ modulo $d$*, shown as
  $
    m equiv n (mod d) <=> d divides (m-n)
  $
])

#example([Evaluating Congruencies], [
  Determine the truth values of the following congruencies:
  $
    12 &equiv 7 (mod 5) \
    6 &equiv -8 (mod 4) \
    3 &equiv 3 (mod 7)
  $
  - The first congruency is true.
  $
    12-7 &= 5 \
    &= 5 dot 1 \
    therefore 5 divides (12&-7)
  $
  - The second congruency is false.
  $
    6-(-8) &= 14 \
    therefore 5 divides.not (6&-(-8))
  $
  - The third congruency is true.
  $
    3 - 3 &= 0 \
    &= 7 dot 0 \
    therefore 7 divides (3&-3)
  $
])





=== A Definition for Rational Numbers
- When expressed as fractions, the same rational number can be expressed using
  different numerators and denominators
    $
      6 / 7 = 12 / 14
    $
  - Yet, they could represent the different tuples $(6,7)$ and $(12,14)$.
- Algebraically, it follows that
  $
    a / b = c / d <=> a d = b c
  $

#example([Rational Numbers As Equivalence Classes], [
  Let $A$ be the set of all ordered pairs of integers excluding pairs whose second element is zero.
  $
    A = ZZ times (ZZ - {0})
  $
  Additionally, let $R$ be a relation on $A$ as follows:

  #set align(center)
  _For all pairs $(a,b)$ and $(c,d) in A$_,
  $
    (a,b) op(R) (c,d) <=> a d = b c
  $
  #set align(left)
  - Prove that $R$ is transitive.
  Suppose $(a,b)$, $(c,d)$, and $(e,f)$ are _particular but arbitrarily chosen_ elements of $A$ such that\
  $(a,b) op(R) (c, d)$ and $(c,d) op(R) (e,f)$.\
  By definition of $R$,
  $
    (1) space space a d &= b c \
    (2) space space c f &= d e 
  $
  Because the second elements for all tuples in $A$ are nonzero, 
  both sides of $(1)$ and $(2)$ may be multiplied by $f$ and $b$, respectively.\
  $
    (1prime) space space a d f &= b c f\
    (2prime) space space b c f &= b d e 
  $
  Now, $(1prime)$ and $(2prime)$ are equal to the same thing. Thus,
  $
    a d f &= b d e \
    a f &= b e "because" d eq.not 0
  $
Therefore, by definition of $R$, $(a,b) op(R) (e,f)$. \
$R$ is transitive.
])








//UNFINISHED
== 8.4 Modular Arithmetic with Applications to Cryptography
Cryptography refers to study of learning techniqiues to mask messages. 
*Encryption* transforms *plaintext* into *ciphertext*, which is largely unreadable without using *decryption*.
Methods of encryption are known as *ciphers*.
- For example, the *Caesar cipher* encrypts messages 
  by doing an alphanumeric shift that wraps back to the beginning.
  - Thus, given numerical represents of ciphertext $C$ and plaintext $M$:
  $
    C = (M + 3) mod 26
  $
  - _Each letter in the Latin alphabet may be associated with a number according to their position._
- Simple ciphers like the Caesar cipher can be very unsecure, espeically with larger plaintext where patterns are accentuated.
- Meanwhile, public-key cryptography systems, including the *RSA cipher*, use properties of congruence modulo $n$,
  making them very difficult to decrypt.





=== Properties of Congruence Modulo *$n$*
#theorem([8.4.1], [
  Let $a$, $b$, and $n$ be any integers for $n > 1$.
  These statements are all equivalent to each other:
  - $n divides (a-b)$.
  - $a equiv b (mod n)$.
  - $a = b + k n$ for some integer $k$.
  - $a$ and $b$ have the same nonnegative remainder when divided by $n$.
  - $a mod n = b mod n$.
])
- Recall the quotient-remainder theorem
$
  a = n q + r "for" 0 <= r < n
$
- Consequently, there are exactly $n$ integers that satisfy the constraint, and,
  by extension, $n$ possible remainders.

#definition([
  Given integers $a$ and $n$ for $n> 1$, *the residue of $a mod n$*---or *the residue of $a$* for short---is $a mod n$. Furthermore, the sequence 
  $0, 1, 2, dots,  n-1$ is the *complete set of residues modulo $n$*. By equating $a mod n$ to its residue, we are 
  *reducing a number modulo $n$*.
])

#theorem([8.4.2], [
  Given an integer $n$ for $n > 1$, congruence mondulo $n$ is an equivalence relation on $ZZ$.
  The distinct equivlaence classes of the set are
  $
    [a] = {m in Z | m equiv a (mod n)}
  $
  for each $a = 0,1,2, dots, n-1$.
])





=== Modular Arithmetic
A core principle of congruence modilo $n$ is that performing operations closed under $ZZ$
before reducing via modulo $n$ is the exact same as performing modulo $n$ on the operands.


#theorem([8.4.3], [
  Given integers $a$, $b$, $c$, $d$, and $n$ for $n > 1$, suppose that
  $
    a equiv c mod n "and" b equiv d (mod n)
  $
  The following equivalencies must hold:
  - $(a + b) equiv (c + d) (mod n)$.
  - $(a - b) equiv (c - d) (mod n)$.
  - $a b equiv c d (mod n)$.
  - $a^m equiv c^m (mod n) forall "integer" m$.
])

#example([Modular Arithmetic Basics], [
  Modular arithmetic's main application is reducing large computations.
  - $55 + 26 equiv (3 + 2)(mod 4)$
  $
    81 &equiv 5 (mod 4) \
    81 - 5 &= 76 \
    &= 4 dot 19\
    therefore 5 divides (81&-5)
  $

  - $55 - 26 equiv (3 - 2)(mod 4)$
  $
    29 &equiv 1 (mod 4) \
    29 - 1 &= 28 \
    &= 4 dot 9\
    therefore 5 divides (29&-1)
  $

  - $55 dot 26 equiv (3 dot 2)(mod 4)$
  $
    1430 &equiv 6 (mod 4) \
    1430 - 6 &= 1424 \
    &= 4 dot 356 \
    therefore 5 divides (1430 &- 6)
  $

  - $55^2 equiv (3^2)(mod 4)$
  $
    3025 &equiv 9 (mod 4) \
    3025 - 9 &= 3016 \
    &= 4 dot 754 \
    therefore 5 divides (3025 &- 9)
  $
])

#corollary([8.4.4], [
  Given integers $a$, $b$, and $n$ for $n > 1$,
  $
    a b &equiv [(a mod n) (b mod n)] (mod n) \
    a b mod n &= [(a mod n) (b mod n)] mod n \
  $
  Additionally, for any positive integer $m$:
  $
    a^m equiv [(a mod n)^m] (mod n)
  $
])

- When modular arithmetic is applied to large numbers, _such as in RSA cryptography_,
  computations use two particular properties of exponents:
  $
    x^(2a) &= (x^2)^a "for all real numbers" x "and" a "for" x >= 0. \
    x^(a+b) &= x^a x^b "for all real numbers" x, a "and" b "for" x >= 0.
  $

#example([Modulo $n$ with powers of $2$], [
  Solve $144^4 mod 713$.
  $
    144^4 mod 713 &= (144^2)^2 mod 713 \
    &= (144^2 mod 713)^2 mod 713 \
    &= (20736 mod 713)^2 mod 713 \
    &= 59^2 mod 713 \
    &= 3481 mod 713 \
    &= 629
  $
])

#example([Modulo $n$ without powers of $2$], [
  Solve $12^43 mod 713$.
  - _Recalling the second property, 43 can be split into multiple exponents to simplify the problem._
  $
    43 &= 2^5 + 2^3 + 2^1 + 2^0 \
    &= 32 + 8 + 2 + 1 \
    12^43 &= 12^(32+8+2+1) = 12^32 dot 12^8 dot 12^2 dot 12
  $

  - The exponents may be computed before plugging them back into the exponent.
  $
    12 mod 713 &= 12 \
    12^2 mod 713 &= 144 \
    12^4 mod 713 &= 144^2 mod 713\
    &= 59 \
    12^8 mod 713 &= 59^2 mod 713 \
    &= 629 \
    12^32 mod 713 &= 629^2 mod 713 \
    &= 485
  $
  - It follows that by *Corollary 8.4.4.*,
  $
    12^43 mod 713 &= [(12^32 mod 713) dot (12^8 mod 713) dot (12^2 mod 713) dot (12^1 mod 713)] mod 713 \
    &= (485 dot 629 dot 59 dot 144 dot 12) mod 713 "by substitution" \
    &= 527152320 mod 713 \
    &= 48
  $
])



=== Extending the Euclidean Algortihm
- Recall the process for the euclidean algorithm
```python
'''
For a >= b >= 0, calculate the greatest common divisor between a and b.
Continuously apply the quotient remainder theorem until a remainder of 0 is reached.
'''
def euclidean(a: int, b: int) -> int:
  if b == 0:
    return a
  return euclidean(b, a % b)
```
#definition([
  An integer $d$ is a *linear combination of integers* $a$ and $b$ if, and only if,
  there exist integers $s$ and $t$ such that $a s + b t = d$.
])

#theorem([8.4.5], [
  For all nonzero integers $a$ and $b$, if $d = gcd(a,b)$,
  then there exist integers $s$ and $t$ such that \ $a s + b t = d$.
])

#example([Expressing a GCD as a Linear Combination], [
  Express $gcd(330,156)$ as the linear combination of $330$ and $156$ using the Euclidean algorithm. \
  - Using Euclidean's algorithm:
  $
    330 &= 156 dot 2 + 18 \
    156 &= 18 dot 8 + 12 \
    18 &= 12 dot 1 + 6 \
    12 &= 6 dot 2 + 0
  $

  - This implies that $gcd(330,156)=6$.
  - _Defining each remainder in terms of everything else:_
  $
    18 &= 330 - 156 dot 2 \
    12 &= 156 - 18 dot 8 \
    6 &= 18 - 12 dot 1
  $

  - Now, we can backtrack through each step through continuous substitutions, eventually reaching the linear combination form of the greatest common denominator.
  $
    gcd(330,156) &= 6 \
    &= 18 - 12 dot 1 \
    &= 18 - (156 - 18 dot 8) dot 1 "by substitution"\
    &= 18 dot 9 - 156 \
    &= (330 - 156 dot 2) dot 9 - 156 "by substitution" \
    &= underbrace(330 dot 9 - 156 dot (-19), "Linear Combination")
  $
  Logically, the linear combination of $330$ and $156$ reduces to 6.
])





=== Finding an Inverse Modulo *$n$*
#definition([
  Given any integer $a$ and positive integer $n$, if there exists an integer $s$ such that
  $a s equiv 1 (mod n)$, then $s$ is *an inverse for $a$ modulo $n$*.
])

#definition([
  Integers $a$ and $b$ are *relatively prime*, if and only if, $gcd(a,b) = 1$. \
  Additionally, a sequence of integers $a_1, a_2, dots, a_n$ may be *pairwise relatively prime*
  for all integers $i >= 1$ and $j <= n$ given that $i eq.not j$.

])

#corollary([8.4.6], [
  Given relatively prime integers $a$ and $b$, there must exist integers $s$ and $t$ such that $a s + b t = 1$.  
])

#example([Expressing $1$ as a Linear Combination of Relatively Prime Integers], [
  Show that $660$ and $43$ are relatively prime. 
  Additionally, find a corresponding linear combination equal to $1$. \
  - Again, we will use use Euclidean's algorithm:
  $
    660 &= 43 dot 15 + 15 \
    43 &= 15 dot 2 + 13 \
    15 &= 13 dot 1 + 2 \
    13 &= 2 dot 6 + 1 \
    2 &= 1 dot 2 + 0
  $
  - Thus, $gcd(660, 43) = 1$.
  - *Therefore, $660$ and $43$ are relatively prime.*
  - Because the greatest common divisor is $1$, then it follows that backtracking through the algorithm
    should yield a Linear Combination equal to $1$. 
  - _Defining each remainder in terms of everything else:_
    $
      15 &= 660 - 43 dot 15 \
      13 &= 43 - 15 dot 2 \
      2 &= 15 - 13 dot 1 \
      1 &= 13 - 2 dot 6
    $
  - Like the last example, we can now use continous substitutions to find the Linear Combination:
  $
    gcd(660) &= 1 \
    &= 13 - 2 dot 6 "by substitution" \
    &= 13 - (15 - 13) dot 6 "by substitution" \
    &= 13 - 15 dot 6 + 13 dot 6\
    &= 13 dot 7 - 15 dot 6 \ 
    &= (43 - 15 dot 2) dot 7 - 15 dot 6 "by substitution" \
    &= 43 dot 7 - 15 dot 14 - 15 dot 6 \
    &= 43 dot 7 - 15 dot 20 \
    &= 43 dot 7 - (660 - 43 dot 15) dot 20 "by substitution" \
    &= 43 dot 7 - 660 dot 20 + 43 dot 300 \
    &= underbrace(43 dot 307 - 660 dot 20, "Linear Combination")
  $
])

#corollary([8.4.7], [
  For all integers $a$ and $n$, if $gcd(a,n) = 1$, then there exists an integer $s$ such that
  $a s equiv 1 (mod n)$, that is, an inverse for $a$ modulo $n$.
])





=== RSA Cryptography
i dont know what is going on anymore #emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry#emoji.face.cry