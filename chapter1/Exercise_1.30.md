代码：
```
#lang sicp
(define (sum term a next b)
 (define (iter a result)
   (if (> a b)
       result
       (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
```

结果和递归的形式是一样的：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
> (* 8 (pi-sum 1 1000))
3.139592655589782
> (* 8 (pi-sum 1 10000))
3.141392653591789
> (* 8 (pi-sum 1 100000))
3.141572653589808
> 
```
