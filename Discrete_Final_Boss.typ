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
  #title([FINAL BOSS])
  #author \
  Finish this, Joker!
])









#pagebreak()
= Problem 1
Proving using rules of inference that:
$
  (P => not Q) and (Q => not P) equiv not P or not Q
$

== Answer
$
  (P => not Q) and (Q => not P) &equiv (not P or not Q) and (not Q or not P) "by logical equivalence of implications" \
  &equiv (not P or not Q) and (not P or not Q) "by commutative laws" \
  bold(&equiv not P or not Q "by idempotent laws")
$









#pagebreak()
= Problem 2
Prove that the following argument is invalid:

If this number is larger than 9, then its square is larger than 81. \
The number is not larger than 9. \
Its square is not larger than 81.

== Answer
- Let $p$ be "the number is larger than 9" and $q$ be "the number's square is larger than 81."
- Thus, the argument can be expressed as follows:
$
  p => q \
  not p \
  therefore not q
$
- *Thus, this argument form is invalid by inverse error.*







#pagebreak()
= Problem 3
Use De Morgan's Laws to convert the following statement to another equivalent form:
$
  not (p => p or q)
$
The choices are as follows:
$
  &bold(c) \
  &bold(t) \
  &p and q \
  &not p or not q
$

== Answer
$
  not(p => p or q) &equiv p and not(p or q) "by negation of implication" \
  &equiv p and (not p and not q) "by DeMorgan's laws" \
  &equiv (p and not p) and not q "by associative laws" \
  &equiv bold(c) and not q "by negation laws" \
  &equiv bold(c) "by universal bound laws"
$
- Thus, the correct choice is $bold(c)$, contradiction.








#pagebreak()
= Problem 4
Convert the following 8-bit binary representation to its two's complement form:
$
  10110100
$
== Answer
- _Inverting all bits:_
$
  01001011
$
- _Adding 1:_
$
  01001100
$
- The two's complement for 10110100 is *01001100*.









#pagebreak()
= Problem 5
How many distinct equivalence classes exist in the relation $R$ defined as follows:
$
  x op(R) y <=> 7 divides (2x - y)
$

== Answer
- As a congruence modulo $n$ relation, there should exist $n$ possible remainders from $0$ to $n-1$.
- Therefore, there are $n$ distinct equivalence classes, or in this case, *7*.









#pagebreak()
= Problem 6
What is the truth value of the following statement:
$
  (p or not p)
$

== Answer
$
  p or not p equiv bold(t)
$
- Because the statement is logically equivalent to a tautology, it is always *true.*









#pagebreak()
= Problem 7
A club has seven members. Three are chosen to go as a group to a national meeting. 
If the club contains four men and three women, how many distinct groups of three contain at most two men?

== Answer
$
  binom(3, 3) + binom(4,1) dot binom(3,2) + binom(4,2) dot binom(3,1) &= 1 + 4 dot 3! / (2! (3-2)!) + 4! / (2! (4-2)!) dot 3 \
  &= 1 + 4 dot 3! / 2! + 4! / (2! 2!) dot 3 \
  &= 1 + 4 dot 6 / 2 + 24 / 4 dot 3 \
  &= 1 + 24 / 2 + 72 /4 \
  &= 1 + 12 + 18 \
  &= bold(31 "distinct groups with at most two men") 
$









#pagebreak()
= Problem 8
Consider the following digital logic circuit: \
_too lazy to draw this out honestly_

- $P$ is an input to the OR-gate.
- $Q$ is an input to the OR-gate and an inverter.
- $R$ is an input to the first AND-gate.
- The inverter is an input to the first AND-gate.
- The OR-gate and the first AND-gate are inputs to the second AND-gate.
- $P$ is the output of $Q and R$
Construct a boolean expression.

== Answer
$
  (P or Q) and (not Q and not R) equiv bold(((Q and R) or Q) and (not Q and not R))
$









#pagebreak()
= Problem 9
Show your work to prove that
$
  111_10 = 01101111_2
$ 

== Answer
$
  111_10 &= (111 - 64) + 2^6 \
  &= 47 + 2^6 \
  &= (47 - 32) + 2^6 + 2^5 \
  &= 15 + 2^6 + 2^5 \
  &= (15-8) + 2^6 + 2^5 + 2^3 \
  &= 7 + 2^6 + 2^5 + 2^3 \
  &= (7-4) + 2^6 + 2^5 + 2^3 + 2^2 \
  &= 3 + 2^6 + 2^5 + 2^3 + 2^2 \
  &= (3-2) + 2^6 + 2^5 + 2^3 + 2^2 + 2^1 \
  &= 1 + 2^6 + 2^5 + 2^3 + 2^2 + 2^1 \
  &= (1-1) + 2^6 + 2^5 + 2^3 + 2^2 + 2^1 + 2^0 \
  &= 2^6 + 2^5 + 2^3 + 2^2 + 2^1 + 2^0 \
  &= bold(01101111_2)
