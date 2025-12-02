#import "@preview/cetz:0.4.2"
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
#show math.equation: set text(font: "Luciole Math", size: 10pt)

//Functions and variables
#let custom_numbering(max_depth) = (..numbers) => { 
  if numbers.pos().len() <= max_depth { //Automatic headings until heading 3
    numbering("1.1", ..numbers)
  }
}
#set heading(numbering: custom_numbering(2))
#counter(heading).update(8)

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

#let mtxt(body) = text(font: "New Computer Modern Sans", [#body], size: 12pt)

#let tmath(body) = text(font: "Luciole Math", [#body], size: 12pt)

#let h1math(body) = text(font: "Luciole Math", [#body], size: 18pt)

#let h2math(body) = text(font: "Luciole Math", [#body], size: 16pt)

#let h3math(body) = text(font: "Luciole Math", [#body], size: 14pt)

#let continue_example = figure([_Continued on next page_])

#let author = text(size: 16pt, [Miagao])











#figure([
  #title([Chapter 9 Discrete Mathematics Notes])
  #author 
])
#outline()
#pagebreak()








//Notes
= Counting and Probability





== Introduction to Probability
- A process is *random* when it leads to an outcome from some set of outcomes, and it is impossible to predict with certainty what it may be.
  - In a coin flip, the set of outcomes is heads and tails, but it cannot be predicted with certainty if it is heads or tails, even considering a calculated probability of $50%$.

#definition([
A *sample space* is the set of all possible outcomes of a random process or experiment. \
An *event* is a subset of a sample space.
])

- Formally, given $S$, a finite sample space where all outcomes are equally like, and $E$, an event in $S$, then *probability of $E$*, denoted $P(E)$ is:
$
  P(E) = (mtxt("the number of outcomes in") E) / (mtxt("the total number of outcomes in") S) 
$ 

- Or, given $N(A)$, the number of elements in some set $A$:
$
  P(E) = N(E) / N(S) 
$ 





=== Counting the Elements of a List
- Sometimes, counting list elements can be easy, such as listing the number of elements from one integer through another.
- However, there is an exact formula for this, which is helpful for determining the number of iterations with variables.
#theorem([9.1.1], [
  If $m$ and $n$ are integers such that $m <= n$, then  there are $n - m + 1$ integers from $m$ to $n$, inclusive.
])

#example([Counting the Elements of a Sublist], [
  How many three-digit integers exist are divisible by 5?
  - For each three-digit integer divisible by $5$, there is a corresponding integer from $20$ to $199$, inclusive.
  - Hence, by *Theorem 9.1.1.*, there are $199-20+1=180$ three-digit integers divisible by $5$.

  What is the probability that a randomly chosen three-digit integer is divisible by $5$?
  - By *Theorem 9.1.1.*, there are $999-100+1 = 900$ total three-digit integers.
  - Using the previous answer, we can now calculate the probability:
  $
    180 / 900 &= 1 / 5 mtxt("by algebra") 
  $
])










== Possibility Trees and the Multiplication Rule
- Tree structures are useful for keeping track of all the possibilities in situations where events happen in a particular order.

#example([Tournament Play Possibilities], [
  Suppose there are two teams, $A$ and $B$, who continuously play against each other until one team wins twice in a row or wins three times total. A series of wins may be denoted by the team names, like $A, B, B$.

  How many ways can the tournament be played?
  - Using a tree, we can outline all the possibilities up to 5 levels:
  #figure([
    #diagram(
      node-fill: none,
      node-stroke: 1pt,
      edge-stroke: 0.8pt,
      node((-4.5, 1), [*Start*], stroke: 0pt),
      node((-5,1), radius: 0.75em),
      edge((-4, 0)),
      edge((-4, 2)),

      node((-4, -1.5), [Game 1], stroke: 0pt),
      node((-4,0), [*A*], radius: 0.75em),
      edge((-3, -0.25)),
      edge((-3, 0.25)),

      node((-4,2), [*B*], radius: 0.75em),
      edge((-3, 1.75)),
      edge((-3, 2.25)),


      node((-3, -1.5), [Game 2], stroke: 0pt),
      node((-3, -0.25), [*A*], radius: 0.75em),
      node((-2.65, -0.25), [*A* wins], stroke: 0pt),

      node((-3, 0.25), [*B*], radius: 0.75em),
      edge((-2, 0)),
      edge((-2, 0.5)),

      node((-3, 1.75), [*A*], radius: 0.75em),
      edge((-2, 1.5)),
      edge((-2, 2)),

      node((-3, 2.25), [*B*], radius: 0.75em),
      node((-2.65, 2.25), [*B* wins], stroke: 0pt),


      node((-2, -1.5), [Game 3], stroke: 0pt),
      node((-2, 0), [*A*], radius: 0.75em),
      edge((-1, -0.25)),
      edge((-1, 0.25)),

      node((-2, 0.5), [*B*], radius: 0.75em),
      node((-1.65, 0.5), [*B* wins], stroke: 0pt),

      node((-2, 1.5), [*A*], radius: 0.75em),
      node((-1.65, 1.5), [*A* wins], stroke: 0pt),

      node((-2, 2), [*B*], radius: 0.75em),
      edge((-1, 1.75)),
      edge((-1, 2.25)),


      node((-1, -1.5), [Game 4], stroke: 0pt),
      node((-1, -0.25), [*A*], radius: 0.75em),
      node((-0.65, -0.25), [*A* wins], stroke: 0pt),

      node((-1, 0.25), [*B*], radius: 0.75em),
      edge((0, 0)),
      edge((0, 0.5)),

      node((-1, 1.75), [*A*], radius: 0.75em),
      edge((0, 1.5)),
      edge((0, 2)),

      node((-1, 2.25), [*B*], radius: 0.75em),
      node((-0.65, 2.25), [*B* wins], stroke: 0pt),


      node((0, -1.5), [Game 5], stroke: 0pt),
      node((0, 0), [*A*], radius: 0.75em),
      node((0.45, 0), [*A* wins], stroke: 0pt),

      node((0, 0.5), [*B*], radius: 0.75em),
      node((0.45, 0.5), [*B* wins], stroke: 0pt),

      node((0, 1.5), [*A*], radius: 0.75em),
      node((0.45, 1.5), [*B* wins], stroke: 0pt),

      node((0, 2), [*B*], radius: 0.75em),
      node((0.45, 2), [*B* wins], stroke: 0pt),
    )],
    supplement: [Diagram],
    caption: [The possibility tree for the tournament.]
  )
  What are all the ways the tournament can be played?
  - As outlined in the possibility tree, there are ten different ways the tournament can be played, with $A$ and $B$ each having five different events where they win.

  If each outcome is assumed to be equally likely, what is the likelihood that a team wins after five games?
  - There are 4 leaf nodes on the tree, each representing a win on the fifth game.
  - Thus, the probability is as follows: 
  $
    4 / 10 &= 1 / 5 mtxt("by algebra")\ 
    &= 40% mtxt("by converting to percent")
  $
])





