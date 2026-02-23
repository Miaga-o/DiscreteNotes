#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes
#import "@preview/i-figured:0.2.4"

#set page("a4", numbering: "1 of 1")
#set text(font: "New Computer Modern Sans")
#show title: set text(size: 24pt)
#show heading: i-figured.reset-counters
#show figure: i-figured.show-figure.with(level: 2)
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 2): set text(size: 18pt)
#show heading.where(level: 3): set text(size: 16pt)
#show math.equation: set text(font: "New Computer Modern Math")
#show sym.emptyset: set text(font: "Fira Sans")

//Functions and variables
#let custom_numbering = (..numbers) => { 
  if numbers.pos().len() < 3 { //Automatic headings until heading 3
    numbering("1.1", ..numbers)
  }
}
#set heading(numbering: custom_numbering)
#counter(heading).update(7)

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

#let continue_example = figure([_Continued on next page_])

#let author = text(size: 16pt, [Miagao])











#figure([
  #title([Chapter 8 Discrete Mathematics Notes])
  #author 
])
#outline()
#pagebreak()




//Notes
= Properties of Relations





== Relations on Sets
- This section will review relations from Chapter 1.
- Recall that an element of one set may be related to another by a relation $R$ as long as they satisfy its definition.
#example([Less-than Relation], [
  A relation $L$ from $RR$ to $RR$ is defined as follows: \

  #align(center, [
    _For all real numbers $x$ and $y$,_
    $ x op(L) y <=> x < y $
  ])

  - $53 op(L) 67$?
    - True, $ 53  < 67$.
  - $141 op(L) 141$?
    - False, $141 = 141$.
  - $12 op(L) -1$?
    - False, $12 > -1$.

    Additionally, $L$ may be graphed as a subset of $RR times RR$, the Cartesian plane using its rule, \ $x < y$.
    #figure(
      cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        let func = x => x
        let domain = (-10, 10)

        set-style(

          legend: (stroke: none, orientation: ttb, scale: 120%)
        )

        plot.plot(
          size: (6,6),
          x-tick-step: none,
          y-tick-step: none,
          x-equal: "y",
          axis-style: "school-book",
          legend: "inner-north-west",
          {
            plot.add(
              domain: domain, func, 
              style: (stroke: (dash: "dashed", paint: rgb("#3749e6")))
            )

            plot.add-fill-between(
              domain: domain, func, x => 10, 
              style: (stroke: none, fill: rgb("#adbce0"))
            )

            plot.add-legend([$L$], preview: () => {
              line((0,0), (1,1), stroke: (dash: "dashed", paint: rgb("#3749e6")))
            })
          }
        )
      }),
      supplement: [Graph],
      caption: [_Any ordered pair above the dotted line satisfies $L$._]
    )
])

#example([Congruence Modulo $2$ Relation],[
  A relation $E$ from $ZZ$ to $ZZ$ is defined as follows: \
  
  #align(center, [
    _For every $(m, n) in ZZ times ZZ$,_
    $
      m op(E) n <=> m-n "is even"
    $
  ])

  Prove that if $n$ is any odd integer, then $n op(E) 1$.
  #continue_example
])

#example([_Congruence Modulo $2$ Relation continued_], [
  *Proof:* \
  - Suppose $n$ is any odd integer.
  - By definition of odd, $n = 2k+1$ for some integer $k$.
  - By definition of $E$, $n op(E) 1$ if, and only 1if, $n-1$ is even.
  - By substitution,
  $ 2k+1 op(E) 1 <=> 2k+1-1 "is even" $
  - As said earlier, $k$ is an integer, so by extension, $2k$ is even by definition of even.
  - Therefore, $n op(E) 1$.

  - Notably, integers $m$ and $n$ are only related by  $E$ if, and only if,
  $ m mod 2 = n mod 2 $
  - This means that $m$ and $n$ are *congruent modulo $2$*.
])

This may also apply to modulo relations other than 2. For example, 
if $T$ is defined from $ZZ$ to $ZZ$ as follows:

#align(center, [
  _For all integers $m$ and $n$,_
  $
    m op(T) n <=> 3 divides (m-n)
  $
])

then $m$ and $n$ are *congruent modulo 3* by the relation $T$.





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
- On finite sets, an easy way to determine the inverse relation is to reverse the direction of the arrows in the original relation's arrow diagram.

#example([Finite Relation Inverse],[
  Given $A={2,3,4}$ and $B={2,6,8}$, let $R$ be the _divides_ relation from $A$ to $B$ defined as follows:

  #align(center, [
    _For every ordered pair $(x,y) in A times B$,_
    $
      x op(R) y <=> x divides y
    $
  ])
  
  What are the ordered pairs of $R$ and $R^(-1)$?
  #continue_example
])

#example([_Finite Relation Inverse continued_], [
  - By listing out each ordered pair of $R$, $R^(-1)$ may be easily found by reversing the order of each tuple.
  $
    R &= {(2,2), (2,6), (2,8), (3,6), (4,8)} \ 
    R^(-1) &= {(2,2), (6,2), (8,2), (6,3), (8,4)} 
  $
  - The same methodology applies to their arrow diagrams as well.

  #figure(
    diagram(
      node-fill: none,
      node-stroke: 1.4pt,
      edge-stroke: 1.5pt,
      node((-3.5, -0.5), text(fill: blue, [$A$]), stroke: 0pt),
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

      
      node((0.5, -0.5), text(fill: red, [$B$]), stroke: 0pt),

      node((0.5, 0.5), [$2$], fill: red.lighten(65%), stroke: red),

      node((0.5, 1.3), [$6$], fill: red.lighten(65%), stroke: red),

      node((0.5, 2.1), [$8$], fill: red.lighten(65%), stroke: red),
    ),
    supplement: [Diagram],
    caption: [
      _The arrow diagrams of $R$ and $R^(-1)$ are identical aside from the direction._]
  )
])
- However, for relations on infinite sets, the inverse for the relation's rule must be found.

