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
#show math.equation: set text(font: "New Computer Modern Sans Math")
#show sym.emptyset: set text(font: "Fira Sans")

//Functions and variables
#let custom_numbering = (..numbers) => { 
  if numbers.pos().len() < 3 { //Automatic headings until heading 3
    numbering("1.1", ..numbers)
  }
}
#set heading(numbering: custom_numbering)
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
  P(E) = ("the number of outcomes in" E) / ("the total number of outcomes in" S) 
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
    180 / 900 &= bold(1 / 5) "by algebra" 
  $
])









#pagebreak()
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
  - As outlined in the possibility tree, there are ten different ways the tournament can be played, with $A$ and $B$ each having five different events where they win.

  If each outcome is assumed to be equally likely, what is the likelihood that a team wins after five games?
  - There are 4 leaf nodes on the tree, each representing a win on the fifth game.
  - Thus, the probability is as follows: 
  $
    4 / 10 &= 1 / 5 "by algebra" \ 
    &= space bold(40%) " by converting to percent"
  $
])





=== The Multiplication Rule
- Imagine a computer installation with four IO units $A$, $B$, $C$, and $D$, and three CPUs $X$, $Y$, and $Z$.
- There should be twelve ways to pair the IO units with the CPUs.
- Note that there are CPU options available for each IO unit, and there are four IO units.
- Thus, there are $4 dot 3 = 12$ pairs.

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
  - By the multiplication rule, the nested loop has $4 dot 3 =$ *12 iterations*.
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

#example([Possible License Plates], [
  Suppose there is a license plate format starting with three uppercase Latin alphabet letters and ending with four digits. \

  How many license plates are possible?
  - This problem can be split into two parts.
    - There are $26$ letters in the Latin alphabet, thus there are $26^3 = 17576$ possible letter combinations.
    - There are $10$ Arabic numerals, so there are $10^4 = 10000$.
  - Hence, there are $17576 dot 10000 = $ *175760000 possible license plates*.

  How many possible license plates start with an A and end with a $0$?
  - Because there is only 1 possible option for the first and last character of the license plate, there are only $1 dot 26^2 dot 10^3 dot 1 =$ *676000 possible combinations*.
  #continue_example
])

#example([_Possible License Plates continued_], [
  How many possible license plates have distinct letters and digits?
  - Again, this problem can be split into two parts.
    - For each successive letter, there is one less option because they are distinct. Thus, there are $26 dot 25 dot 24 =$ 15600 possible letter combinations.
    - Likewise, there is one less option for each successive digit. Thus, there are \ $10 dot 9 dot 8 dot 7 = 5040$ possible digit combinations.
  - Hence, there are $15600 dot 5040 =$ *78624000 possible combinations*.
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
    "or" \
    P(n,r) = n! / (n - r)!
  $
])
- Logically, given a set of length $n$, the number of $n$-permutations in the set is equal to the number of permutations, or just $n!$.









#pagebreak()
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

#example([Possible Passwords of Different Lengths], [
  Suppose a company has the following password restrictions:
  + Password lengths must be from $8$ to $10$ characters in length.
  + The $26$ letters of the Latin alphabet, lowercase or uppercase.
  + The $10$ Arabic numerals.
  + The $14$ symbols, !, @, \#, \$, %, ^, &, \*, \(, \), -, +, \{, and \}.

  How many passwords are possible?
  - There are $26 dot 2 + 10 + 14 = 76$ valid symbols and three valid lengths, $3$, $4$, and $5$.
  - Thus, there are $76^8 + 76^9 +76^10 =$ *6514592610973974528 possible passwords*.
])





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

#example([Possible Passwords with Repeated Characters], [
Following the same restrictions as the previous example, how many passwords have at least one repeated symbol?
- First, we must calculate the number of passwords without repeated characters.
- Because the amount of possible characters decreases for each character, there are \ $76 dot 75 dot 74 dots.c 69 + 76 dot 75 dot 74 dots.c 68 + 76 dot 75 dot 74 dots.c 67=$ 3516245169066000000 total combinations.
- Because this event is a subset of the total number of passwords, we can subtract it to find the possible passwords with at least one repeated symbol:
$
  &6514592610973974528 - 3516245169066000000 \
  &= bold(2998347441907974528 "passwords with repeated characters") 
$
])






