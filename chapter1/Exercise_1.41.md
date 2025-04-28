代码：
```
#lang sicp
(define (double f)
  (lambda (x) (f (f x))))

((double inc) 3)
(newline)
(((double (double double)) inc) 5)
```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
5

21
> 
```