#example([Infinite Relation Inverse],[
  Let $R$ be a relation from $RR$ to $RR$ defined as follows:

  #align(center, [
    _For every ordered pair $(x,y) in RR times RR$,_
    $
      x op(R) y <=> y = 2|x|
    $
  ])

  If the graph of $R^(-1)$ are drawn on the Cartesian plane, will it be a function?
  - Using $R$'s definition, $R^(-1)$ may be expressed as a function of $y$.
  $
    R^(-1) = {(y,x) in RR | x=2|y|}
  $
  #continue_example
])

#example([_Infinite Relation Inverse continued_], [
  #figure(
    cetz.canvas({
      import cetz.draw: *
        import cetz-plot: *

        let func1a = x => -2*x
        let domain1a = (-2, 0)
        let func1b = x => 2*x
        let domain1b = (0, 2)

        let func2a = x => 0.5*x
        let func2b = x => -0.5*x
        let domain2 = (0, 4)

        set-style(
          legend: (stroke: none, orientation: ttb, scale: 120%)
        )

        plot.plot(
          size: (6,6),
          x-min: -2, x-max: 2,
          y-min: -4, y-max: 4,
          x-tick-step: 1,
          y-tick-step: 1,
          x-equal: "y",
          axis-style: "school-book",
          legend: "inner-south-west",
          {
            plot.add(
              domain: domain1a, func1a, 
              style: (stroke: (paint: red))
            )
            plot.add(
              domain: domain1b, func1b, 
              style: (stroke: (paint: red))
            )


            plot.add(
              domain: domain2, func2a, 
              style: (stroke: (paint: rgb("#3749e6")))
            )
            plot.add(
              domain: domain2, func2b, 
              style: (stroke: (paint: rgb("#3749e6")))
            )


            plot.add-legend(
              [$R$], preview: () => {
              line((0,0), (1,1), stroke: (dash: "dashed", paint: red))
            })

            plot.add-legend(
              [$R^(-1)$], preview: () => {
              line((0,0), (1,1), stroke: (dash: "dashed", paint: rgb("#3749e6")))
            })
          }
        )
    }),
    supplement: [Graph],
    caption: [_$R$ and $R^(-1)$ on the cartesian plane._]
  )
    - Given this, the following tables may be procured:
    #align(center, [
      #grid(
        columns: 2,
        column-gutter: 100pt,
        [#table(
          columns: 2,
          fill: (x, y) => if y == 0 {red},
          table.header([$x$], [$y$]),
          [$0$], [$0$], 
          [$1$], [$2$], 
          [$-1$], [$2$], 
          [$2$], [$4$], 
          [$-2$], [$4$]
        )],
        [#table(
          columns: 2,
          fill: (x, y) => if y == 0 {blue},
          table.header([*$y$*], [*$x$*]),
          [$0$], [$0$], 
          [$2$], [$1$], 
          [$2$], [$-1$], 
          [$4$], [$2$], 
          [$4$], [$-2$]
        )]
      )
    ])

    - From the table above, it can be seen that $R^(-1)$ has two $x$-values for each $y > 0$. For instance, both $(2,1)$ and $(2,-1)$ are in $R^(-1)$, so it is not a function.
])
- While arrow diagrams can be a useful tool for finding inverse relations, their layouts do not clearly show arrow diagram properties, especially on one set.
- However, they _are_ similar to directed graphs, and applying graph properties from previous chapters will make them more useful in those cases.





=== Directed Graph of a Relation
#definition([A *relation on a set* $A$ is a relation from $A$ to $A$.])
- In this case, if a relation $R$ is defined on set $A$, then the relation's arrow diagram may also be expressed as a *directed graph*.
- Elements related to themselves are expressed as a loop.

#example([Directed Graph of a Relation], [
  Let set $A= {3,4,5,6,7,8}$\
  Let a relation $R$ be defined on set $A$ as follows:

  #align(center, [
    _For every $x, y in A$,_
    $
      x op(R) y <=> 2 divides (x-y)
    $
  ])

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
    ),
    supplement: [Diagram],
    caption: [_The directed graph for $R$._]
  )

  Notice how every vertex in the directed graph connects to itself. 
  This means that every element in $A$ is related to itself by $R$.
  By extension, all vertices are only connected to vertices with the same parity.
])
- Many previously learned graph properties are present in the previous example's diagram, including loops, parallel edges, and connectedness.
- As mentioned earlier, some of those properties imply properties of the relation.





=== $N$-ary Relations and Relational Databases
- Particular relations formed from Cartesian products of $n$ sets, known as $N$-ary relations, are the mathematical basis for relational database theory.
- In databases, they may be thought of as tables with $n$ columns and the headers $A_1, A_2, dots, A_n$.
#definition([
  Given the sets $A_1, A_2, dots, A_n$, the *$n$-ary relation* on \
  $A_1 times A_2 times dots.h.c times A_n$ is a subset of $A_1 times A_2 times dots.h.c times A_n$. 
  The following special cases are defined as the following:
  - $2$-ary is *binary*.
  - $3$-ary is *tertiary*.
  - $4$-ary is *quaternary*.
])









#pagebreak()
== Reflexivity, Symmetry, and Transitivity
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

  Is $R$ reflexive, symmetric, and/or transitive?
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
      ),
      supplement: [Graph],
      caption: [_The directed graph for $R$._]
    )
  - $R$ is reflexive because there is a loop an each vertex in the directed graph.
  - $R$ is also symmetric because for each connection from one vertex to another, 
    there is a second connection from the second vertex to the first.
  - However, $R$ is not transitive because there is no complete 
    directed triangle on the directed graph (no directed edge from 1 to 3)
    #continue_example
])

#example([_Properties of Relations on Finite Sets continued_], [
  Is $S$ reflexive, symmetric, and/or transitive?
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
      ),
      supplement: [Graph],
      caption: [_The directed graph for $S$._]
  )

  - $S$ is not reflexive because the only vertex with a loop is 0.
  - $S$ is not symmetric because when there are connections between vertices,
    it is only from one vertex to another.
  - $S$ is transitive because there is one case where a vertex is both directly 
    and transitively connected to a vertex ($0 -> 2 ->3$ and $0 -> 3$)

  Is $T$ reflexive, symmetric, and/or transitive?
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
      ),
      supplement: [Graph],
      caption: [_The directed graph for $T$._]
  )
  - $T$ is not reflexive because no vertices are connected to themselves via a loop.
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
  from the generic particular is often necessary to prove properties.