=== The Inclusion/Exclusion Rule
- Recall that the addition rule is for unions of sets that are _mutually disjoint_.
- Thus, to count the number of elements in the union of sets with overlapping elements, we must subtract the number of overlapping elements after applying the addition rule.
  - This is because overlapping elements will be counted more than once.

#theorem([9.3.3], [
  If $A$, $b$, and $C$ are any finite sets, then
  $
    N(A union B) = N(A) + N(B) - N(A inter B) \
    "and" \
    N(A union B union C) = N(A) + N(B) + N(C) - N(A inter B) - N(A inter C) - N(B inter C) + N(A inter B inter C) \
    "or, more compactly," \
    abs(union.big_(i=1)^n A_i) =  sum_(emptyset eq.not J subset.eq {1,2,dots,n})(-1)^(abs(J)-1) abs(inter.big_(j in J) A_j)
    
  $
])









#pagebreak()
== The Pigeonhole Principle
- According to the *pigeonhole principle*, given $m < n$, if $n$ pigeons fly into $m$ holes, then at least one hole will contain more than one pigeon.
- In terms of functions, a function from one finite set to a smaller finite set *cannot be one-to-one*. That is, there must be at least two elements in the domain that have the same image in the co-domain.

#example([Applications of the Pigeonhole Principle], [
  In a group of six people, must there be at least two people who were born in the same month?
  - No, there are twelve possible months, but only six people. 

  What about in a group of thirteen people?
  - Yes; equating the people to pigeons and the birth months to pigeonholes, it can be seen that a birth month must be shared between at least two people because there are more "pigeons" than "pigeonholes."
])

- Another important consequence of the pigeonhole principle is that the decimal expansion of any rational number either terminates or repeats.





=== Generalized Pigeonhole Principle
- A generalization of the pigeonhole principle states that if $n$ pigeons fly into $m$ pigeonholes, and for some positive integer $k$, $k m < n$, then at least one pigeonhole contains at least $k + 1$ pigeons.
- Formally, for any function $f$ from a finite set $X$ with $n$ elements to a finite set $Y$ with $m$ elements, and for any positive integer $k$, if $k m < n$, there is some $y in Y$ such that $y$ is the image of at least $k + 1$ distinct elements of $X$.
- Or, in the contrapositive form, for any function $f$ from a finite set $X$ with $n$ elements to a finite set $Y$ with $m$ elements, and for any positive integer $k$, if for each $y in Y$, $f^(-1)(y)$ has at most $k$ elements, then $X$ has at most $k m$ elements; essentially, $n <= k m$.

#figure(
  diagram(
    node-fill: none,
    node-stroke: 1.4pt,
    edge-stroke: 1.5pt,
    node((-3.5, -1), text(fill: blue, [*Pigeons*]), stroke: 0pt),
    node((-3.5, -0.5), text(fill: blue, [$X$]), stroke: 0pt),
    edge((0.5, -0.5), "-|>", $f$, bend: 20deg, layer: 100),

    node((-3.5, 0), [$1$], fill: blue.lighten(65%), stroke: blue),
    edge((0.5, 0.6), "-|>", bend: 20deg),

    node((-3.5, 0.6), [$2$], fill: blue.lighten(65%), stroke: blue),
    edge((0.5, 0.6), "-|>"),

    node((-3.5, 1.2), text[$3$], fill: blue.lighten(65%), stroke: blue),
    edge((0.5, 1.8), "-|>", bend: 10deg),

    node((-3.5, 1.8), text[$4$], fill: blue.lighten(65%), stroke: blue),
    edge((0.5, 0.6), "-|>", bend: -20deg),

    node((-3.5, 2.4), text[$5$], fill: blue.lighten(65%), stroke: blue),
    edge((0.5, 1.8), "-|>"),
    
    node((0.5, -1), text(fill: red, [*Pigeonholes*]), stroke: 0pt),
    node((0.5, -0.5), text(fill: red, [$Y$]), stroke: 0pt),

    node((0.5, 0.6), [$1$], fill: red.lighten(65%), stroke: red),

    node((0.5, 1.8), [$2$], fill: red.lighten(65%), stroke: red),
  ),
  supplement: [Diagram],
  caption: [
    _Given $5$ pigeons and $2$ pigeon holes, at least one pigeonhole should have $3$ pigeons by the generalization of the pigeonhole principle._]
  )
  











