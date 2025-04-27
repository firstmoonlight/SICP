代码：
```
#lang sicp
(define (square x) (* x x))
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper a result)
    (if (= a 1)
         result
         (let ((i (- a 1)))
           (cont-frac-iter-helper i (/ (n i) (+ (d i) result))))))
  (cont-frac-iter-helper k 1))

(define (tan-cf x k)
  (define (N i) (if (= i 1)
                    x
                    (- (square x))))
  (define (D i) (- (* 2 i) 1))
  (exact->inexact (cont-frac-iter N D k)))

(tan-cf 10 100)
(tan-cf 25 100)


```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
0.6483608274590866
-0.13352640702153587
> 
```