=== The Multiplication Rule
- Imagine a computer installation with four IO units $A$, $B$, $C$, and $D$, and three CPUs $X$, $Y$, and $Z$.
- There should be twelve ways to pair the IO units with the CPUs.
- Note that there are CPU options available for each IO unit, and there are four IO units.
- Thus, $4 dot 3 = 12$ pairs.

#theorem([9.2.1], [
  If an operation consists of $k$ steps, and if every $i$th step for each integer $1<=i<=k$ can be completed in $n_i$ ways, then the entire operation may be completed in $n_1 dot n_2 dots.h.c n_k$ ways. 
])
#example([Multiplication Rule with Nested Loops], [
  How many times does the following nested loop run?
  ```python
  for i in range(4):
    for j in range(3):
      #Loop body
  ```
  - The outer loop has four iterations.
  - For each iteration in the outer loop, the inner loop has three iterations.
  - By the multiplication rule, the nested loop has $4 dot 3 = 12$ iterations.
])





=== Permutations
- A *permutation* of a set of objects is a particular ordering of the objects in a row.
- For instance, the set ${a,b,c}$ has $6$ permutations:

- Note that for each successive step, there is one less way to perform it.
- Thus, by the multiplication rule, there are $n dot (n-1) dot (n-2) dots.h.c 2 dot 1$ ways to perform the entire operation.
  - Note that this matches the recursive definition for factorial.
#theorem([9.2.6], [
  For any integer $n >= 1$, a set with $n$ elements has $n!$ permutations.
])





=== Permutations of Selected Elements
- Again, consider the set ${a,b,c}$.
- There are six different ways to select two different letters from the set and write them in a particular order:
$
  a b, a c, b a, b c, c a, c b
$
- Altogether, these orderings are the $2$-permutations of ${a,b,c}$.

#definition([
  An *$r$-permutation* for a set of $n$ elements is an ordered selection of $r$ elements from the set. The number of $r$-permutations in a set of $n$ elements is denoted $P(n,r)$.
])

#theorem([9.2.3], [
  If $n$ and $r$ are integers such that $1 <= r <= n$, the number of $r$-permutations of a set of $n$ elements is given by the formula:
  $
    P(n,r) = n(n-1)(n-2) dots.c (n-r+1) \
    mtxt("or") \
    P(n,r) = n! / (n - r)!
  $
])
- Logically, given a set of length $n$, the number of $n$-permutations in the set is equal to the number of permutations, or just $n!$.










== Counting Elements of Disjoint Sets: The Addition Rule
- We may count the number elements in unions, intersections, and differences between sets.
- The number of elements in a union of mutually disjoint finite sets equals the sum of the number of elements in each of the operands.

#theorem([9.3.1], [
  Suppose a finite set $A$ equals the union of $k$ distinct mutually disjoint sets $A_1, A_2, dots, A_k$. Thus,
  $
    N(A) = N(A_1) + N(A_2) + dots.h.c + N(A_k)
  $
])

- Logically, this only applies to mutually disjoint finite sets because overlapping elements are not counted separately.





=== The Difference Rule
- As a consequence of the addition rule, if the number of elements in set $A$ and its subset $B$ are known, then the number of elements in $A - B$ may be computed.
#theorem([9.3.2], [
  If $A$ is a finite set and $B subset.eq A$, then:
  $
    N(A-B) = N(A) - N(B)
  $
])


- Additionally, there is a related formula for the probability of an event's complement:

#set align(center)
If $S$ is a finite sample space, and $A$ is an event in $S$, then
$
  P(A^complement) = 1 - P(A)
$
#set align(left)






=== The Inclusion/Exclusion Rule
- Recall that the addition rule is for unions of sets that are _mutually disjoint_.
- Thus, to count the number of elements in the union of sets with overlapping elements, we must subtract the number of overlapping elements after applying the addition rule.
  - This is because overlapping elements will be counted more than once.

#theorem([9.3.3], [
  If $A$, $b$, and $C$ are any finite sets, then
  $
    N(A union B) = N(A) + N(B) - N(A inter B) \
    mtxt("and") \
    N(A union B union C) = N(A) + N(B) + N(C) - N(A inter B) - N(A inter C) - N(B inter C) + N(A inter B inter C)
  $
])










== The Pigeonhole Principle
- According to the *pigeonhole principle*, given $m < n$











==











==










==