#pagebreak()
== Counting Subsets of a Set: Combinations 
#definition([
  Let $n$ and $r$ be nonnegative integers such that $r <= n$. An *$r$-combination* of a set of $n$ elements is a subset of $r$ of the $n$ elements.
])
- Additionally, recall the notation $n$ choose $r$, the number of subsets of size $r$ or $r$-combinations that can be formed from a set with $n$ elements, denoted as
$
  binom(n,r) = C(n,r) = n! / (r!(n-r)!)
$
- Consequently, there are two distinct methods to select $r$ objects from a set of $n$ elements.
  - In an *ordered selection*, both the elements chosen and their order matters. Thus, two ordered selections are the same if they contain the same elements in the same order.
  - In an *unordered selection*, only the identity of the elements chosen matter. Thus, two unordered selections are the same if they consist of the same elements.
- Notice how ordered selections are akin to *$r$-permutations* while the latter is akin to *$r$-combinations*.

#example([Relation between $n$ Choose $r$ and $r$-Permutations], [
  $n$ choose $r$ and $r$-permutations have very similar formulas and only differ by their consideration of order. To illustrate the methodology behind their formulas, we may start by finding the number of $2$-permutations of ${6,7,8,9}$.
  - Using the $r$-permutations formula, there are:
  $
    4! / (4-2)! = 4! / 2! = 24 / 2 = bold(12 space r"-permutations")
  $
  - Thinking about how $n$ choose $r$ is an unordered selection and how $r$-permutations is an ordered selection, we can split the process of finding the $r$-Permutations into two steps:
    + Find the $r$-combinations.
    + Find the permutations of those $r$-combinations.
  - Logically, it follows that there are $r!$ permutations for each $r$-combination.
  - Thus, by the multiplication rule, there are $r!$ times as many $r$-permutations as there are $r$-combinations.
  - In this case, there are $12 / 2! = 12 / 2 =$ *6 $bold(r)$-combinations*.
  - Using a possibility tree, this is even easier to outline.
  #continue_example
])

#example([_Relation between $n$ Choose $r$ and $r$-Permutations continued_], [
  #figure(
    diagram(
      node-fill: none,
      node-stroke: 1.4pt,
      edge-stroke: 1.5pt,
      node((-0.5,0), [Start], stroke: none),
      node((0,0), radius: 0.75em),
      edge((1,-2.5), bend: 30deg),
      edge((1,-1.5)),
      edge((1,-0.5)),
      edge((1,0.5)),
      edge((1,1.5)),
      edge((1,2.5), bend: -30deg),

      node((1,-3.5), [*$r$-combinations*], stroke: none),
      node((1,-2.9), ${6,7}$, stroke: none),
      node((1,-2.5), radius: 0.75em),
      edge((5, -2.75)),
      edge((5, -2.25)),

      node((1,-1.9), ${6,8}$, stroke: none),
      node((1,-1.5), radius: 0.75em),
      edge((5, -1.75)),
      edge((5, -1.25)),

      node((1,-0.9), ${6,9}$, stroke: none),
      node((1,-0.5), radius: 0.75em),
      edge((5, -0.75)),
      edge((5, -0.25)),

      node((1,0.1), ${7,8}$, stroke: none),
      node((1,0.5), radius: 0.75em),
      edge((5, 0.25)),
      edge((5, 0.75)),

      node((1,1.1), ${7,9}$, stroke: none),
      node((1,1.5), radius: 0.75em),
      edge((5, 1.25)),
      edge((5, 1.75)),

      node((1,2.1), ${8,9}$, stroke: none),
      node((1,2.5), radius: 0.75em),
      edge((5, 2.25)),
      edge((5, 2.75)),


      node((5,-3.5), [*$r$-permutations*], stroke: none),
      node((5.5,-2.75), $67$, stroke: none),
      node((5,-2.75), radius: 0.75em),
      node((5.5,-2.25), $76$, stroke: none),
      node((5,-2.25), radius: 0.75em),

      node((5.5,-1.75), $68$, stroke: none),
      node((5,-1.75), radius: 0.75em),
      node((5.5,-1.25), $86$, stroke: none),
      node((5,-1.25), radius: 0.75em),

      node((5.5,-0.75), $69$, stroke: none),
      node((5,-0.75), radius: 0.75em),
      node((5.5,-0.25), $96$, stroke: none),
      node((5,-0.25), radius: 0.75em),

      node((5.5,0.25), $78$, stroke: none),
      node((5,0.25), radius: 0.75em),
      node((5.5,0.75), $87$, stroke: none),
      node((5,0.75), radius: 0.75em),

      node((5.5,1.25), $79$, stroke: none),
      node((5,1.25), radius: 0.75em),
      node((5.5,1.75), $97$, stroke: none),
      node((5,1.75), radius: 0.75em),

      node((5.5,2.25), $89$, stroke: none),
      node((5,2.25), radius: 0.75em),
      node((5.5,2.75), $98$, stroke: none),
      node((5,2.75), radius: 0.75em),
    ),
    supplement: [Diagram],
    caption: [_The possibility tree for the $r$-combinations and $r$-permutations of ${6,7,8,9}$. Notice how the $r$-permutations branch off of the $r$-combinations as the order varies._]
  )
])

