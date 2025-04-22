代码：递归版本
```
#lang sicp
(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner
          (term a)
          (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else
         (filtered-accumulate filter combiner null-value term (next a) next b))))

; a. sum of squares of the prime numbers
(define (term a) (square a))
(define (square n) (* n n))
(define (next a) (+ 1 a))

(define (prime? n) (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= 0 times) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= 0 exp) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        ((odd? exp)
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (sum-of-square-prime a b)
  (filtered-accumulate prime? + 0 term a next b))
```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
> (sum-of-square-prime 4 9)
74
```