$










#pagebreak()
= Problem 10
Show your work to prove that the 8-bit representation of to the two's complement for -49 is $11001111_2$.

== Answer
- _Finding the 8-bit representation of 49:_
$
  49 &= (49 - 32) + 2^5 \
  &= 17 + 2^5 \
  &= (17-16) + 2^5 + 2^4 \
  &= 1 + 2^5 + 2^4 \
  &= (1-1) + 2^5 + 2^4 + 2^0 \
  &= 2^5 + 2^4 + 2^0 \
  &= 00110001_2
$

- _Inverting all bits:_
$
  11001110
$

- _Adding 1:_
$
  11001111
$

- The two's complement for -49 is $bold(11001111_2)$, as stated in the question.









#pagebreak()
= Problem 11
A coin is tossed three times. What is the probability that exactly one tail occurs?

== Answer
- Because this is an ordered selection with repetition allowed, there are $2^3 = 8$ possible outcomes.
- Additionally, because there are 3 tosses, there are exactly three ways that one flip results in a tail.
- Thus, the probability is $3 / 8 = bold(37.5%)$.









#pagebreak()
= Problem 12
Evaluate $C(10,2)$ without repetition.

== Answer
$
  C(10,2) &= binom(10, 2) \
  &= 10! / (2! (10-2)!) \
  &= 10! / (2! 8!) \
  &= (10 dot 9 dot 8!) / (2! 8!) \
  &= (10 dot 9) / 2! \
  &= 90 / 2! \
  &= 90 / 2 \
  &= bold(45)
$









#pagebreak()
= Problem 13
A simply connected graph with 9 vertices has 5 vertices of degree 3, 3 vertices of degree 4, and 1 vertex of degree 5.

== Answer
- The total degree of the graph is $5 dot 3 + 3 dot 4 + 1 dot 5 = 15 + 12 + 5 = 32$.
- According to the handshaking lemma, the total degree of a simply connected graph is double the number of edges in the graph.
- Hence, there are $32 slash 2 = bold(16)$ *edges in the graph.*









#pagebreak()
= Problem 14
+ If the smallest of 56 consecutive integers is 279, what is the largest?
+ If the largest of 56 consecutive integers is 279, what is the smallest?
= Answer

- Let $n$ be the largest integer of the 56 consecutive integers in part 1.
$
  n - 279 + 1 &= 56 \
  n -278 &= 56 \
  n &= bold(334)
$

- Let $m$ be the smallest of the 56 consecutive integers in part 2.
$
  279 - m + 1 &= 56 \
  280 - m &= 56 \
  280 &= 56 + m \
  224 &= m \
  m &= bold(224)
$









#pagebreak()
= Problem 15
Show that in a group of 35 people and friendship is mutual, prove that there exists at least two people who have the same number of friends.

== Answer
- In a group of 35 people, there are 34 different amounts of friends that people may have
  because it is impossible for there to exist people in the group who have 0 friends and 34 friends at the same time.
- Now, equating the the number of people in the group to pigeons, and the possible amounts of friends to have as pigeonholes, 
  there must exist a number of friends such that more than one person has that number of friends by the pigeonhole principle.








#pagebreak()
= Problem 16
For the expression tree corresponding the following expression:
$
  (2 + 5) dot (5 - 2)
$
What is the height of the expression tree?

== Answer
- We can imagine the $(2+5)$ and $(5-2)$ as the children of the multiplication symbol.
- Furthermore, we can imagine 2 and 5 as the children of the addition symbol, 
  and we can imagine 5 and 2 as the children of the subtraction symbol.
- Thus, the height of the expression tree is *3.*









#pagebreak()
= Problem 17
Prove that for all integers $n$ ,$k$, and $r$ for $n >= k >= r$ that
$
  binom(n, k) dot binom(k, r) &= binom(n, r) dot binom(n-r, k-r)
$