#example([Equality Relation], [
  Let $R$ be a relation defined on $RR$ as follows:
  
  #align(center, [
    _For all real numbers $x$ and $y$,_
    $
      x op(R) y <=> x=y
    $
  ])

  Is $R$ reflexive?
  - Yes. $x$ is equal to itself, meaning that $x op(R) x$.
  Is $R$ symmetric?
  - Yes. Equality is symmetric; $x = y => y=x$. Thus, $x op(R) y => y op(R) x$.
  Is $R$ transitive?
  - Yes. Equality is transitive; $x = y$ and $y = z => x=z$. Thus, $x op(R) y  and y op(R) z=> x op(R) z$.
])
- Recall that two integers may be congruent modulo for integers other than $2$ as long as that integer divides their difference.

#example([Properties of Congruence Modulo $2$], [
  Let a relation $T$ be defined on $ZZ$ as follows:

  #align(center, [
    _For all integers $m$ and $n$,_
    $
      m op(T) n <=> 3 divides (m-n)
    $
  ])

  Is $T$ reflexive?
  - *Proof:* \
  - Suppose $m$ is a _particular but arbitrarily chosen_ integer such that $m op(T) m$.
  - By definition of $T$,
  $
    3 divides (m-m) = 3 divides 0
  $
  - By definition of divisibility, $3$ divides $0$ because $0 = 0 dot 3$.
  - Thus, $T$ is reflexive.

  Is $T$ symmetric?
  - *Proof:* 
  - Suppose $m$ and $n$ are _particular but arbitrarily chosen_ integers such that $m op(T) n$.
  - By definition of $T$,
  $
    3 divides (m-n)
  $
  - By definition of divisibility, $m-n = 3k$ for some integer $k$.
  $
    m - n &= 3k "for some integer" k \
    n - m &= 3(-k) "for some integer" k "by algebra"
  $
  - $ZZ$ is closed under multiplication, so $-k$ is an integer.
  - Therefore, by definition of divisibility, $3 divides(n-m)$.
  - Thus, $T$ is symmetric.
  #continue_example
])

#example([_Properties of Congruence Modulo $2$ continued_], [
  Is $T$ transitive?
  - *Proof:*
  - Suppose $m$, $n$, and $p$ are _particular but arbitrarily chosen_ integers such that $m op(T) n$ and $n op(T) p$.
  - By definition of $T$,
  $
    3 divides (m-n) "and" 3 divides (n-p)
  $
  - By definition of divisibility, $m-n = 3r$ and $n-p = 3s$ for some integers $r$ and $s$.
  $
    (m-n) + (n-p) &= 3r + 3s "by adding both together" \
    m-p &= 3(r+s) "by algebra" \
  $
  - $(r+s)$ is an integer because $ZZ$ is closed under addition.
  - Therefore, by definition of divisibility, $3 divides (m-p)$.
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
- Generally, relations are not transitive because the property requires a particular pair to exist in the relation given a transitive connection between two elements on the set.
- Thus, to find the next closest transitive relation, the transitive closure, tuples need to be added to ensure the transitivity of the relation.


#example([Transitive Closure of a Relation], [
  Let $A = {0,1,2,3}$. \
  Let relation $R$ be defined on $A$ as follows:
  $
    R={(0,1), (1,2), (2,3)}
  $
  What is the transitive closure of $R$? \
  - Given the *second property* of transitive closures defined earlier:
  $
    {(0,1), (1,2), (2,3)} subset.eq R^t
  $
  #continue_example
])

#example([_Transitive Closure of a Relation continued_], [
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
    ),
    supplement: [Graph],
    caption: [_The directed graph for $R$. From here, we can see transitive connections from vertices $0$ and $1$, respectively, to other vertices in the graph._]
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
    ),
    supplement: [Graph],
    caption: [_The directed graph for $R^t$._]
  )
])









#pagebreak()
== Equivalence Relations





=== The Relation Induced by a Partition
- Recall that a *partition* of a set is a collection of mutually disjoint sets whose union is the original set.

#definition([
  Given a partition of set $A$, the *relation induced by the partition*, $R$, 
  is defined on $A$ as follows:

  #align(center, [
    _For every $x,y in A$,_
    $
      x op(R) y <=> "There is a subset" A_i "of the partition such that both" x "and" y "are in" A_i.
    $
  ])
])

#example([Relation Induced by the Partition],[
  Let $A={0,1,2,3,4}$. A partition of $A$ is as follows:
  $
    {0,3,4},{1},{2}
  $
  What is the relation $R$ induced by this partition?
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
  - Additionally, according to the contents of the other sets:
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
  Let $A$ be a set and $R$ be a relation on $A$. $R$ is an *equivalence relation*,
  if, and only if, $R$ is reflexive, symmetric, and transitive.
])

#example([An Equivalence Relation on a Set of Subsets], [
  Let $X$ be the set of all nonempty subsets of ${1,2,3}$. Then,
  $
    X = {{1}, {2}, {3}, {1,2}, {1,3}, {2,3}, {1,2,3}}
  $
  Define a relation $R$ on $X$ as follows:

  #align(center, [
    _For every $A$ and $B$ in $X$,_
    $
      A op(R) B <=> "The least element in" A "equals the least element in" B.
    $
  ])

  _Prove that $R$ has all three properties._
  *Prove that $R$ is reflexive:*
  - Suppose that $A$ is a nonempty subset of ${1,2,3}$. \
  - Logically, the least element of $A$ should always equal the least element of $A$. \
  - Therefore, $A op(R) A$. \
  - $R$ is reflexive.
  *Prove that $R$ is symmetric:*
  - Suppose that $A$ and $B$ are nonempty subsets of ${1,2,3}$ such that $A op(R) B$.
  - If $A op(R) B$, then the least element of $A$ equals the least element in $B$.
  - This implies that the least element in $B$ equals the last element of $A$.
  - So, in this case, $B op(R) A$.
  - $R$ is symmetric.
  *Prove that $R$ is transitive:*
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
  the *equivalence class of $a$*, denoted *$[a]$* and called the *class of $a$* for short,
  is the set of all elements $x in A$ such that $x op(R) a$.
  $
    [a] = {x in A | x op(R) a}
  $
])
#pagebreak()
- Procedurally,
  $
    "for every" x in A, x in [a] <=> x op(R) a
  $
