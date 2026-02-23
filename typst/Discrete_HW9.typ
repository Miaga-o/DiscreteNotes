#set page("a4", numbering: "1 of 1")
#set text(font: "New Computer Modern Sans")
#show math.equation: set text(font: "New Computer Modern  Math")
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





= Chapter 9 Homework
== Problem  1
Prove that for all integers $n$, $k$, and $r$ for $r <= k <= n$ that
$
  binom(n, k) dot binom(k, r) = binom(n, r) dot binom(n-r, k-r)
$
=== Proof
$
  binom(n, k) dot binom(k, r) &= n! / (k! (n-k)!) dot k! / (r! (k-r)!) "by definition of combinations" \
  &= (n! k!) / (k! (n-k)! r! (k-r)!) "by multiplication" \
  &= n! / ((n-k)! r! (k-r)!) "by canceling out" k! \
  &= n! / (r! (n-k)! (k-r)!) "by commutative property"\
  &= (n! (n-r)!) / (r!(n-r!)(n-k)!(k-r)!) "by multiplying by" 1=(n-r)! / (n-r)! \
  &= n! / (r! (n-r)!) dot (n-r)! / ((k-r)! (n-k)! ) "by commutative property" \
  &= n! / (r! (n-r)!) dot (n-r)! / ((k-r)! (n-r-k+r)! ) "by adding" 0=r-r "to" (n-k)! \
  &= n! / (r! (n-r)!) dot (n-r)! / ((k-r)! (n-r-(k-r))! ) "by distributive property" \
  &= binom(n, r) dot binom(n-r, k-r) "by definition of combination"
$
_Assuming that these integers are all positive, multiplying by $(n-r)! slash (n-r)!$ works for $r <=k <=n$ because the recursive definition for factorial states that $0! = 1$._
#answer([1], [
  As shown in the proof above, by definition of equality
  $
    binom(n, k) dot binom(k, r) = binom(n, r) dot binom(n-r, k-r)
  $
])








#pagebreak()
== Problem 2
The binomial theorem states that for any real numbers $a$ and $b$,
$
  (a+b)^n = sum_(k=0)^(n)binom(n, k) a^(n-k) b^k "for any integer" n >= 0
$
Use this theorem to show that for any integer $n>=0$,
$
  sum_(k=0)^(n)(-1)^k binom(n,k) 3^(n-k) 2^k = 1
$

=== Proof
$
  sum_(k=0)^(n)(-1)^k binom(n,k) 3^(n-k) 2^k &= sum_(k=0)^(n) binom(n,k) 3^(n-k) 2^k (-1)^k "by commutative property" \
  &= sum_(k=0)^(n) binom(n,k) 3^(n-k) (2 dot (-1))^k "by distributive property" \
  &= sum_(k=0)^(n) binom(n,k) 3^(n-k) (-2)^k "by multiplication" \
  &= (3-2)^n "by the binomial theorem" \
  &= 1^n "by subtraction" \
  &= 1 "because 1 to any power is 1"
$

#answer([2], [
  As show in the proof above, by definition of equality
  $
    sum_(k=0)^(n)(-1)^k binom(n,k) 3^(n-k) 2^k = 1
  $
])