#theorem([9.5.1], [
  The number of subsets of size $r$ or $r$-combinations that can be chosen from a set of $n$ elements, $binom(n,r)$, is given by
  $
    binom(n,r) &= P(n,r) / r! \
    &"or" \
    binom(n,r) &= n! / (r! (n-r)!)
  $
])

#example([Calculating the Number of Teams] ,[
  Suppose there is a team of seventeen people comprised of eight men and nine women.

  How many ways can a group of nine be chosen to work on a project?
  - In terms of sets, we are looking for the number of distinct subsets of length $9$ of a set of length $17$.
  - Thus, the number of distinct teams can be calculated using $17$ choose $9$:
  $
    binom(17,9) &= 17! / (9!(17-8)!) \
    &= 12! / (5!(7!)) \
    
    &= bold(24310 "distinct teams")
  $

  How many groups of nine can be created with five women and four men?
  - We can view this as a two-step process. That is, choosing five out of the total women and four out of the total men.
  - Thus, by the multiplication rule,
  $
    binom(9, 5) dot binom(8,4) &= 9! / (5! (9-5)!) dot 8! / (4! (8-4)!) \
    &= 126 dot 70 \
    &= bold(8820 "distinct teams")
  $

  How many groups of nine can be created with at least one man?
  - Intuitively, because there are nine women, only one possible group won't have at least one man.
  - Thus, there are $24310 - 1 =$ *24309 distinct teams*.

  How many groups of nine can be created with at most three women?
  - There are three cases that fit this restriction: a team with one woman, two women, or three women. 
    A team with no women is not possible because there are only eight men.
  - Hence, by the multiplication rule and addition rule,
  $
    &binom(9,1) dot binom(8,8) + binom(9,2) dot binom(8,7) + binom(9,3) dot binom(8,6) \
    &= 9 dot 1 + 9! / (2! (9-2)!) dot 8! / (7!(8-7)!) + 9! / (3! (9-3)!) dot 8! / (6!(8-6)!) \
    &= 9 + 36 dot 8 + 84 dot 28 \
    &= bold(2649 "distinct teams")
  $
])
- However, $n$ choose $r$ may be involved in finding the $r$-permutations if _some_ elements in the ordered selection do not consider order.

#theorem([9.5.2], [
  Suppose a collection consists of $n$ objects with $n_k$ objects for each $k$th type, and that each type is distinct, but also indistinguishable from other objects of the same type. Additionally, suppose that $n_1 + n_2 + dots.c + n_k = n$. \
  Then, the number of distinguishable permutations of the $n$ objects is given by
  $
    binom(n,n_1) binom(n-n_1, n_2) binom(n-n_1-n_2, n_3) dots.c binom(n-n_1-n_2-dots.c-n_(k-1), n_k) \
    = n! / (n_1 ! n_2 ! dots.c n_k !)
  $
])

#example([Drug Tests with Mice], [
  Suppose a drug test is being tested on a group of 60 mice. Given that each mouse can only be assigned one treatment, 
  drug $A$ and drug $B$ will be administered to 21 mice each, and the remaining 18 mice will be used as controls.
  
  How many ways can the treatments be administered to the mice?
  - Instead of making continuous unordered selections, we can simply utilize the formula
    given by *Theorem 9.5.2.*
  $
    bold( 60! / (21! 21! 18 !) "distinct ways")
  $
])





