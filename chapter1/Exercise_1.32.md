代码：
```
#lang sicp
; recursive version
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; iterative version
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

// test code
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (inc n) (+ n 1))
(define (sum-cubes a b)
 (sum-iter cube a inc b))
(define (cube n) (* n n n))
```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
> (sum-cubes 1 10)
3025
> 
```