- The notation $[a]_R$ may be used to specify an equivalence class of $a$ for a particular relation $R$.
- Additionally, for any equivalence class $[a]$, $a$ is the *representative* for the class.
  - However, equivalence classes may be equal even if they have different representatives.

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
  What are the distinct equivalence classes of $R$?
  $
    [0] &= {x in A | x op(R) 0} = {0,4}\
    [1] &= {x in A | x op(R) 1} = {1,3}\
    [2] &= {x in A | x op(R) 2} = {2}\
    [3] &= {x in A | x op(R) 3} = {1,3}\
    [4] &= {x in A | x op(R) 4} = {0,4}\
  $

  - Removing duplicate sets, the distinct equivalence classes are as follows:
  $
    {0,4}, {1,3}, {2}
  $
])

#example([Equivalent Classes of the Identity Relation], [
  Let $A$ be any set and define a relation $R$ on $A$ as follows:

  #align(center, [
    _For every $x,y in A$,_
    $
      x op(R) y <=> x=y
    $
  ])

  What are the distinct equivalence classes of $R$?
  $
    [a] &= {x in A | x op(R) a} \
    [a] &= {x in A | x = a} "by definition of" R\
    [a] &= {a}
  $
  - Given this definition, the classes for all elements in $A$ are all distinct equivalence classes of $R$.
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
    [a] inter [b] = emptyset "or" [a] = [b]
  $
])

#theorem([8.3.4], [
  Given equivalence relation $R$ on set $A$, the distinct equivalence classes of $R$ altogether are equivalent to $A$'s partition.
])





=== Congruence Modulo $n$
#example([Equivalence Classes of Congruence Modulo $3$], [
  Let $R$ be the congruence modulo $3$ relation on $ZZ$, or
  $
    m op(R) n <=> 3 divides (m-n)
  $
  What are the equivalence classes of $R$?
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
      6 / 7 = 66 / 77
    $
  - Yet, they could represent the different tuples $(6,7)$ and $(66,77)$.
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

  #align(center, [
    _For all pairs $(a,b)$ and $(c,d) in A$,_
    $
      (a,b) op(R) (c,d) <=> a d = b c
    $
  ])
  #continue_example
])

#example([_Rational Numbers as Equivalence Classes continued_], [
  Prove that $R$ is transitive.
  - Suppose $(a,b)$, $(c,d)$, and $(e,f)$ are _particular but arbitrarily chosen_ elements of $A$ such that 
  $ 
  (a,b) op(R) (c, d) "and" (c,d) op(R) (e,f)
  $

  - By definition of $R$,
  $
    (1) space space a d &= b c \
    (2) space space c f &= d e 
  $

  - Because the second elements for all tuples in $A$ are nonzero, both sides of $(1)$ and $(2)$ may be multiplied by $f$ and $b$, respectively.
  $
    (1prime) space space a d f &= b c f \
    (2prime) space space b c f &= b d e 
  $

  - Now, $(1prime)$ and $(2prime)$ are equal to the same thing. Thus,
  $
    a d f &= b d e \
    a f &= b e "because" d eq.not 0
  $

  - Therefore, by definition of $R$, $(a,b) op(R) (e,f)$. \
$R$ is transitive.

What are the equivalence classes of $R$?
- Every unique rational number may represent an equivalence class for $R$. Meanwhile, equivalent rational numbers are stored in each equivalence class because the rule for $R$ follows the same logic as the equality of rational numbers.
$
  [(1,2)] &= {(1,2), (-1,-2), (2,4), (-2,-4), dots (n, 2n) } "for each" n in ZZ - {0}
$
])








#pagebreak()
== Modular Arithmetic with Applications to Cryptography
Cryptography refers to study of learning techniques to mask messages. 
*Encryption* transforms *plaintext* into *ciphertext*, which is largely unreadable without using *decryption*.
Methods of encryption are known as *ciphers*.
- For example, the *Caesar cipher* encrypts messages 
  by doing an alphanumeric shift that wraps back to the beginning.
  - Thus, given numerical represents of ciphertext $C$ and plaintext $M$:
  $
    C = (M + 3) mod 26
  $
  - _Each letter in the Latin alphabet may be associated with a number according to their position._
- Simple ciphers like the Caesar cipher can be very unsecure, especially with larger plaintext where patterns are accentuated.
- Meanwhile, public-key cryptography systems, including the *RSA cipher*, use properties of congruence modulo $n$,
  making them very difficult to decrypt.





=== Properties of Congruence Modulo $n$
#theorem([8.4.1], [
  Let $a$, $b$, and $n$ be any integers for $n > 1$.
  These statements are all equivalent to each other:
  - $n divides (a-b)$.
  - $a equiv b (mod n)$.
  - $a = b + k n$ for some integer $k$.
  - $a$ and $b$ have the same nonnegative remainder when divided by $n$.
  - $a mod n = b mod n$.
])
- Essentially, two numbers are congruent modulo $n$, if, and only if, they share the remainder $n$.
- Recall the quotient-remainder theorem
$
  a = n q + r "for" 0 <= r < n
$
- Consequently, there are exactly $n$ integers that satisfy the constraint, and,
  by extension, $n$ possible remainders.

#definition([
  Given integers $a$ and $n$ for $n> 1$, *the residue of $a mod n$* is the remainder $r$ as denoted by quotient-remainder theorem. 
  Thus, the *complete set of residues modulo* $n$ is the sequence, $0, 1, 2, dots, n-1$.
])
- Thus, by evaluating the modulo equation, we are finding the residue, which is known as *reducing a number modulo* $n$.
- When $n$ is fixed, the shorthand phrase, *the residue of $a$*, is often used.

