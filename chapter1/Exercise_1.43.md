1. 代码
根据提示，运用compose来组成一个对procedure的递归调用
```
#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))

(define (square n) (* n n))
((repeated square 2) 5)
```
2. 结果
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
625
> 
```
