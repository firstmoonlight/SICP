1. 代码
按照题目的提示顺序写出即可
```
#lang sicp
(define (square x) (* x x))
(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)
```

2. 结果
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
49
> 
```