#theorem([8.4.2], [
  Given an integer $n$ for $n > 1$, congruence modulo $n$ is an equivalence relation on $ZZ$.
  The distinct equivalence classes of the set are
  $
    [a] = {m in Z | m equiv a (mod n)}
  $
  for each $a = 0,1,2, dots, n-1$.
])





=== Modular Arithmetic
A core principle of congruence modulo $n$ is that performing operations closed under $ZZ$
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
  #continue_example
])

#example([_Modular Arithmetic Basics continued_], [
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

#example([Modulo $n$ with powers of $2$)], [
  Find the residue of $144^4 mod 713$.
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
  Find the residue of $12^43 mod 713$.
  - _Recalling the second property, 43 can be split into multiple exponents to simplify the problem._
  $
    43 &= 2^5 + 2^3 + 2^1 + 2^0 \
    &= 32 + 8 + 2 + 1 \
    12^43 &= 12^(32+8+2+1) = 12^32 dot 12^8 dot 12^2 dot 12
  $
  #continue_example
])

#example([_Modulo *n* without powers of 2 continued_], [
  - By *Corollary 8.4.4.*, we can split products modulo $n$ into the product of the operands modulo $n$, modulo $n$.
  - We can start by evaluating them separately.
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

  - Thus,
  $
    12^43 mod 713 &= [(12^32 mod 713) dot (12^8 mod 713) dot (12^2 mod 713) dot (12^1 mod 713)] mod 713 \
    &= (485 dot 629 dot 59 dot 144 dot 12) mod 713 "by substitution" \
    &= 527152320 mod 713 \
    &= 48
  $
  _Note that finding the residue is difficult regardless of what you do, as the exponents are still large after being split._
])





=== Extending the Euclidean Algorithm
- Recall the process for the euclidean algorithm:
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

  - Now, we can backtrack through each step through continuous substitutions, making sure to keep multiples of $330$ and $156$ intact.
  $
    gcd(330,156) &= 6 \
    &= 18 - 12 dot 1 \
    &= 18 - (156 - 18 dot 8) dot 1 "by substitution"\
    &= 18 dot 9 - 156 \
    &= (330 - 156 dot 2) dot 9 - 156 "by substitution" \
    &= 330 dot 9 - 156 dot 18 - 156 \
    &= underbrace(330 dot 9 + 156 dot (-19), "Linear Combination")
  $
  Logically, the linear combination of $330$ and $156$ reduces to 6.
])





=== Finding an Inverse Modulo $n$
- Consider the following congruence:
$
  2x equiv 3 (mod 5)
$
- Here, we have to evaluate a value of $x$ that satisfies the congruence.
- Notice that for $x=3$, $2$ there is a relation to $1$ by modulo $5$.
$
  6 equiv 1 (mod 5)
$

- Thus, we can see the number $3$ as an *inverse for $6 equiv 2 mod 5$*. 
  Now, we can try multiplying both sides by the inverse to see if it will help solve for $x$.
$
  3 dot 2x &equiv 3 dot 3 (mod 5) \
  6x &equiv 9 (mod 5) \
  6x &equiv 4 (mod 5) "by quotient-remainder theorem"
$
#pagebreak()
- Now, because $6 equiv 1(mod 5)$, we can say that $6x equiv 1 dot x (mod 5)$.
- Additionally, because we've established that modular congruence is symmetric and transitive:
$
  6x equiv 4 (mod 5) equiv 4 equiv x (mod 5) equiv x => x equiv (4 mod 5)
$
- Thus, a valid solution to the congruency is $x=4$.

#definition([
  Given any integer $a$ and positive integer $n$, if there exists an integer $s$ such that \
  $a s equiv 1 (mod n)$, then $s$ is *an inverse for $a$ modulo $n$*.
])

#definition([
  Integers $a$ and $b$ are *relatively prime*, if and only if, $gcd(a,b) = 1$. \
  Additionally, a sequence of integers $a_1, a_2, dots, a_n$ may be *pairwise relatively prime*
  for all integers $i >= 1$ and $j <= n$ given that $i eq.not j$.

])

#corollary([8.4.6], [
  Given relatively prime integers $a$ and $b$, there must exist integers $s$ and $t$ such that \ 
  $a s + b t = 1$.  
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
#continue_example
])

#example([_Expressing $1$ as a Linear Combination of Relatively Prime Integers continued_], [
  - Like the last example, we can now use continuous substitutions to find the Linear Combination:
  $
    gcd(660,43) &= 1 \
    &= 13 - 2 dot 6 "by substitution" \
    &= 13 - (15 - 13) dot 6 "by substitution" \
    &= 13 - 15 dot 6 + 13 dot 6\
    &= 13 dot 7 - 15 dot 6 \ 
    &= (43 - 15 dot 2) dot 7 - 15 dot 6 "by substitution" \
    &= 43 dot 7 - 15 dot 14 - 15 dot 6 \
    &= 43 dot 7 - 15 dot 20 \
    &= 43 dot 7 - (660 - 43 dot 15) dot 20 "by substitution" \
    &= 43 dot 7 - 660 dot 20 + 43 dot 300 \
    &= underbrace(43 dot 307 + 660 dot (-20), "Linear Combination")
  $
])

#corollary([8.4.7], [
  For all integers $a$ and $n$, if $gcd(a,n) = 1$, then there exists an integer $s$ such that
  $a s equiv 1 (mod n)$, that is, an inverse for $a$ modulo $n$.
])





=== RSA Cryptography
- *RSA ciphers* encrypt messages using a product of two distinct prime numbers $p q$ and some integer $e$ relatively prime to the number of distinct prime factors of $p q$.
  - This ensures that the *public key* and the *private key* are distinct.
- Thus, for very large values of $p$ and $q$, it is difficult to ascertain them from just the product.
- Thus, all messages can be easily encrypted by the accessible *public key*, then decrypted by the cipher using the *private key*.

#example([Simple RSA Cipher], [
  First, we can choose the values of $p$ and $q$.
  - To minimize key overlapping, we can choose $p = 5$ and $q = 11$.
  - Thus, $p q = 55$.