== Answer
$
  binom(n, k) dot binom(k, r) &= n! / (k! (n-k)!) dot k! / (r! (k-r)!) \
  &= (n! k!) / (k! (n-k)! r! (k-r)!) \
  &= n! / ((n-k)! r! (k-r)!) \
  &= (n! (n-r)!) / ((n-k)! r! (k-r!) (n-r)!) \
  &= n! / (r! (n-r!)) dot (n-r)! / ((n-k)! (k-r)!) \ 
  &= n! / (r! (n-r!)) dot (n-r)! / ((k-r)! (n-k)!) \
  &= n! / (r! (n-r!)) dot (n-r)! / ((k-r)! (n-r-k+r)!) \
  &= n! / (r! (n-r!)) dot (n-r)! / ((k-r)! (n-r-(k-r))!) \
  &= bold(binom(n, r) dot binom(n-r, k-r))
$









#pagebreak()
= Problem 18
200 students were asked to fill out a form with three survey questions as follows:
- $H$: Honor Roll
- $C$: Club membership
- $D$: Double-major

The survey results were as follows:
- 56 students checked $H$.
- 52 students checked $C$.
- 28 students checked $D$.
- 16 students checked $H$ and $C$.
- 8 students checked $H$ and $D$.
- 6 students checked $C$ and $D$.
- 4 students checked all 3 boxes.

Given that information:
+ How many students didn't check any of the boxes?
+ How many students checked exactly 2 boxes?
+ How many students checked at least 2 boxes?
+ How many students only checked the $C$ box?

== Answer
+ $56 + 52 + 28 - 16 - 8 - 6 + 4 = 110$ students checked boxes. 
  Thus, $200 - 110 = bold(90)$ *students didn't check any of the boxes.*
+ $(16 - 4) + (8 - 4) + (6 - 4) = 12  + 4 + 2= bold(18)$ *students checked at two boxes.*
+ Because 18 students checked two boxes, $18 + 4 = bold(22)$ *students checked at least two boxes.*
+ $52 - (16 - 4) - (6 - 4) - 4 = 52 - 12 - 2 - 4 = bold(34)$ *students only checked the $bold(C)$ box.*









#pagebreak()
= Problem 19
Let $R = {(a,b), (a,c), (b,b), (b,d), (c,c), (d,a)}$.

Find $R^t$.

== Answer
$
  bold(R^t = {(a,b), (a,c), (a,d), (b,a) (b,b), (b,d), (c,c), (d,a), (d,b), (d,c)})
$









#pagebreak()
= Problem 20
Three officers---a president, a treasurer, and a secretary---are chosen from among 4 people: 
Ann, Bob, Cyd, and Dan. Ann cannot be president and either Cyd or Dan must be secretary.

How many ways can the officers be chosen?

== Answer
- We can start by outlining the constraints
  - Ann cannot be president.
  - The secretary must be Cyd or Dan.
- Now, we can start listing all of the possibilities using the following format: 
#align(center, [_(president, treasurer, secretary)._])
+ (Bob, Ann, Cyd)
+ (Bob, Ann, Dan)
+ (Bob, Cyd, Dan)
+ (Bob, Dan, Cyd)
+ (Cyd, Ann, Dan)
+ (Cyd, Bob, Dan)
+ (Dan, Ann, Cyd)
+ (Dan, bob, Cyd)
- Hence, there are *8 ways the officers can be chosen.*








#pagebreak()
= Problem 21
Two normal six-sided dice are rolled and their results are added.
+ What is the probability of rolling a sum of at least 11?
+ What is the probability of rolling an even number?
+ What is the total that is least likely to result?

== Answer
+ The ways to roll a sum of at least 11 are as follows: $5+6, 6+5, 6+6$ and there are 36 ways to roll two normal dice. 
  Thus, the probability of rolling a sum of at least 11 is $3 slash 36 = bold(1 slash 12)$.
+ There are two cases that result in an even sum---both dice roll an even number or both dice roll an odd number. 
  Thus, there are $3^2 + 3^2 = 9 + 9 = 18$ ways of rolling an even number. Hence, the probability of rolling an even number is $18 slash 36 = bold(1 slash 2)$ .
+ The totals that are least likely to result are *2 and 12.*









#pagebreak()
= Problem 22
Considering the following digital logic circuit:

_Yeah I am not making this either._
- $P$ is an input to the first AND-gate, to the second AND-gate, and to an inverter to the third AND-gate.
- $Q$ is an input to the first AND-gate, to an inverter to the second AND-gate, and to an inverter to the third AND-gate.
- $R$ is an input to an inverter to the first AND-gate, to the second AND-gate, and to the third AND-gate.
- The first, second, and third AND-gates are inputs to an OR-gate.
- The output of the OR-gate is denoted as $S$.