=== Double Counting
- As displayed in the inclusion/exclusion rule for addition, there has to be consideration for overlapping elements.
- Suppose we are attempting to create a team of five containing at least one man from a pool of five men and seven women. Now, using $r$-combinations, how many possible teams following this restriction are there?
  - You might be tempted to choose a subset of one man from the group of five men, and then choose a subset of four people from the remaining eleven people. Then, by the multiplication rule:
  $
    binom(5,1) dot binom(11,4) = 1650 "five person teams with at least one man"
  $
  - The problem with this logic is that the separation of two unordered selection means that teams of the same people may be counted multiple times for each person pulled from the $5$ choose $1$ instead of the $11$ choose $4$.
  - The correct solution involves identifying the number of teams that contain no men at all.
  - Because it is a "complement" of the the subset of teams we are looking for, we can just subtract it from the total number of teams to get the answer.
  - Hence, by the difference rule:
  $
    binom(12,5) - binom(7, 5) &= 12! / (5! (12-5)!) - 7! / (5! (7-5)!) \
    &= (12 dot 11 dot 10 dot 9 dot 8 dot 7!) / (5! 7!) - (7 dot 6 dot 5!) / (5! 2!) "by recursive definition of" !\
    &= (12 dot 11 dot 10 dot 9 dot 8) / 5! - (7 dot 6) / 2! "by canceling" \
    &= (12 dot 11 dot 10 dot 9 dot 8) / 120 - (7 dot 6) / 2 "by simplifying !" \
    &= 11 dot 9 dot 8 - 7 dot 3 \
    &= 792 - 21 \
    &= bold(771 "five person teams with at least one man")
  $









#pagebreak()
== $r$-Combinations with Repetition Allowed
- Previously, the formula we used did not account for combinations where elements from the set of length $n$ were chosen multiple times.
- To understand the logic behind the formula, we can first think of finding all the $3$-combinations of ${6,7,41, 67}$ with repetition allowed:
$
  &{6,6,6}, {6,6,7}, {6,6,41}, {6,6,67} \
  &{6,7,7}, {6,7,41}, {6,7,67} \
  &{6,41,41}, {6,41,67} \
  &{6,67,67} \
  &{7,7,7},{7,7,41},{7,7,67} \
  &{7,41,41}, {7,41,67} \
  &{7,67,67} \
  &{41,41,41}, {41,41,67} \
  &{41,67,67} \
  &{67,67,67}\
$
- Here, there are twenty total $3$-combinations with repetition allowed from a set of $4$ elements.
- Now, we can represent this visually by marking all of the possible subsets, but differentiating the subsets with only *distinct elements* from the others.
- Because repeats are allowed, we can view each element as its own category to be selected from. We can mark these selections with $crossmark$.
- For instance, here is what the first selection would look like:
$
  mat(
    delim: #none,
    6,, 7,, 41,, 67;
    crossmark crossmark crossmark, |, , |, ,|
  )
$
- Because the line separators denote which element the $crossmark$s represent, the number of different locations the three $crossmark$s could occupy in the 6 character string is equal to the number of $3$-combinations with repetition allowed.
- This would be $6$ choose $3$, as the line separators naturally fall into the remaining indices of the string after the location of the $crossmark$s are decided.
$
  binom(6, 3) &= 6! / (3! (6 - 3)!) \
  &= 6! / (3!3!) \
  &= (6 dot 5 dot 4 dot 3!) / (3! 3!) \
  &= (6 dot 5 dot 4) / (3!) \
  &= 120 / 6 \
  &= bold(20 space r"-combinations with repetition allowed")
$
- Notice how there are $n-1$ line separators and $r$ $crossmark$s in every string.

#theorem([9.6.1], [
  The number of $r$-combinations with repetition allowed that can be selected from a set of $n$ elements is
  $
    binom(r+n-1, r) = (r+n-1)! / (r! (n-1)!)
  $
])

#example([Number of Solutions], [
  How many solutions are there to the equation $x_1 +x_2 +x_3 +x_4 = 10$, given that $x_1$, $x_2$, $x_3$, and $x_4$ are nonnegative integers?
  - Because $x_1$, $x_2$, $x_3$, and $x_4$ are all nonnegative integers, we can interpret the different solutions as ten $1$s being split across $x_1$, $x_2$, $x_3$, and $x_4$.