Now, we can choose an integer $e$, and we want it to be relatively prime to the number of distinct prime factors of $p q$
to ensure that the private key's modular inverse is unique.
- Euler's totient function gives the number of distinct prime numbers up to a given integer, 
  and it can be used to find the total factors of $p q$:
  $
    Phi(p q) &= Phi(p) Phi(q) \
    &= (p-1) (q-1)
  $
- Now, since $(p-1)(q-1) = 40$, we can let $e = 3$, which is relatively prime to $40$.
  #continue_example
])

#example([_Simple RSA Cipher continued_], [
With these two values, we have a *public key*:
$
  (p q, e) = (55, 3)
$

Thus, for each letter in a message, the following formula may be used to encrypt plaintext $M$ into ciphertext $C$:
$
  C = M^e mod p q
$
- Each letter in the alphabet we be associated with their $n$th place in the alphabet.

- For instance, to send the message, "HI", it could be encrypted as:
#grid(
  columns: (1fr, 1fr),
  [$
  C_1 &= "H"^e mod p q \
  &= 8^3 mod 55 \ 
  &= 512 mod 55 \
  &= 17
$],
[$
   C_2 &= "I"^e mod p q \
   &= 9^3 mod 55 \
   &= 729 mod 55 \
   &= 14
 $]
)
#align(center, [*17 14*])

To create a *private/decryption key*, we need an additional integer that is the positive inverse to $e mod (p-1)(q-1)$.
We can refer to this integer as $d$, and is the last part of the private key:
$
  (p q, d)
$

This private key may be used in the following decryption formula:
$
  M = C^d mod p q
$

Keep in mind that real RSA cryptography would use values far larger than this.
])





=== Euclid's Lemma
#theorem([8.4.8], [
  $forall$ integers $a$, $b$, and $c$,
  $
    gcd(a,b) = 1 "and" a divides b c => a divides b
  $
])









#pagebreak()
== Partial Order Relations





=== Antisymmetry
- As opposed to symmetric relations showing two-way connections between connected elements in an arrow diagram, antisymmetric

#definition([
  Let $R$ be a relation on a set $A$. $R$ is *antisymmetric*, if and only if, for every $a$ and $b in A$, if $a op(R) b$ and $b op(R) a$, then $a = b$.
])
- Thus, to disprove that a relation is antisymmetric,
$
  exists a "and" b "such that" a op(R) b "and" b op(R) a "but" a eq.not b
$

#example([Testing Antisymmetry for Finite Relations], [
  Let $R_1$ and $R_2$ be relations on ${0,1,2}$ defined as follows:
  $
    R_1 &= {(0,2), (1,2), (2,0)} \
    R_2 &= {(0,0), (0,1), (0,2), (1,1), (1,2)}
  $
  Are any of the relations antisymmetric?
  - $R_1$ is not antisymmetric. 
    When drawing out its directed graph, there are two parallel edges between vertex $0$ and $2$.
  #figure(
    diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((0, 0), [*2*], radius: 0.75em),
      edge((-1,1), "-|>", bend: 20deg),
    

      node((1,1), [*1*], radius: 0.75em),
      edge((0,0), "-|>"),
    

      node((-1, 1), [*0*], radius: 0.75em),
      edge((0,0), "-|>", bend: 20deg)
      
    ),
    supplement: [Diagram],
    caption: [_The directed graph for $R_1$._]
  )

  - $R_2$ is antisymmetric. All connections between different vertices are only through one edge.
  #figure(
    diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((0, 0), [*2*], radius: 0.75em),

      node((1,1), [*1*], radius: 0.75em),
      edge((1,1), "-|>", bend: 150deg, loop-angle: -45deg),
      edge((0,0), "-|>"),

      node((-1, 1), [*0*], radius: 0.75em),
      edge((-1,1), "-|>", bend: 150deg, loop-angle: 225deg),
      edge((0,0), "-|>"),
      edge((1, 1), "-|>")
    ),
    supplement: [Diagram],
    caption: [_The directed graph for $R_2$._]
  )
])





=== Antisymmetry with Partial Order Relations
#definition([
  Let $R$ be a relation defined on set $A$. $R$ is a *partial order relation*, if, and only if, $R$ is reflexive, antisymmetric, and transitive.
])

- The first fundamental partial order relation is the *less than or equal to* relation on $RR$.
#align(center, [
  _For all integers $a$ and $b$_,
  $
    a op(R) b <=> a <= b
  $
])

- The second fundamental partial order relation is the *subset* relation on a set of sets.
#align(center, [
  _For any sets $A$ and $B in C$_,
  $
    A op(R) B <=> A subset.eq B
  $
])

- Due to the commonality of the _less than or equal to_ relation, the symbol $prec.eq$ is used to denote it as a general partial order relation.
  - Consequently, $x prec.eq y$ may be read as the same as "$x <= y$."
  
#example([Divides Relation], [
  Let $divides$ be the divides relation on set of positive integers $A$. It is defined as follows:\
  
  #align(center, [
    _For all positive integers $a$ and $b in A$_
    $
      a divides b <=> b = k a "for some integer" k
    $
  ])
  
  Prove that $divides$ is a partial order relation on $A$.

  _Prove that $divides$ is reflexive:_
  - Suppose there exists some positive integer $a in A$.
  $
    a = 1 dot a
  $
  - By definition of divisibility, $a divides a$.
  - Thus, $divides$ is reflexive.

  _Prove that $divides$ is antisymmetric:_
  - Suppose there exists some positive integers $a$ and $b in A$ such that $a divides b$ and $b divides a$.
  - By definition of divisibility, $a = k_1 b$ and $b = k_2 a$ for some integers $k_1$ and $k_2$.
  $
    a &= k_1 b \
    a &= k_1 k_2 a "by substitution" \
    1 &= k_1 k_2 "by algebra"
  $
  - Because $a$ and $b$ are both positive integers, it follows that $k_1$ and $k_2$ are also positive integers.
  - The only product of two positive integers that equates to $1$ is $1 dot 1$.
  - Therefore, $k_1 = k_2 = 1$.
  - By substitution, $a = b$ and $b = a$.
  - Thus, $divides$ is antisymmetric.

  _Prove that $divides$ is transitive:_
  - Suppose there exists some positive integers $a$, $b$, and $c in A$ such that $a divides b$ and $b divides c$.
  - By definition of divisibility, $a = r b$ and $b = s c$ for some integers $r$ and $s$.
  $
    a &= r b \
    a &= r s c
  $
  - Because $ZZ$ is closed under multiplication, $r s$ is an integer.
  - By definition of divisibility, $a divides c$, so $divides$ is transitive.
  Because $divides$ is reflexive, antisymmetric, and transitive, it is a partial order relation.
])





