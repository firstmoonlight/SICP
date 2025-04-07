```Lisp
#lang sicp

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (mul a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (double (mul a (halve b))))
        ((odd? b)
         (+ a (mul a (- b 1))))))
```