- Thus, $x_1$, $x_2$, $x_3$, and $x_4$ can be seen as the four categories.
  - For instance, $crossmark crossmark | crossmark crossmark | crossmark crossmark | crossmark crossmark crossmark crossmark$ would represent the solution $x_1 = x_2 = x_3 = 2$ and $x_4 = 4$.
- As a result, $n=4$ and $r=10$.
- Thus,
$
  binom(10 + 4 - 1,10) &= binom(13,10) \
  &= 13! / (10! (13-10)!) \
  &= 13! / (10! 3!) \
  &= (13 dot 12 dot 11 dot 10!) / (10! 3!) \
  &= (13 dot 12 dot 11) / 3! \
  &= (13 dot 12 dot 11) / 6 \
  &= 13 dot 2 dot 11 \
  &= bold(286 "solutions")
$
])

#example([Stocking Types of Items], [
  Suppose there is a camera shop that stocks eight different types of batteries who only has room
  to stock 29 batteries at any given time. Assume they have at least 29 batteries of each type in storage.

  How many ways can their sale of 29 batteries be distributed amongst the eight types?
  - There are eight types of batteries, and 29 possible slots at a time.
  - Thus,
  $
    binom(29+8-1,29) &= 36! / (29! 7!) \
    &= bold(8347680 "ways")
  $
  #continue_example
])

#example([_Stocking Types of Items continued_], [
  How about with at most three A76 batteries?
  - There are four cases with this restriction: no A76 batteries, one A76 battery, two A76 batteries, and three A76 batteries.
  - As a result, for each case, we are choosing from the seven remaining types to place on sale.
  - Hence, by the addition rule,
  $
    &binom(29 + 7 - 1, 29) + binom(29 + 7 - 1, 28) + binom(29 + 7 - 1, 27) + binom(29 + 7 - 1, 26) \
    &= 35! / (29! 6!) + 34! / (28! 6!) + 33! / (27! 6!) + 32! / (26! 6!) \
    &= 1623160+1344904+1107568+906192 \
    &= bold(4981824 "ways")
  $

  How about with at least four A76 batteries?
  - While we could solve this using the methodology as the previous question, you may also
    notice that this subset is the complement of the previous one.
  - Thus, there are $8347680 - 4981824 =$ *3365856 ways*.
])

#example([Counting Triples], [
  Given any positive integer $n$, how many triples of positive integers $(i,j,k)$ can be formed such that 
  $1 <=i <= j <= k <= n$?
  - Here, there are $n$ distinct integers, and three categories: $i$, $j$, and $k$.
  - For instance, given $n=3$, the string $crossmark crossmark | | crossmark$ would represent the triple $(1,1,3)$.
  - Thus,
  $
    binom(3 + n - 1, 3) &= (n + 2)! / (3! (n-1)!) \
    &= ((n+2)(n+1)(n)(n-1)!) / (6(n-1)!) \
    &= bold((n(n+2)(n+1)) / 6 "triples")
  $
  This example also has applications in counting the iterations of triple-nested loops.
])





=== $r$-Selection Variations
#table(
  columns: (1fr, 3fr, 3fr),
  inset: 8pt,
  align: (left, center, center),
  fill: (col, row) => if col == 0 or row == 0 {gray.lighten(75%)},
  [], [*Ordered*], [*Unordered*],
  [*Repetition*], [$ n^r $], [$ binom(r+n-1, r) = (r+n-1)! / (r! (n-1)!) $],
  [*Distinct*], [$ P(n,r) = n! / (n-r)! $], [$ binom(n, r) = n! / (r! (n-r)!) $]
)







#pagebreak()
== Pascal's Formula and the Binomial Theorem
- There are two main methods of proof for Pascal's formula and the binomial theorem: algebraic and combinatorial.
- Combinatorial proofs use counting logic to prove things.





=== Pascal's Formula
- Pascal's formula makes it easier to calculate larger combinations by splitting them into the addition of smaller combinations.
#theorem([9.7.1], [
  Let $n$ and $r$ be positive integers for $r <= n$. Then
$
  binom(n+1, r) = binom(n, r-1) + binom(n,r)