What is the value of $S$ when $P = Q  =R = 0$?

== Answer
$
  S &=(P and Q and not R) or (P and not Q and R) or (not P and not Q and R) \
  S &=(0 and 0 and not 0) or (0 and not 0 and 0) or (not 0 and not 0 and 0) \
  S &=(0 and 0 and 1) or (0 and 1 and 1) or (1 and 1 and 0) \
  S &= 0 or 0 or 0 \
  S &= bold(0)
$









#pagebreak()
= Problem 23
What is the third term of $(2x^2 - 3y)^5$?

== Answer
- The third term of $(2x^2 - 3y)^5$, according to the binomial theorem, is the third term provided by
$
  sum_(k=0)^5 binom(n, k) (2x^2)^(n-k) (-3y)^k
$

- Thus, the third term of $(2x^2 - 3y)^5$ is
$
  binom(5, 2) (2x^2)^(5-2) (-3y)^2 &= 5! / (2! (5-2)!) dot (2x^2)^3 dot (-3y)^2 \
  &= 6! / (2! 3!) dot (2x^2)^3 dot (-3y)^2 \
  &= (5 dot 4 dot 3!) / (2! 3!) dot (2x^2)^3 dot (-3y)^2 \
  &= (5 dot 4) / (2!) dot (2x^2)^3 dot (-3y)^2 \
  &= (5 dot 4) / (2) dot (2x^2)^3 dot (-3y)^2 \
  &= 5 dot 2 dot (2x^2)^3 dot (-3y)^2 \
  &= 10 dot (2x^2)^3 dot (-3y)^2 \
  &= 10 dot 8 dot 9x^6 y^2 \
  &= bold(720x^6 y^2)
$









#pagebreak()
= Problem 24
Given the following statement:
$
  (P and not R) => (P or not Q)
$
Rewrite it in the contrapositive, converse, and inverse forms.

== Answer
- Contrapositive:
$
  bold(not(P or not Q) => not(P and not R))
$

- Converse:
$
  bold((P or not Q) => (P and not R))
$

- Inverse:
$
  bold(not(P and not R) => not(P or not Q))
$








#pagebreak()
= Problem 25
Given a set $A = {a,b,c,d}$ and its partition into the sets $B = {a,b}$ and $C = {c,d}$,
which of the following is the relation $R$ induced by the partition above on $A$?
+ $R = {(a,a), (a,b), (b,a), (b,b), (c,c), (c,d), (d,c), (d,d)}$
+ $R = {(a,b), (b,a), (b,b), (d,d)}$
+ $R = {(a,a), (b,b), (c,c), (d,d)}$
+ $R = {(a,b), (c,d)}$

== Answer
- Relations induced by the partition only contains pairs of elements that are in the same subset of the partition.
- *Thus, the first choice, $bold(R = {(a,a), (a,b), (b,a), (b,b), (c,c), (c,d), (d,c), (d,d)})$, is the answer.*









#pagebreak()
= Problem 26
Given functions defined from $RR -> RR$,
$
  f(x) &= 4x + 6 \
  g(x) &= x - 2 \
  h(x) &= x^2 + 2 \
$
Determine $f circle g$ and $h circle g$, simplified.

== Answer
$
  f circle g &= f(g(x)) \
  &=4(x-2) + 6 \
  &= 4x - 8 + 6 \
  &= bold(4x - 2) \ \ \

  h circle g &= h(g(x)) \
  &= (x-2)^2 + 2 \
  &= x^2 -4x + 4 + 2 \
  &= bold(x^2 -4x + 6)
$









#pagebreak()
= Problem 27
Let $A = {2,3,4,5,6}$, $B = {3,4,5,6,8}$, and $S$ be the divides relation defined as follows:
#align(center, [_For all $(x,y) in A times B$,_])
$
  x op(S) y <=> x divides y
$
+ Which ordered pairs are in $S$?
+ Which ordered pairs are in $S^(-1)$?

== Answer
$
  bold(
    S &= {(2,4), (2,6), (2,8), (3,3), (3,6), (4,4), (4,8), (5,5), (6,6)} \
    S^(-1) &= {(4,2), (6,2), (8,2), (3,3), (6,3), (4,4), (8,4), (5,5), (6,6)}
  )
$









#pagebreak()
= Problem 28
Given sets $A = {1,3,5,7,9,11}$, $B = {3,6,9}$, and $C = {2,4,6,8,10}$, evaluate the following expressions:
$
  A &union B \
  A &inter B \
  A &union C \
  A &inter C \
  A &-B \ 
  B &- A\
  C &union B \
  C &inter B \