=== Lexicographic Order
- In programming languages, strings are generally sorted *lexicographically*.
#theorem([8.5.1], [
  Let $A$ be a set with a partial order relation $R$, and let $S$ be a set of strings over $A$.
  Define a relation $prec.eq$ on $S$ as follows:

  #align(center, [
    _For any strings $s$ and $t$ of positive integer lengths $m$ and $n$, respectively, 
    let $s_m$ and $t_m$ be the characters at the $m$th position of $s$ and $t$, respectively. 
    Thus, the following conditions hold:_ 
  ])

  + If $m <= n$ and the first $m$ characters are the same between $s$ and $t$, then $s prec.eq t$.
  + If the first $m-1$ characters are the same between $s$ and $t$, $s_m op(R) t_m$, and $s_m eq.not t_m$, \ then $s prec.eq t$.
  + Null string $lambda prec.eq s$.
If no strings are related by $prec.eq$ other than the aforementioned conditions, then $prec.eq$ is a partial order relation on $S$.
])
- Essentially, $prec.eq$ defines a sorting order for the strings
  depending on the comparative values of each character in the strings.
- For instance, `"flag"` is related to `"flagged"` by $prec.eq$ according to the first condition, 
  and `"flagged"` is related to `"flagger"` by $prec.eq$ by the second condition. Additionally, a null string would be related to "flag" by $prec.eq$ by the third condition.
  - Thus, the resulting order would be `{null, "flag", "flagged", "flagger"}`.
- Additionally, notice how the set $A$ has another partial relation $R$. 
  This means that $prec.eq$ may only sort comparable elements, that is, 
  only elements related to each other by $R$.

#definition([
  The partial order relation, $prec.eq$, outlined in *Theorem 8.5.1.*, is the *lexicographic order for $S$* 
  that corresponds to the partial order $R$ on $A$.
])





=== Hasse Diagrams
-  A *Hasse diagram* is a _simplified_ arrow diagram that may be associated with a partial order relation defined on a finite set.
- It is oriented upward, that is, all arrows aside from loops will point upward.
- Loops, transitive-implied edges, and direction indicators are all omitted.

- Suppose we let set $A = {1,2,3,9,18}$, and define the following _divides_ relation on $A$:
#align(center, [
  _For all $a$ and $b in A$,_
  $
    a divides b <=> b = k a "for some integer" k
  $
])

#pagebreak()
- This results in the following directed graph:
#figure(
    diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((0,0), [*18*], radius: 0.75em),
      edge((0,0), "-|>", bend: 150deg),

      node((2,0.8), [*9*], radius: 0.75em),
      edge((2,0.8), "-|>", bend: 150deg, loop-angle: 0deg),
      edge((0,0), "-|>"),

      node((1.2,1.4), [*3*], radius: 0.75em),
      edge((1.2,1.4), "-|>", bend: 150deg, loop-angle: -45deg),
      edge((0,0), "-|>"),
      edge((2,0.8), "-|>"),

      node((-1.2,1.4), [*2*], radius: 0.75em),
      edge((-1.2,1.4), "-|>", bend: 150deg, loop-angle: -135deg),
      edge((0,0), "-|>"),

      node((0,2), [*1*], radius: 0.75em),
      edge((0,2), "-|>", bend: 150deg, loop-angle: -90deg),
      edge((0,0), "-|>"),
      edge((-1.2,1.4), "-|>"),
      edge((1.2,1.4), "-|>"),
      edge((2,0.8), "-|>", bend: 20deg),
    ),
    supplement: [Diagram],
    caption: [_The directed graph for the divides relation._]
  )
- However, this graph is very messy, and we already _know_ that it is a partial order relation.
- Thus, we can use the following Hasse diagram to visually express it more clearly:
#figure(
    diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((0,0), [*18*], radius: 0.75em),

      node((2,0.8), [*9*], radius: 0.75em),
      edge((0,0)),

      node((1.2,1.4), [*3*], radius: 0.75em),
      edge((2,0.8)),

      node((-1.2,1.4), [*2*], radius: 0.75em),
      edge((0,0)),

      node((0,2), [*1*], radius: 0.75em),
      edge((-1.2,1.4)),
      edge((1.2,1.4)),

    ),
    supplement: [Diagram],
    caption: [_The Hasse diagram for the divides relation._]
  )
- By recalling the properties of partial order relations, we can still construct the original direct graph from this alone.
  - Because the relation is reflexive, we can imagine a loop on every single loop.
  - Because it is oriented upwards, and the relation is antisymmetric, we know that relations between elements will be directed upwards.
  - Because it is oriented upwards, and the relation is transitive, we can imagine extra directed arrows from elements at the bottom to elements higher up on the diagram.



=== Partially and Totally Ordered Sets
- Given two real numbers $x$ and $y$ such that $x <= y$ or $y <= x$, then $x$ and $y$ are known to be *comparable*.
- Meanwhile, given two subsets $A = {1,2}$ and $B = {2,3}$ of ${1,2,3}$, 
  $A subset.eq.not B$ and $B subset.eq.not A$, so $A$ and $B$ are known to be *noncomparable*.
#definition([
  Given $a$ and $b in A$ and $prec.eq$ on $A$, $a$ and $b$ are *comparable* if, and only if,
  either $a prec.eq b$ or $b prec.eq a$. Otherwise, $a$ and $b$ are *noncomparable*.
])
- All elements in a *total order relation* are comparable.

