#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes

#set page("a4", numbering: "1 of 1")
#set text(font: "New Computer Modern Sans")
#show title: set text(size: 24pt)
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 2): set text(size: 18pt)
#show heading.where(level: 3): set text(size: 16pt)
#show math.equation: set text(font: "New Computer Modern Sans Math")
#show sym.emptyset: set text(font: "Fira Sans")

#let author = text(size: 16pt, [Miagao])










#figure([
  #title([Discrete Mathematics Exam 3 Practice])
  #author
])





= Problem 1
Considering the Venn diagram below:
#figure(
  diagram(
    node-fill: none,
    node-stroke: 2pt,
    edge-stroke: 1.5pt,
    node((-0.4, 0), [#text(size: 20pt, [$A$], fill: blue)], radius: 5em, stroke: blue),

    node((0.4, 0), [#text(size: 20pt, [$B$], fill: red)], radius: 5em, stroke: red),

    node((0, .6), [#text(size: 20pt, [$C$], fill: green)], radius: 5em, stroke: green),

    node((1, .7), [#text(size: 20pt, [$U$], fill: purple)], stroke: none),


    node((-0.6, -0.4), [#text(size: 15pt, [1])], stroke: none),

    node((0, -0.1), [#text(size: 15pt, [2])], stroke: none),

    node((0.6, -0.4), [#text(size: 15pt, [3])], stroke: none),

    node((0, 0.19), [#text(size: 13pt, [4])], stroke: none),

    node((-0.3, 0.35), [#text(size: 15pt, [5])], stroke: none),

    node((-0.3, 0.35), [#text(size: 15pt, [5])], stroke: none),

    node((0.3, 0.35), [#text(size: 15pt, [6])], stroke: none),

    node((0, 0.85), [#text(size: 15pt, [7])], stroke: none),

    node((.9, 0.45), [#text(size: 15pt, [8])], stroke: none),

    node((-1, 0.7), [#text(size: 15pt, [8])], stroke: none),
  ),
)
\
$
  A = {1,2,4,5} \
  B = {2,3,4,6} \
  C = {4,5,6,7} \
  U = {1,2,3,4,5,6,7,8}
$
Prove that $(A inter C)^complement = {1,2,3,6,7,8}$ and that $(B union C) - (A inter C) = {2,3,6,7}$

== Answer 1
$
  A inter C &= {4,5} \
  (A inter C)^complement &= U - {4,5} \
  &= bold({1,2,3,6,7,8})
$

== Answer 2
$
  B union C &= {2,3,4,5,6,7} \
  A inter C &= {4,5} \
  (B union C) - {A inter C} &= bold({2,3,6,7})
$









#pagebreak()
= Problem 2
$C$ is the circle relation on $RR$ such that:

#set align(center)
_For every $x,y in RR$,_
$
  x op(C) y <=> x^2 +y^2 = 1
$
#set align(left)
Determine whether $C$ is reflexive, symmetric, and/or transitive.

== Answer
_Is $C$ reflexive?_ \
- Suppose that $x$ is any element of $RR$.
$
  x^2 + x^2 &= 1 \
  2x^2 &= 1 \
  x^2 &= 1/2 \
$
- Plug in $x = 1$.
$
  1^2 &= 1 /2 \
  1 &eq.not 1/2
$
- *$bold(C)$ is not reflexive.*

_Is $C$ symmetric?_ \
- Suppose that $x$ and $y$ are any elements of $RR$ such that
$
  x^2 + y^2 = 1
$
- By definition of $C$, $x op(C) y$.
- By the commutative property of addition:
$
  y^2 + x^2 = 1
$
- Hence, by definition of $C$, $y op(C) x$.
- *$bold(C)$ is symmetric.*

_Is $C$ transitive?_
- Suppose that $x$, $y$, and $z$ are any elements of $RR$ such that
$
  x^2 +y^2 = 1
  "and"
  y^2 +z^2 = 1
$
- By definition of $C$, $x op(C) y$ and $y op(C) z$.
- Now:
$
  y^2 +z^2 &= 1 \
  y^2 &= 1 - z^2 \ \

  x^2 + y^2 &= 1 \
  x^2 + 1 -z^2 &= 1 \
  x^2 = z^2
$
- Plug in $x=1$ and $z=2$.
$
  1^2 &= 2^2 \
  1 eq.not 4
$
- *$bold(C)$ is not transitive.*









#pagebreak()
= Problem 3
$O$ is the  relation on $ZZ$ as follows:

#set align(center)
_For every $m,n in ZZ$,_
$
  m op(O) n <=> m - n "is odd"
$
#set align(left)
Determine whether $O$ is reflexive, symmetric, and/or transitive.

== Answer
_Is $O$ reflexive?_
- Suppose that $m$ is any integer.
$
  m - m &= 0
$
- By definition of even, 0 is even, and thus is not odd.
- By definition of $O$, $m$ is not related to $m$ by $O$.
- *$bold(O)$ is not reflexive.*

_Is $O$ symmetric?_
- Suppose that $m$ and $n$ are any integers such that
$
  m op(O) n
$
- By definition of $O$, $m-n$ equals an odd integer.
- By definition of odd, $m-n=2k+1$ for some integer $k$.
- Now,
$
  m - n &= 2k + 1 \
  -m + n &= -2k - 1 "by multiplying by" -1 \
  n-m &= -2k - 1 "by commutative property" \
  n-m &= -2k-2+1 "by subtracting 1 and adding 1" \
  n-m &= 2(-k-1) + 1 "by distributive property"
$
- Because $ZZ$ is closed under subtraction and multiplication, $(-k-1)$ is an integer.
- By definition of odd, $2(-k-1)+1$ is odd.
- By definition of $O$, $n op(O) m$.
- *$bold(O)$ is symmetric.*

_Is $O$ transitive?_
- Suppose that $m$, $n$, and $p$ are any integers such that
$
  m op(O) n "and" n op(O) p
$
- By definition of $O$, $m-n$ and $n-p$ both equal odd integers.
- By definition of odd, $m-n=2r+1$ and $n-p=2s+1$ for some integers $r$ and $s$.
- Now,
$
  m-n &= 2r+1 \
  m-n+n-p &= 2r+1 + 2s +1 "by adding" n op(O) p \
  m - p &= 4s + 2 \
  m- p &= 2(2s+1)
$
- Because $ZZ$ is closued under multiplication and addition, $(2s+1)$ is an integer.
- By definition of even, $2(2s+1)$ is even, and by extension, not odd.
- By definition of $O$, $m$ is not related to $p$ by $O$.
- *$bold(O)$ is not transitive*.









#pagebreak()
= Problem 4
Find inverse function $G$ for
$
  F(x) = (x-1)/4
$

== Answer
$
  F(x) &= (x-1)/4 \
  y &= (x-1)/4 "by definition of" F\
  4y &= x-1 \
  4y + 1 &= x \
  x &= 4y + 1 "because equality is symmetric" \
  bold(G(y) &= 4y + 1) "by definition of inverse"
$









#pagebreak()
= Problem 5
Define $F : RR -> RR$ and $G: RR -> ZZ$ as follows:

#set align(center)
_For all $x in RR$,_
$
  F(x) &= x^2 / 4 \
  G(x) &= floor(x)
$
#set align(left)

What is $(G compose F)(7)$?
== Answer
$
  (G compose F)(x) &= floor(x^2 / 4) \ \

  (G compose F)(7) &= floor(7^2 / 4) \
  &= floor(49 / 4) \
  &=floor(12.25) \
  &= bold(12)
$









#pagebreak()
= Problem 6
If 5 integers are chosen from ${1,2,3,4,5,6,7,8}$, must there be at least two integers with the property that the larger of the two minus the smaller of the two equals 2?

== Answer
- We can start by partitioning the set into pairs of integers that satisfy the property:
$
  {1,3}, {2,4}, {5,7}, {6,8}
$
- Now, these sets are all disjoint, and altogether make up the partition of the original set.
  - This means that every integer appears exactly once across all these subsets.
- Thus, if we think about the different integers as pigeons, and the different pair subsets they may be part of as the pigeonholes, then there are 5 pigeons as opposed to 4 pigeonholes.
- Thus, by the pigeonhole principle, after choosing 5 different integers from the original set, at least one of the subset will have both of their integers chosen.
- *Now, because each of the subsets formed is a pair of integers that satisfy the aforementioned property, this means that when 5 integers are chosen, it is guaranteed that there will be at least two integers that satisfy the property.*









#pagebreak()
= Problem 7
Prove that for each even integer $n$ for $6 <= n <= 18$, $n$ can be written as the sum of exactly two prime numbers.

== Answer
$
  6 &= 3+3 \
  8 &= 3+5 \
  10 &= 5+5 \
  12 &=5+7 \
  14 &= 7+7 \
  16 &= 5+11 \
  18 &= 7+11 \
$









#pagebreak()
= Problem 8
A club has seven members. Three are chosen to go as a group to a national meeting.
+ How many distinct groups of three can be chosen?
+ If the club contains four men and three women, how many distinct groups of three contain two men and one woman?

== Answer 1
$
  binom(7,3) &= 7! / (3! (7-3)!) \
  &= 7! / (3! 4!) \
  &= (7 dot 6 dot 5 dot 4!) / (3! 4!) \
  &= (7 dot 6 dot 5) / 3! \
  &= 7 dot 5 \
  &= bold(35 "distinct groups of three")
$

== Answer 2
$
  binom(4,2) dot binom(3, 1) &= 4! / (2! (4-2)!) dot 3 \
  &= 4! / (2! 2!) dot 3 \
  &= 24 / 4 dot 3 \
  &= 6 dot 3 \
  &= bold(18 "distinct groups with two men and one woman")
$









#pagebreak()
= Problem 9
Let $S$ be the set of all strings of 0s and 1s of length 3. Define a relation $R$ on $S$ as follows:

#set align(center)
_For all strings $s$ and $t in S$,_
$
  s op(R) t <=> "The two leftmost characters in" s "are the same as the two leftmost characters in" t
$
#set align(left)

Prove that $R$ is an equivalence relation on $S$.

== Answer
_Proving that $R$ is reflexive:_
- Suppose that $s$ is any string in $S$.
- Logically, it follows that the two leftmost characters of $s$ are the same as the two leftmost characters of $s$.
- Hence, by definition of $R$, $s op(R) s$.
- *Thus, $bold(R)$ is reflexive.*

_Proving that $R$ is symmetric:_
- Suppose that $s$ and $t$ are any strings in $S$ such that
$
  s op(R) t
$
- By definition of $R$, the two leftmost characters in $s$ are the same as the two leftmost characters in $t$.
- Logically, it follows that the two leftmost characters in $t$ are also the same as the two leftmost characters in $s$.
- Hence, by definition of $R$, $t op(R) s$.
- *Thus, $bold(R)$ is symmetric.*

_Proving that $R$ is transitive:_
- Suppose that $s$, $t$, and $u$ are any strings in $S$ such that
$
  s op(R) t "and" t op(R) u
$
- By definition of $R$, the two leftmost characters in $s$ are the same as the two leftmost characters in $t$ and the two leftmost characters in $t$ are the same as the two leftmost characters in $u$.
- Logically, it follows that the two leftmost characters in $s$ are the same as the two leftmost characters in $u$.
- Hence, by definition of $R$, $s op(R) u$.
- *Thus, $bold(R)$ is transitive.*

*Because $bold(R)$ is reflexive, symmetric, and transitive, it is an equivalence relation.*









#pagebreak()
= Problem 10
Let $R$ be the relation defined on $ZZ$ as follows:

#set align(center)
_For integers $m$ and $n in R$,_
$
  m op(R) n <=> 5 divides (m-n)
$
#set align(left)
Prove that $R$ is an equivalence relation.

== Answer
_Proving that $R$ is reflexive:_
- Suppose $m$ is any integer.
$
  m-m = 0
$
- By definition of divisibility, 5 divides 0 because $0 = 5 dot 0$.
- By definition of $R$, $5 divides (m-m)$.
- *Thus, $bold(R)$ is reflexive.*

_Proving that $R$ is symmetric:_
- Suppose that $m$ and $n$ are any integers such that
$
  m op(R) n
$
- By definition of $R$, $5 divides (m-n)$
- By definition of divisibility, $m-n = 5k$ for some integer $k$.
$
  m-n &= 5k \
  -m +n &= -5k "by multiplying by" -1 \
  n-m &= -5k "by commutative property" \
  n-m &= 5(-k) "by associative property"
$
- Because $ZZ$ is closed under multiplication, $(-k)$ is an integer.
- Thus, by definition of divisibility, $5 divides (n-m)$.
- By definition of $R$, $n op(R) m$.
- *Thus, $bold(R)$ is symmetric.*

_Proving that $R$ is transitive:_
- Suppose that $m$, $n$, and $p$ are any integers such that
$
  m op(R) n "and" n op(R) p
$
- By definition of $R$, $5 divides (m-n)$ and $5 divides (n-p)$.
- By definition of divisibility, $m-n = 5r$ and $n-p = 5s$ for some integers $r$ and $s$.
$
  m - n &= 5r \
  m - n + n - p &= 5r + 5s "by adding them together" \
  m - p &= 5r + 5s \ 
  m - p &= 5(r+s) "by distributive property" \
$
- Because $ZZ$ is closed under addition, $(r+s)$ is an integer.
- Thus, by definition of divisibility, $5 divides (m-p)$.
- By definition of $R$, $m op(R) p$.
- *Thus, $bold(R)$ is transitive.* _(Final answer on next page)._

*Because $bold(R)$ is reflexive, symmetric, and transitive, it is an equivalence relation.*









#pagebreak()
= Problem 11
In a class with 30 students, three quizzes were given.
- 15 scored 12 or higher on quiz \#1.
- 12 scored 12 or higher on quiz \#2.
- 18 scored 12 or higher on quiz \#3.
- 7 scored 12 or higher on quiz \#1 and quiz \#2.
- 11 scored 12 or higher on quiz \#1 and quiz \#3.
- 8 scored 12 or higher on quiz \#2 and quiz \#3.
- 4 scored 12 or higher on quiz \#1, quiz \#2, and quiz \#3.

How many students scored 12 or higher on quiz \#1 and \#2, but not quiz \#3?

== Answer
- Out of the 7 students who scored 12 or higher on quiz \#1 and \#2, 4 of them also scored 12 or higher on quiz \#3.
- Thus $7-4=bold(3)$ *students scored 12 or higher on quiz \#1 and \#2, but not on quiz \#3.*









#pagebreak()
= Problem 12
Let $R$ be a congruence modulo 5 relation. Which of the following equivalence classes are equal?
$
  [35], [3], [12], [0], [-2], [17], [492]
$

== Answer
$
  [0] &= [35] \
  [-2] &= [3] \
  [12] &= [17] = [492] 
$









#pagebreak()
= Problem 13
A function, $F: RR times RR -> RR times RR$ is defined as follows:

#set align(center)
_For all $(x,y) in RR times RR$,_
$
  F(x,y) &= (3y-1, 1-x)
$
#set align(left)
Prove that $F$ is a one-to-one correspondence.

== Answer
_Proving that $F$ is one-to-one:_
- Suppose $x_1$, $y_1$, $x_2$, and $y_2$ are real numbers such that $F(x_1, y_1) &= F(x_2, y_2)$.
$
  F(x_1, y_1) &= F(x_2, y_2) \
  (3y_1 - 1, 1-x_1) &= (3y_2 - 1, 1-x_2) 
$

- Equating the left sides of both tuples:
$
  3y_1 - 1 &= 3y_2 - 1 \
  3y_1 &= 3y_2 \
  y_1 &= y_2
$

- Equating the right sides of both tuples:
$
  1-x_1 &= 1-x_2 \
  -x_1 &= -x_2 \
  x_1 &= x_2
$

- Thus, by definition of equality for tuples, $(x_1, y_1) = (x_2, y_2)$.
- *Therefore, $bold(F)$ is one-to-one.*

_Proving that $F$ is onto:_
- Suppose $(u,v)$ is any tuple in $RR times RR$.
- Let $x = 1-v$ and $y = 1/3 u + 1/3$.
$
  F(x,y) &= F(1-v, 1/3 u + 1/3) \
  &= (3(1/3 u + 1/3) - 1, 1-(1-v)) \
  &= (u + 1- 1, 1-1+v) \
  &= (u, v)
$
- *Therefore, $bold(F)$ is onto.*

*Because $bold(F)$ is one-to-one and onto, it is a one-to-one correspondence.*









#pagebreak()
= Problem 14
Consider the Boolean function $f$ defined as follows:

#set align(center)
_For every $(x_1,x_2,x_3)$ of 0s and 1s,_
$
  f(x_1, x_2, x_3) = (7x_1 + 2x_2 + 6x_3) mod 2
$
#set align(left)
Compute $f(0,0,0)$, $f(0,0,1)$, $f(1,1,0)$, $f(0,1,1)$, and $f(0,1,0)$.

== Answer
$
  f(0,0,0) &= (7 dot 0 + 2 dot 0 + 6 dot 0) mod 2 \
  &= 0 mod 2\
  &= bold(0) \ \

  f(0,0,1) &= (7 dot 0 + 2dot 0 + 6 dot 1) mod 2 \
  &= 6 mod 2 \
  &= bold(0) \ \

  f(1,1,0) &= (7 dot 1 + 2 dot 1 + 6 dot 0) mod 2 \
  &= (7 + 2) mod 2 \
  &= 9 mod 2 \
  &= bold(1) \ \

  f(0,1,1) &= (7 dot 0 + 2 dot 1 + 6 dot 1) mod 2 \
  &= (6 + 2) mod 2 \
  &= 8 mod 2 \
  &= bold(0) \ \

  f(0,1,0) &= (7 dot 0 + 2dot 1 + 6 dot 0) mod 2 \
  &= 2 mod 2 \
  &= bold(0)
$









#pagebreak()
= Problem 15
Let $A = {a,b,c,d}$ and let $R$ be defined on $A$ as follows:

#set align(center)
$
  R = {(a,a), (b,b), (b,d), (c,c), (d,b), (d,d)}
$
#set align(left)
Additionally, $R$ is an equivalence relation.
How many distinct equivalence classes does $R$ have?

== Answer
$
  [a] &= {a} \
  [b] &= {b, d} \
  [c] &= {c} \
  [d] &= {b,d} &= [b]\ \ 
$
- Thus, $R$ has *3 distinct equivalence classes: $bold({a})$, $bold({b,d})$ and $bold({c})$.*









#pagebreak()
= Problem 16
There are 50 people at a party whose ages range from 18 to 25 years old. What is the largest amount of people you can be certain are the same age at the party?

== Answer
- Because the possible ages at the party are between 18 and 25, inclusive, there are 8 possible ages people could be.
- Imagining the people at the party as pigeons and the possible ages as pigeonholes, there must be at least one age that $k+1$ people share by the generalized pigeonhole principle.
- We can maximizing $k$ by finding the integer quotient of the number of people divided by the number of possible ages.
$
  k &= floor(50 / 8) \
  &= floor(6.25) \
  &= 6
$
- Thus, there are at least $6+1=bold(7)$ *people who have the same age at the party.*










#pagebreak()
= Problem 17
Find a positive inverse for $5 mod 49$.
== Answer
- Let $n$ be the positive inverse for $5 mod 49$
$
  5n &mod 49 \ \

  1 &= 5n - 49k "for some integer" k \
  1 + 49k &= 5n \ \
$

- Now, $k$ may be any integer. Thus, we can choose $k=1$.
$
  1+ 49 &= 5n \
  50 &= 5n \
  5n &= 50 \
  n &= 10
$

- *10 is a positive inverse for $bold(5 mod 49)$.*