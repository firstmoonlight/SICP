代码：
我们先定义h,在定义yk和factor，最后定义term以及next，应用到sum函数中，即得到最后的代码。
```
#lang sicp
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (factor k)
    (cond ((or (= 0 k) (= n k)) 1)
          ((even? k) 2)
          (else 4)))
  (define (term k)
    (* (factor k) (y k)))
  (define (next k)
    (+ k 1))
  (if (not (even? n))
      (error "n can not be odd")
      (* (/ h 3)
         (sum term (exact->inexact 0) next n))))

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))  
```

结果验证：
```
> (define (cube x)
          (* x x x))
> (simpson cube 0 1 100)
0.24999999999999992
> (simpson cube 0 1 1000)
0.2500000000000003
> 
```