#definition([
  If $R$ is a partial order relation on set $A$, and for any two elements $a$ and $b$,
  $a op(R) b$ or $b op(R) a$, then $R$ is a *total order relation*.
])
- Sets also have special names with respect to particular partial order relations.
  - A set is a *partially ordered set* or *poset* with respect to $prec.eq$ if, and only if,
    $prec.eq$ is a partial order relation on it.
  - A set is a *totally ordered set* with respect to $prec.eq$ if, and only if,
    $prec.eq$ is a total order relation on it.

- Even then, subsets of posets may still be totally ordered sets, known as chains.
#definition([
  Given $A$, a poset with respect to $prec.eq$, subset $B$ of $A$ is a *chain* if, and only if,
  each pair in $B$ is comparable. \
  The *length of a chain* is the number of elements in the chain minus one.
])

#example([A Chain of Subsets], [
  Let set $P({a,b,c})$ be a partially ordered relation with respect to the subset relation.
  Find a chain of length $3 in P({a,b,c})$.
  - By definition of the subset relation:
  $
    emptyset subset.eq {a} subset.eq {a,b} subset.eq {a,b,c}
  $
  Thus, the set ${emptyset, {a}, {a,b}, {a,b,c}}$ is the chain of length $3 in P({a,b,c})$.
])

- Additionally, partially ordered sets may have extrema. However, there are four rather than two,
  as it is dependent on the comparability between elements in a set.

#definition([
  Let set $A$ be partially ordered with respect to $prec.eq$.
  + $a in A$ is a *maximal element* of $A <=>$ for each $b in A$,
    either $b prec.eq a$ or $b$ and $a$ are not comparable.
  + $a in A$ is a *greatest element* of $A <=>$ for each $b in A$, $b prec.eq a$.
  + $a in A$ is a *minimal element* of $A <=>$ for each $b in A$,
    either $a prec.eq b$ or $a$ and $b$ are not comparable.
  + $a in A$ is a *least element* of $A <=>$ for each $b in A$, $a prec.eq b$.
])
- Following a Hasse diagram, the greatest element should be at the very top,
  while the least element is at the very bottom.
- Because maximal and minimal elements are only relative to comparable elements,
  this should only hold true for their respective *chains*.

#example([Maximal, Minimal, Greatest, and Least Elements], [
  Given set $A = {a,b,c,d,e,f,g,h,i}$ and the partial order relation 
  defined by the Hasse diagram below, find the maximal, minimal, greatest,
  and least elements of $A$. \
  
  #figure(
    diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((0,0), [*g*], radius: 0.75em),

      node((-1,1), [*a*], radius: 0.75em),
      edge((0,0)),

      node((0,1), [*f*], radius: 0.75em),
      edge((0,0)),

      node((1,1), [*h*], radius: 0.75em),
      edge((0,0)),

      node((-1,2), [*b*], radius: 0.75em),
      edge((-1,1)),

      node((0,2), [*e*], radius: 0.75em),
      edge((0,1)),
      edge((1,1)),

      node((1,2), [*i*], radius: 0.75em),
      edge((1,1)),

      node((-1.5,3), [*c*], radius: 0.75em),
      edge((-1,2)),

      node((-0.5,3), [*d*], radius: 0.75em),
      edge((-1,2)),
      edge((0,2))
    ),
    supplement: [Diagram],
    caption: [_The Hasse diagram for $A$._]
  )

  - $g$ is the only maximal element.
  - $g$ is also the only greatest element.
  - $c$, $d$, and $i$ are the minimal elements.
  - There is no least element.
])





=== Topological Sorting
- The basis of topological sorting is that inputs considered _lesser_ than another must
  be inputted before it.
#definition([
  Given $prec.eq$ and $prec.eq'$ on set $A$, $prec.eq'$ is *compatible* with $prec.eq$
  if, and only if, for every $a$ and $b in A$, \ $a prec.eq b => a prec.eq' b$.
])

#definition([
  Given partial order relations $prec.eq$ and $prec.eq'$ on set $A$, $prec.eq'$ is a
  *topological sorting* for $prec.eq$, if, and only if, $prec.eq'$ is a total order 
  compatible with $prec.eq$.
])
- Formally, the algorithm for constructing a toplogical sorting is as follows:
  + Pick any minimal element $a in A$, _given that $A eq.not emptyset$_.
  + $A' colon.eq A - {a}$.
  + Repeat the following steps while $A' eq.not emptyset$:
    - Pick any minimal element $b in A'$.
    - Define $a prec.eq' b$.
    - Set $A' colon.eq A' - {b}$ and $a colon.eq b$.












#pagebreak()
#set heading(numbering: none)
= Extra Examples

#example([The Extended Euclidean Algorithm], [
  Use the extended Euclidean algorithm to find the GCD and the Linear Combination of $5590$ and $637$.
  - _Finding the GCD:_
  $
    5590 &= 637 dot 8 + 494 \
    637 &= 494 dot 1 + 143 \
    494 &= 143 dot 3 + 65 \
    143 &= 65 dot 2 + 13 \
    65 &= 13 dot 5 + 0 \
  $
  - Thus, $gcd(5590, 637) = 13$.
  - _Defining each remainder in terms of everything else:_
  $
    494 &= 5590 - 637 dot 8 \
    143 &= 637 - 494 dot 1 \
    65 &= 494 - 143 dot 3 \
    13 &= 143 - 65 dot 2 \
  $
  - _Finding the Linear Combination:_
  $
    gcd(5590, 637) &= 13 \
    &= 143 - 65 dot 2 "by substitution"\
    &= 143 - (494 - 143 dot 3) dot 2 "by substitution"\
    &= 143 - 494 dot 2 + 143 dot 6 \
    &= 143 dot 7 - 494 dot 2 \
    &= (637 - 494) dot 7 - 494 dot 2 "by substitution" \
    &= 637 dot 7 - 494 dot 7 - 494 dot 2 \
    &= 637 dot 7 - 494 dot 9 \
    &= 637 dot 7 - (5590 - 637 dot 8) dot 9 "by substitution"\
    &= 637 dot 7 - 5590 dot 9 + 637 dot 72 \
    &= underbrace(637 dot 79 + 5590 dot (-9), "Linear Combination")
  $
])