$
])
- Pascal's formula may also be represented geometrically in a sequence known as *Pascal's triangle* _(or the *arithmetic triangle*)_.
#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  stroke: white,
  align: center,
  fill: (col, row) => if col == 0 or row == 0 {blue.lighten(35%)},
  [], [0], [1], [2], [], [3], [$dots.c$], [$r-1$], [], [$r$],
  [0], [1], [], [], [], [], [], [$dots.v$], [], [],
  [1], [1], [1], [], [], [], [], [$dots.v$], [], [],
  [2], [1], [2], [1], [], [], [], [$dots.v$], [], [],
  [3], [1], [3], [3], [], [1], [], [$dots.v$], [], [],
  [4], [1], [4], [#text([*6*],fill: blue)], [#text($+$, fill: blue)], [#text([*4*],fill: blue)], [$dots.c$], [$dots.v$], [], [],
  [5], [1], [5], [10], [#text([$=$],fill: blue)], [#text([*10*],fill: blue)], [$dots.c$], [$dots.v$], [], [],
  [$dots.v$], [$dots.v$], [], [], [], [], [$dots.down$], [$dots.v$], [], [],
  [$n$], [$ binom(n,0) $], [$ binom(n,1) $], [$ binom(n,2) $], [], [$ binom(n,3) $], [$dots.c$], [#text(fill: blue, [$ bold(binom(n,r-1)) $])], [#text(fill: blue, [$+$])], [#text(fill: blue, [$ bold(binom(n,r)) $])],
  [$n+1$], [$ binom(n+1, 0) $], [$ binom(n+1, 1) $], [$ binom(n+1, 2) $], [], [$ binom(n+1, 3) $], [$dots$], [], [#text(fill: blue, [$=$])], [#text(fill: blue, [$ bold(binom(n+1,r)) $])],
)




=== The Binomial Theorem
- When expanding binomials to an $n$th power, there are many factors to consider.
- There are $2^n$ terms, however many are *like terms* that may be combined.
- Thus, expansions to large values of infinity can be very difficult to simplify.
- The *binomial theorem* provides an easy way to express binomials to an $n$th power.
- It hinges on a few facts about combinations and binomial expansions:
$
  binom(n, 0) = binom(n,n) = 1\
  "For" (a+b)^(n+k), "there are" binom(n+k, k) "like terms for" a^n b^k
$
#theorem([9.7.2], [
  Given any real numbers $a$ and $b$ and any nonnegative integer $n$,
  $
    (a+b)^n &= sum_(k=0)^(n) binom(n,k)a^(n-k)b^k \
    &= a^n + binom(n, 1)a^(n-1)b + binom(n, 2)a^(n-2)b^2 + dots.c + binom(n,n-1)a b^(n-1) + b^n
  $
])

#example([Applying the Binomial Theorem], [
  Expand $(a+b)^5$ using the binomial theorem.
  $
    (a+b)^5 &= sum_(k=0)^(5)binom(5,k)a^(5-k) b^k \
    &= a^5 + binom(5,1) a^4 b + binom(5,2) a^3 b^2 + binom(5,3) a^2 b^3 + binom(5,4) a b^4 + b^5 \
    &= bold(a^5 + 5a^4 b + 10a^3 b^2 + 10a^2 b^3 + 5a b^4 + b^5)
  $

  Expand $(u-3v)^4$ using the binomial theorem.
  $
    (u-3v)^4 &= sum_(k=0)^(4) binom(4, k) u^(4-k) (-3v)^k \
    &= u^4 + binom(4, 1) u^3 (-3v) + binom(4,2) u^2 (-3v)^2 + binom(4,3) u (-3v)^3 + (-3v)^4 \
    &= u^4 + (4)(-3)u^3v + (6)(9)u^2 v^2 + (4)(-27)u v^3 + (81)v \
    &= bold(u^4 - 12u^3 v + 54u^2 v^2 - 108 u v^3 + 81v^4)
  $

  Express the following summation as a binomial to an $n$th power using the binomial theorem:
  $
    sum_(k=0)^(n)binom(n, k) 66^k
  $
  - Notice how this matches everything in the binomial theorem except for the $a^(n-k)$ value.
  - We can express $a$ as 1, and by extension, $1^(n-k)$, because 1 raised to any power is still 1.
  - This allows us to convert the summation to $(a+b)^n$ form using the binomial theorem.
  $
    sum_(k=0)^(n)binom(n, k) 66^k &= sum_(k=0)^(n)binom(n, k)1 dot 66^k \
    &= sum_(k=0)^(n)binom(n, k)1^(n-k) dot 66^k \
    &= (1+66)^n \
    &= bold(67^n)
  $
])