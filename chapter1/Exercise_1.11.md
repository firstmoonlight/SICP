
```Lisp
#lang sicp
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f1 n)
  (f-iter n 0 0 1 2))

(define (f-iter n count a b c)
  (if (<= n count)
      a
      (f-iter n (+ 1 count) b c (+ c (* 2 b) (* 3 a)))))
  
(f1 5)

```
