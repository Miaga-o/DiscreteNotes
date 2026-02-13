#set page("a4", numbering: "1 of 1")
#set text(font: "New Computer Modern Sans")
#show math.equation: set text(font: "New Computer Modern Sans Math")
#show title: set text(size: 24pt)
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 2): set text(size: 18pt)
#show heading.where(level: 3): set text(size: 16pt)


#let answer(num, body) = {
  box(
    stroke: blue,
    inset: 8pt,
    radius: 10pt,
    width: 100%,
    [#text(fill: blue, size: 14pt, [*Problem #num Answer:*]) \
    #body]
  )
}
#let conclusion(body) = {
  box(
    stroke: black,
    inset: 3pt,
    [#body]
  )
}





= Chapter 8 Homework
== Problem  1
Let $RR$ be the relation defined on the set of all integers $ZZ$ as follows:

#set align(center)
_For all integers $m$ and $n$_
$
  m op(R) n <=> 5 divides (m-n)
$
#set align(left)

=== Proof
Prove that $R$ is an equivalence relation.

_Showing that $R$ is reflexive:_
- Suppose that $m$ is any integer. \
$
  m-m &= 0 "by algebra"
$
- By definition of divisibility, $5$ divides $0$ because $0 = 5 dot 0$: \
$
  5 divides 0
$
- Hence, by definition of $R$, $m op(R) m$. \
- #conclusion([$R$ is reflexive.]) \ \

_Showing that $R$ is symmetric:_ \
- Suppose that $m$ and $n$ are any integers such that
$
  m op(R) n
$
- By definition of $R$, $5 divides (m - n)$. \
- By definition of divisibility, $m-n = 5 k$ for some integer $k$. \
$
  m-n &= 5k \
  -m+n &= -5k "by multiplying both sides by -1" \
  n-m &= -5k "by commutative property" \
  n-m &= 5(-k) "by associative property" \
$
- Because $ZZ$ is closed under multiplication, $(-k)$ is an integer. \
- Thus, by definition of divisibility, $5 divides (n-m)$. \
- Hence, $n op(R) m$. \
- #conclusion([$R$ is symmetric.]) \ \

_Showing that $R$ is transitive:_
- Suppose that $m$, $n$, and $p$ are any integers such that
$
  m op(R) n "and" n op(R) p
$
- By definition of $R$, $5 divides (m-n)$ and $5 divides (n-p)$. \
- By definition of divisibility, $m-n=5r$ and $n-p=5s$ for some integers $r$ and $s$.
$
  (m-n) + (n-p) &= 5r+5s "by adding both equalities" \
  m - p &= 5r+5s "by algebra" \
  m - p &= 5(r+s) "by distributive property" 
$
- Because $ZZ$ is closed under addition, $(r+s)$ is an integer. \
- Thus, by definition of divisibility, $5 divides (m -p)$. \
- Hence, $m op(R) p$. \
- #conclusion([$R$ is transitive.])

#answer([1], [
  Because $R$ is reflexive, symmetric, and transitive, it is an equivalence relation.  
])










#pagebreak()
== Problem 2
Let $S$ be the set of all strings of $0$s and $1$s of length $3$. Define a relation $R$ on $S$ as follows:

#set align(center)
_For all strings $s$ and $t in S$_,
$
  s op(R) t <=> "the two left-most characters of" s "are the same as the two left-most characters of" t
$
#set align(left)

=== Proof
Prove that $R$ is an equivalence relation on $S$.

_Showing that $R$ is reflexive:_
- Suppose $s$ is any string in $S$. \
- Logically, it follows that the two left-most characters in $s$ are also the two left-most charaters in $s$. \
- Hence, $s op(R) s$. \
- #conclusion([$R$ is reflexive.]) \ \

_Showing that $R$ is symmetric:_
- Suppose that $s$ and $t$ are any strings in $S$ such that
$
  s op(R) t
$
- By definition of $R$, the two left-most characters in $s$ are the same as the two left-most characters in $t$. \
- Logically, it follows that the two left-most characters in $t$ are the same as the two left-most characters in $s$. \
- Hence, $t op(R) s$. \
- #conclusion([$R$ is symmetric.]) \ \

_Showing that $R$ is transitive:_
- Suppose that $s$, $t$, and $u$ are any strings in $S$ such that
$
  s op(R) t "and" t op(R) u
$
- By definition of $R$, the two left-most characters in $s$ are the same as the two left-most characters in $t$, and the two left-most characters in $t$ are the same as the two left-most characters in $u$. \
- Logically, it follows that the two left-most characters in $s$ are also the same as the two left-most characters in $u$.
- Hence, $s op(R) u$.
- #conclusion([$R$ is transitive.])

#answer([2], [
  Because $R$ is reflexive, symmetric, and transitive, it is an equivalence relation on $S$.
])