$

== Answer
$
  A union B &= bold({1,3,5,6,7,9,11}) \ \

  A inter B &= bold({3, 9}) \ \

  A union C &= bold({1,2,3,4,5,6,7,8,9,10,11}) \ \

  A inter C &= bold(emptyset) \ \

  A - B &= bold({1, 5, 7, 11}) \ \

  B - A &= bold({6}) \ \

  C union B &= bold({2,3,4,6,8,9,10}) \ \

  C inter B &= bold({6})
$









#pagebreak()
= Problem 29
In a group of 470 college students, it is found that 164 like brussels sprouts, 194 like broccoli, 158 like cauliflower, 29 like both brussels sprouts and broccoli, 25 like both brussels sprouts and cauliflower, 24 like both broccoli and cauliflower, and 17 like all three.
+ How many students do not like any of these vegetables?
+ How many students like exactly one of these vegetables?
+ How many students only like cauliflower?
+ How many students like at least two types of vegetables?

== Answer
+ $164 + 194 + 158 - 29 - 25 - 24 + 17 = 455$ students who like vegetables. Thus, \ $470 - 455 = bold(15)$ *students do not like any of these vegetables.*
+ $(164 - 29 - 25 + 17) + (194 - 29 - 24 + 17) + (158 - 25 - 24 + 17) = bold(411)$ *students like exactly one of these vegetables.*
+ $158 - (25 - 17) - (24 - 17) - 17 = 158 - 25 - 24 + 17 = bold(126)$ *students only like cauliflower.*
+ $(29 - 17) + (25 - 17) + (24 - 17) + 17 = 29 + 25 + 24 - 34 = bold(44)$ *students like at least two types of vegetables.*










#pagebreak()
= Problem 30
Prove by contraposition that for all integers $n$, if $n$ is odd, then $5n-2$ is odd.

== Answer
- The contraposition is "For all integers $n$, if $5n-2$ is not odd, then $n$ is not odd."
- For all integers $n$, if $5n-2$ is even, then $n$ is even.
- By definition of even, $5n-2 = 2r$ for some integer $r$.
$
  5n-2 &= 2r \
  5n &= 2r+2 \
  5n &= 2(r+1)
$
- Because $ZZ$ is closed under addition, $(r+1)$ is an integer.
- Let $r+1 = s$ for some integer $s$.
- To be divisible by 5, let $s = 5k$ for some integer $k$.
$
  5n &= 2 dot 5k \
  n &= 2k
$
- By definition of even, $n$ is even.
- Thus, the contrapositive has been proven, so the original statement is proven.









#pagebreak()
= Problem 31
Prove the following using proof by induction:
#align(center, [_For all integers $k >= 2$,_])
$
  1 + 3 + 5 + 7 + dots.c + (2k-1) = k^2
$

== Answer
- Let $P(k)$ be the statement: "for all integers $k >= 2$, $1 + 3 + 5 + 7 + dots.c + (2k-1) = k^2$."
*Basis step:* _Show that P(2) is true._
- For $k = 2$,
$
  1 + 3 &= 2^2 \
  4 &= 4
$
- _Thus, the basis step has been proven._

*Inductive step:* 
- Suppose P(r) for all integers $r >= 2$. That is, 
$
  1 + 3 + 5 + 7 + dots.c + (2r-1) = r^2
$
- _Show that $P(r + 1)$ is true._
$
  1 + 3 + 5 + 7 + dots.c + (2(r+1)-1) &= 1 + 3 + 5 + 7 + dots.c + (2r+2-1) \
  &= 1 + 3 + 5 + 7 + dots.c + (2r+1) \
  &= 1 + 3 + 5 + 7 + dots.c + (2r-1) + (2r+1) \
  &= r^2 + 2r + 1 \
  &= (r+1)(r+1) \
  &= bold((r+1)^2)
$
- _Thus, the inductive step has been proven._

- Because both the basis step and inductive step have been proven, this statement has been proven true by induction.









#pagebreak()
= Problem 32
Given $X = {a,b,c}$, $Y = {1,2,3,4}$, and $Z = {s,t,u}$:
+ Define a one-to-one correspondence using ordered pairs.
+ Define a function that is onto but not one-to-one using ordered pairs.

== Answer
1. $f$: $X -> Z$
$
  bold(f = {(a,s), (b,t), (c,u)})
$

2. $g$: $Y -> Z$
$
  bold(g = {(1,s), (2,s), (3,t), (4,u)})
$