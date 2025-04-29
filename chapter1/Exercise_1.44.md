1. 代码：
```LISP
#lang sicp
(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/
               (+ (f (- x dx))
                (f x)
                (f (+ x dx)))
               3)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))

; the below code is said to smooth f onece, and call the smoothed f n times.
;(define (n-fold-smoothed f n)
;(repeated (smooth f) n))

(define (n-fold-smoothed f n)
  (let ((n-times-smooth (repeated smooth n)))
    (n-times-smooth f)))

(define (square n) (* n n))
((smooth square) 5)

((n-fold-smoothed square 10) 5)
```

2. 结果如下
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
25.000000000066663
25.000000000666663
> 
```
